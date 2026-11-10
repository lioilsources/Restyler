import 'dart:io';

import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../theme.dart';

enum TileState { waiting, ready, failed }

/// A print on the white paper. The caption sits on the paper, as on a strip.
class FrameTile extends StatelessWidget {
  const FrameTile({
    super.key,
    required this.label,
    required this.state,
    this.file,
    this.onAnimate,
    this.hasClip = false,
    this.onPlay,
  });

  final String label;
  final TileState state;
  final String? file;

  /// „Oživit“; null hides it.
  final VoidCallback? onAnimate;
  final bool hasClip;
  final VoidCallback? onPlay;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BoothColors.paper,
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ColoredBox(
                  color: const Color(0xFFE6ECEB),
                  child: switch (state) {
                    TileState.ready => Image.file(
                      File(file!),
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const SizedBox.shrink(),
                    ),
                    TileState.waiting => const Center(
                      child: SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: BoothColors.curtain,
                        ),
                      ),
                    ),
                    TileState.failed => const Center(
                      child: Icon(
                        Icons.broken_image_outlined,
                        color: BoothColors.curtain,
                      ),
                    ),
                  },
                ),
                if (hasClip)
                  Center(
                    child: IconButton.filled(
                      tooltip: context.l10n.playClip,
                      onPressed: onPlay,
                      icon: const Icon(Icons.play_arrow),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: BoothColors.ink, fontSize: 13),
            ),
          ),
          if (onAnimate != null)
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: BoothColors.curtain,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 32),
                ),
                onPressed: onAnimate,
                child: Text(context.l10n.animate),
              ),
            ),
        ],
      ),
    );
  }
}
