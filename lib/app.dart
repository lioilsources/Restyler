import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'l10n/app_localizations.dart';
import 'providers/booth_provider.dart';
import 'screens/home_screen.dart';
import 'theme.dart';

class RestylerApp extends ConsumerStatefulWidget {
  const RestylerApp({super.key});

  @override
  ConsumerState<RestylerApp> createState() => _RestylerAppState();
}

class _RestylerAppState extends ConsumerState<RestylerApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(ref.read(boothProvider.notifier).resumeAll());
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(ref.read(boothProvider.notifier).resumeAll());
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Restyler',
    theme: boothTheme(),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: const HomeScreen(),
  );
}
