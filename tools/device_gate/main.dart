// Parser gate on a real phone: the app's own `OnnxFaceParser` and bundled
// models, without a server. Run it with `make device-gate DEVICE=<name>`, always
// in profile: a debug build times the Dart half about ten times too slow.
//
// One `GATE {json}` line per provider. Passes when a parse fits 8 s (Prompts/04-TEST-telefon.md)
// and the class maps match the PyTorch golden of `make_fixture.py`. A parse is
// what a selfie costs: both sessions load, run and close every time.
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_onnxruntime/flutter_onnxruntime.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:restyler/services/onnx_face_parser.dart';

import 'fixture.g.dart';

const kMaxParseMs = 8000;
const kMinAgreement = 0.999;
const kRepeats = 3;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: _Gate()));
}

int get _rssMb => ProcessInfo.currentRss ~/ (1 << 20);
int get _peakMb => ProcessInfo.maxRss ~/ (1 << 20);

double _agreement(Uint8List parsed, String goldenPng) {
  final golden = img.decodePng(base64Decode(goldenPng))!;
  var same = 0, i = 0;
  for (final p in golden) {
    if (p.r.toInt() == parsed[i++]) same++;
  }
  return same / parsed.length;
}

Future<void> _dropUnpackedModels() async {
  final tmp = await getTemporaryDirectory();
  for (final asset in [kFaceModelAsset, kClothesModelAsset]) {
    final file = File('${tmp.path}/${asset.split('/').last}');
    if (file.existsSync()) file.deleteSync();
  }
}

Future<Map<String, Object?>> _measure(
  List<OrtProvider> providers,
  Uint8List photo,
  void Function(Map<String, Object?>) log,
) async {
  final parser = OnnxFaceParser(providers: providers);
  final row = <String, Object?>{
    'providers': [for (final p in providers) p.name],
  };
  try {
    final sw = Stopwatch()..start();
    var parse = await parser.parse(photo);
    row['first_with_unpack_ms'] = sw.elapsedMilliseconds;
    log({'stage': 'first parse', 'rss_mb': _rssMb, 'peak_mb': _peakMb});

    final runs = <int>[];
    for (var i = 0; i < kRepeats; i++) {
      sw.reset();
      parse = await parser.parse(photo);
      runs.add(sw.elapsedMilliseconds);
    }
    row['parse_ms'] = runs;
    final sorted = [...runs]..sort();
    final median = sorted[sorted.length ~/ 2];
    row['parse_median_ms'] = median;

    final face = _agreement(parse.face, kGoldenFacePng);
    final clothes = _agreement(parse.clothes!, kGoldenClothesPng);
    row['face_agreement'] = face;
    row['clothes_agreement'] = clothes;
    row['pass'] =
        median <= kMaxParseMs &&
        face >= kMinAgreement &&
        clothes >= kMinAgreement;
  } catch (e) {
    row['error'] = '$e';
    row['pass'] = false;
  }
  row['peak_rss_mb'] = _peakMb;
  return row;
}

class _Gate extends StatefulWidget {
  const _Gate();

  @override
  State<_Gate> createState() => _GateState();
}

class _GateState extends State<_Gate> {
  final _lines = <String>[];
  File? _results; // run.sh pulls this: wireless iOS gives no reliable console

  void _log(Map<String, Object?> row) {
    final line = jsonEncode(row);
    if (!mounted) return;
    // ignore: avoid_print
    print('GATE $line');
    _results?.writeAsStringSync('$line\n', mode: FileMode.append);
    setState(() => _lines.add(line));
  }

  @override
  void initState() {
    super.initState();
    _run();
  }

  Future<void> _run() async {
    final docs = await getApplicationDocumentsDirectory();
    _results = File('${docs.path}/device_gate.jsonl')..writeAsStringSync('');
    final photo = base64Decode(kSourcePng);
    final available = await OnnxRuntime().getAvailableProviders();
    _log({
      'os': Platform.operatingSystemVersion,
      'available': [for (final p in available) p.name],
      'rss_start_mb': _rssMb,
    });

    await _dropUnpackedModels();
    final accelerator = Platform.isIOS
        ? OrtProvider.CORE_ML
        : OrtProvider.NNAPI;
    final passes = <bool>[];
    for (final providers in [
      [OrtProvider.CPU],
      if (available.contains(accelerator)) [accelerator, OrtProvider.CPU],
    ]) {
      final row = await _measure(providers, photo, _log);
      passes.add(row['pass'] == true);
      _log(row);
    }
    _log({'done': true, 'any_pass': passes.contains(true)});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          if (_lines.isEmpty) const Text('Měřím…'),
          for (final l in _lines) SelectableText(l),
        ],
      ),
    ),
  );
}
