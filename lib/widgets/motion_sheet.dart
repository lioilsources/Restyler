import 'package:flutter/material.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

/// Motion presets, seconds and minutes apart.
class MotionSheet extends StatelessWidget {
  const MotionSheet({
    super.key,
    required this.motions,
    required this.clipId,
  });

  final List<Motion> motions;
  final String clipId;

  static Future<Motion?> show(
    BuildContext context,
    List<Motion> motions,
    String clipId,
  ) => showModalBottomSheet<Motion>(
    context: context,
    isScrollControlled: true,
    builder: (_) =>
        MotionSheet(motions: motions, clipId: clipId),
  );

  Widget _tile(BuildContext context, Motion m) {
    final slow = m.engine == MotionEngine.wan;
    return ListTile(
      title: Text(m.cs),
      subtitle: Text(
        slow
            ? 'Klip ${m.seconds.round()} s, render kolem 20 minut'
            : 'Klip ${m.seconds.round()} s',
      ),
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
