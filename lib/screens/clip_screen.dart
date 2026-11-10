import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../l10n/l10n.dart';

/// A finished clip, looping.
class ClipScreen extends StatefulWidget {
  const ClipScreen({super.key, required this.path, required this.title});

  final String path;
  final String title;

  @override
  State<ClipScreen> createState() => _ClipScreenState();
}

class _ClipScreenState extends State<ClipScreen> {
  late final VideoPlayerController _video;
  String? _error;

  @override
  void initState() {
    super.initState();
    _video = VideoPlayerController.file(File(widget.path));
    _video
        .initialize()
        .then((_) async {
          await _video.setLooping(true);
          await _video.play();
          if (mounted) setState(() {});
        })
        .catchError((Object _) {
          if (mounted) setState(() => _error = deviceL10n.clipCantPlay);
        });
  }

  @override
  void dispose() {
    _video.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await Gal.putVideo(widget.path);
      messenger.showSnackBar(SnackBar(content: Text(deviceL10n.clipSaved)));
    } on GalException {
      messenger.showSnackBar(
        SnackBar(content: Text(deviceL10n.clipSaveFailed)),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
      actions: [
        IconButton(
          tooltip: context.l10n.saveToPhotos,
          onPressed: _save,
          icon: const Icon(Icons.download),
        ),
        IconButton(
          tooltip: context.l10n.share,
          onPressed: () => SharePlus.instance.share(
            ShareParams(files: [XFile(widget.path)]),
          ),
          icon: const Icon(Icons.ios_share),
        ),
      ],
    ),
    body: Center(
      child: _error != null
          ? Text(_error!)
          : _video.value.isInitialized
          ? AspectRatio(
              aspectRatio: _video.value.aspectRatio,
              child: VideoPlayer(_video),
            )
          : const CircularProgressIndicator(),
    ),
  );
}
