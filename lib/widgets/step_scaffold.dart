import 'package:flutter/material.dart';

/// One wizard step: the choice above, „Nechat“ and the way on below.
class StepScaffold extends StatelessWidget {
  const StepScaffold({
    super.key,
    required this.title,
    required this.children,
    required this.onKeep,
    required this.onNext,
    this.error,
    this.issue,
  });

  final String title;
  final List<Widget> children;
  final VoidCallback onKeep;

  /// Null keeps the button disabled.
  final VoidCallback? onNext;
  final String? error;

  /// Why the whole step is closed on this photo; replaces the choice.
  final String? issue;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: issue != null
                  ? Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(issue!, style: TextStyle(color: scheme.error)),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: children,
                    ),
            ),
            if (error != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(error!, style: TextStyle(color: scheme.error)),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  TextButton(onPressed: onKeep, child: const Text('Nechat')),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: onNext,
                      child: const Text('Další'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A heading and a wrap of style cards.
class StyleSection extends StatelessWidget {
  const StyleSection({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 8),
        child: Text(title, style: Theme.of(context).textTheme.titleSmall),
      ),
      Wrap(spacing: 8, runSpacing: 8, children: children),
    ],
  );
}
