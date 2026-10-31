import 'package:flutter/material.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../services/plan_builder.dart';

/// Motion presets: seconds and minutes apart, each with its price. The price
/// is the plan's own, so it cannot drift from what the server charges.
class MotionSheet extends StatelessWidget {
  const MotionSheet({
    super.key,
    required this.motions,
    required this.clipId,
    this.remaining,
  });

  final List<Motion> motions;
  final String clipId;

  /// Generations left, when known.
  final int? remaining;

  static Future<Motion?> show(
    BuildContext context,
    List<Motion> motions,
    String clipId, {
    int? remaining,
  }) => showModalBottomSheet<Motion>(
    context: context,
    isScrollControlled: true,
    builder: (_) =>
        MotionSheet(motions: motions, clipId: clipId, remaining: remaining),
  );

  Widget _tile(BuildContext context, Motion m) {
    final cost = clipPlan(clipId, m).cost;
    final slow = m.engine == MotionEngine.wan;
    return ListTile(
      title: Text(m.cs),
      subtitle: Text(
        slow
            ? 'Klip ${m.seconds.round()} s, render kolem 20 minut'
            : 'Klip ${m.seconds.round()} s',
      ),
      trailing: Text('Stojí $cost'),
      enabled: remaining == null || cost <= remaining!,
      onTap: () => Navigator.of(context).pop(m),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final fast = motions.where((m) => m.engine == MotionEngine.live).toList();
    final slow = motions.where((m) => m.engine == MotionEngine.wan).toList();
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          if (remaining != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text('Zbývá ti $remaining generací.'),
            ),
          if (fast.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Rychlé, během sekund', style: text.titleSmall),
            ),
            for (final m in fast) _tile(context, m),
          ],
          if (slow.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Text('Pomalé, desítky minut', style: text.titleSmall),
            ),
            for (final m in slow) _tile(context, m),
          ],
        ],
      ),
    );
  }
}
