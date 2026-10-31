import 'package:flutter_test/flutter_test.dart';
import 'package:restyler/data/mixes.dart';
import 'package:restyler/services/plan_builder.dart';
import 'package:restyler/screens/styles_step.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

void main() {
  test('every id of every mix is in the catalog', () {
    for (final mix in kStyleMixes) {
      for (final f in mix.frames) {
        expect(restyleStyleById(f.styleId), isNotNull, reason: '${mix.id}: ${f.styleId}');
      }
    }
  });

  test('every mix fills the largest booth without repeating a style', () {
    final largest = kFrameCounts.reduce((a, b) => a > b ? a : b);
    for (final mix in kStyleMixes) {
      expect(mix.frames.length, greaterThanOrEqualTo(largest), reason: mix.id);
      expect(
        mix.frames.map((f) => f.styleId).toSet().length,
        mix.frames.length,
        reason: mix.id,
      );
    }
  });

  test('mixes have distinct ids and labels', () {
    expect(kStyleMixes.map((m) => m.id).toSet().length, kStyleMixes.length);
    expect(kStyleMixes.map((m) => m.label).toSet().length, kStyleMixes.length);
    expect(kStyleMixes, isNotEmpty);
  });

  test('every mix makes a valid plan at every K', () {
    for (final mix in kStyleMixes) {
      for (final k in kFrameCounts) {
        final plan = assemblePlan(
          width: 8,
          height: 8,
          frames: mix.frames.take(k).toList(),
        );
        expect(plan.cost, k);
      }
    }
  });
}
