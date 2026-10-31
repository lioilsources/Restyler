import 'dart:async';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:restyler/services/model_store.dart';

const _size = 2 << 20;

/// What `_serving` sends.
final _body = [...List.filled(_size ~/ 2, 1), ...List.filled(_size - _size ~/ 2, 2)];
final _sha = sha256.convert(_body).toString();

http.Client _serving(
  void Function(http.BaseRequest) seen, {
  int status = 200,
  String type = 'application/octet-stream',
  int? declared,
  int size = _size,
}) => MockClient.streaming((request, _) async {
  seen(request);
  return http.StreamedResponse(
    Stream.fromIterable([
      List.filled(size ~/ 2, 1),
      List.filled(size - size ~/ 2, 2),
    ]),
    status,
    contentLength: declared ?? size,
    headers: {'content-type': type},
  );
});

void main() {
  late Directory dir;
  setUp(() => dir = Directory.systemTemp.createTempSync('models'));
  tearDown(() => dir.deleteSync(recursive: true));

  ModelStore store(http.Client client, {Future<void> Function(String)? backup}) =>
      ModelStore(
        client: client,
        baseUrl: 'https://api.test/',
        headers: const {'CF-Access-Client-Id': 'id'},
        directory: () async => dir.path,
        files: [ModelFile('a.fp16', _sha), ModelFile('b.fp16', _sha)],
        excludeFromBackup: backup,
      );

  String named(String stem) => '$stem.${_sha.substring(0, 8)}.onnx';

  test('downloads what is missing, with CF headers and progress', () async {
    final urls = <String>[];
    final headers = <Map<String, String>>[];
    final excluded = <String>[];
    final s = store(
      _serving((r) {
        urls.add(r.url.toString());
        headers.add(r.headers);
      }),
      backup: (p) async => excluded.add(p),
    );
    expect(await s.ready, isFalse);
    final progress = <double>[];
    await s.ensure(onProgress: progress.add);
    expect(urls, [
      'https://api.test/models/${named('a.fp16')}',
      'https://api.test/models/${named('b.fp16')}',
    ]);
    expect(excluded, hasLength(2));
    expect(headers.first['CF-Access-Client-Id'], 'id');
    expect(progress.first, lessThan(0.5));
    expect(progress.last, 1);
    expect(progress, orderedEquals([...progress]..sort()));
    expect(await s.ready, isTrue);
    expect(File('${dir.path}/${named('a.fp16')}').lengthSync(), _size);
  });

  test('a cached model is not fetched again', () async {
    File('${dir.path}/${named('a.fp16')}').writeAsBytesSync([1]);
    File('${dir.path}/${named('b.fp16')}').writeAsBytesSync([1]);
    var calls = 0;
    await store(_serving((_) => calls++)).ensure();
    expect(calls, 0);
  });

  test('the shipped models are pinned, fp16, with the digest in the name', () {
    for (final f in kParserModels) {
      expect(f.pinned, isTrue);
      expect(f.name, contains('.fp16.${f.sha256.substring(0, 8)}.onnx'));
    }
  });

  test('bytes that miss the digest are thrown away', () async {
    final wrong = '0' * 64;
    final s = ModelStore(
      client: _serving((_) {}),
      baseUrl: 'https://api.test',
      headers: const {},
      directory: () async => dir.path,
      files: [ModelFile('a.fp16', wrong)],
    );
    await expectLater(
      s.ensure(),
      throwsA(isA<ModelException>().having((e) => e.message, 'message', contains('otisk'))),
    );
    expect(dir.listSync(), isEmpty);
  });

  test('a build without digests refuses to download', () async {
    var calls = 0;
    final s = ModelStore(
      client: _serving((_) => calls++),
      baseUrl: 'https://api.test',
      headers: const {},
      directory: () async => dir.path,
      files: const [ModelFile('a.fp16', '')],
    );
    await expectLater(
      s.ensure(),
      throwsA(isA<ModelException>().having((e) => e.message, 'message', contains('otisky'))),
    );
    expect(calls, 0);
    expect(await s.ready, isFalse);
  });

  test('a new version replaces the old file', () async {
    final old = File('${dir.path}/a.fp16.deadbeef.onnx')..writeAsBytesSync([1]);
    await store(_serving((_) {})).ensure();
    expect(old.existsSync(), isFalse);
    expect(dir.listSync(), hasLength(2));
  });

  test('offline without a model is a clear Czech error', () async {
    final s = store(
      MockClient((_) async => throw http.ClientException('no route')),
    );
    await expectLater(
      s.ensure(),
      throwsA(isA<ModelException>().having((e) => e.message, 'message', kModelOfflineText)),
    );
    expect(await s.ready, isFalse);
  });

  test('the Access login page is not a model', () async {
    final s = store(_serving((_) {}, type: 'text/html; charset=utf-8'));
    await expectLater(
      s.ensure(),
      throwsA(isA<ModelException>().having((e) => e.message, 'message', contains('Cloudflare'))),
    );
    expect(await s.ready, isFalse);
  });

  test('a server error names the status', () async {
    final s = store(_serving((_) {}, status: 403));
    await expectLater(
      s.ensure(),
      throwsA(isA<ModelException>().having((e) => e.message, 'message', contains('403'))),
    );
  });

  test('a cut download leaves nothing behind', () async {
    final s = store(_serving((_) {}, declared: _size * 2));
    await expectLater(s.ensure(), throwsA(isA<ModelException>()));
    expect(await s.ready, isFalse);
    expect(dir.listSync(), isEmpty);
  });

  test('a tiny answer without a length is refused', () async {
    final s = store(_serving((_) {}, size: 100));
    await expectLater(s.ensure(), throwsA(isA<ModelException>()));
    expect(dir.listSync(), isEmpty);
  });

  test('a stream dropping mid-file counts as offline and cleans up', () async {
    final s = store(
      MockClient.streaming((_, _) async {
        final c = StreamController<List<int>>();
        c.add([1, 2]);
        c.addError(http.ClientException('reset'));
        unawaited(c.close());
        return http.StreamedResponse(c.stream, 200, contentLength: _size);
      }),
    );
    await expectLater(
      s.ensure(),
      throwsA(isA<ModelException>().having((e) => e.message, 'message', kModelOfflineText)),
    );
    expect(dir.listSync(), isEmpty);
  });
}
