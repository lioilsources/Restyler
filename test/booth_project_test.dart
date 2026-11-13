import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restyler/models/booth_project.dart';
import 'package:restyler/services/plan_builder.dart';
import 'package:restyler/services/project_store.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

final _mask = Uint8List.fromList([137, 80, 78, 71]);

BuiltEdit _edit() => BuiltEdit(
  prompt: 'edit',
  negative: 'no',
  mask: _mask,
  width: 10,
  height: 20,
);

BoothProject _project({BuiltEdit? hair}) {
  const frames = [
    BoothFrame(styleId: 'anime', medium: RestyleMedium.illustration),
    BoothFrame(styleId: 'noir', medium: RestyleMedium.photo),
  ];
  final plan = assemblePlan(width: 10, height: 20, hair: hair, frames: frames);
  return BoothProject(
    id: 'p1',
    createdAt: DateTime.utc(2026, 10, 31, 12),
    selfiePath: 'projects/p1/source.jpg',
    hairStyleId: 'bob',
    hairColourId: 'ash-blonde',
    frames: frames,
    run: BoothRun(
      id: kMainRun,
      plan: plan.toJson(),
      sourcePath: 'projects/p1/source.jpg',
      status: RunStatus.running,
      jobId: 'j1',
    ),
    stepPaths: const {'hair': 'projects/p1/hair.png'},
    clips: const [
      BoothRun(
        id: 'm1',
        plan: [
          {'id': 'm1', 'graph': 'live_portrait', 'input': 'source', 'motion': 'alive'},
        ],
        sourcePath: 'projects/p1/hair.png',
        status: RunStatus.lost,
        frameKey: 'hair',
        motionId: 'alive',
      ),
    ],
  );
}

void main() {
  test('survives JSON text, plan and mask included', () {
    final p = _project(hair: _edit());
    final back = BoothProject.fromJson(
      jsonDecode(jsonEncode(p.toJson())) as Map<String, dynamic>,
    );
    expect(jsonEncode(back.toJson()), jsonEncode(p.toJson()));
    final plan = RenderPlan.fromJson(back.run.plan);
    expect(plan.steps.first.id, 'hair');
    expect(plan.steps.first.mask, _mask);
    expect(plan.cost, 3);
    expect(back.status, RunStatus.running);
    expect(back.jobId, 'j1');
    expect(back.clips.single.status, RunStatus.lost);
    expect(back.frames.last.medium, RestyleMedium.photo);
  });

  test('paths stay relative: iOS moves the container on update', () {
    final p = _project();
    expect(p.selfiePath.startsWith('/'), isFalse);
    for (final path in p.stepPaths.values) {
      expect(path.startsWith('/'), isFalse);
    }
  });

  test('frame 0 is the last edit in the plan', () {
    final with_ = _project(hair: _edit());
    expect(with_.frameZeroKey, 'hair');
    expect(with_.tiles().map((t) => t.key), ['hair', 's1', 's2']);
    expect(with_.tiles().first.label, 'Nový vzhled');
    expect(with_.pathOf('hair'), 'projects/p1/hair.png');
  });

  test('frame 0 is the selfie without edits', () {
    final p = _project();
    expect(p.frameZeroKey, kSelfieKey);
    expect(p.tiles().first.label, 'Selfie');
    expect(p.pathOf(kSelfieKey), p.selfiePath);
  });

  test('frame 0 follows the last edit whichever it is', () {
    final plan = assemblePlan(
      width: 10,
      height: 20,
      beard: _edit(),
      glasses: _edit(),
    );
    final p = BoothProject(
      id: 'p',
      createdAt: DateTime(2026),
      selfiePath: 's',
      run: BoothRun(
        id: kMainRun,
        plan: plan.toJson(),
        sourcePath: 's',
        status: RunStatus.done,
      ),
    );
    expect(p.frameZeroKey, kGlassesStep);
    expect(p.tiles(), hasLength(1));
  });

  test('clip ids are never reused', () {
    final p = _project();
    expect(p.nextClipId(), 'm2');
    expect(p.runById('m1')!.motionId, 'alive');
    expect(p.runById(kMainRun), same(p.run));
    expect(p.runById('nope'), isNull);
  });

  test('withRun swaps the right run', () {
    final p = _project();
    final clip = p.clips.single.copyWith(status: RunStatus.done, jobId: null);
    expect(p.withRun(clip).clips.single.status, RunStatus.done);
    expect(p.withRun(clip).run.status, RunStatus.running);
    final main = p.run.copyWith(status: RunStatus.lost, jobId: null, error: 'x');
    expect(p.withRun(main).status, RunStatus.lost);
    expect(p.withRun(main).jobId, isNull);
  });

  test('only finished-short runs can run again', () {
    expect(
      RunStatus.values.where((s) => s.canRetry),
      [RunStatus.partial, RunStatus.failed, RunStatus.rejected, RunStatus.lost],
    );
  });

  test('Hive box keeps projects newest first', () async {
    final dir = Directory.systemTemp.createTempSync('hive');
    addTearDown(() => dir.deleteSync(recursive: true));
    Hive.init(dir.path);
    final store = await HiveProjectStore.open();
    final older = _project();
    final newer = BoothProject(
      id: 'p2',
      createdAt: DateTime.utc(2027),
      selfiePath: 's',
      run: older.run,
    );
    await store.save(older);
    await store.save(newer);
    expect(store.all().map((p) => p.id), ['p2', 'p1']);
    await store.delete('p2');
    expect(store.all().single.run.jobId, 'j1');
    await Hive.close();
  });
}
