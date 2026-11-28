import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'l10n/app_localizations.dart';
import 'providers/core_providers.dart';
import 'services/project_files.dart';
import 'services/project_store.dart';
import 'telemetry/telemetry_dictionary.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final store = await HiveProjectStore.open();
  final support = await getApplicationSupportDirectory();
  // Anonymous usage statistics (docs/telemetry.md). Silent without
  // TELEMETRY_KEY and TELEMETRY_HOST; never sees a photo, prompt or result.
  unawaited(
    Telemetry.init(
      app: 'restyler',
      appVersion: kAppVersion,
      dictionary: restylerDictionary,
      store: FileTelemetryStore('${support.path}/telemetry'),
      lang: () => telemetryLocaleId(
        basicLocaleListResolution(
          PlatformDispatcher.instance.locales,
          AppLocalizations.supportedLocales,
        ),
      ),
      tester: const bool.fromEnvironment('TELEMETRY_TESTER'),
      hadDataBefore: () => store.all().isNotEmpty,
    ),
  );
  runApp(
    ProviderScope(
      overrides: [
        projectStoreProvider.overrideWithValue(store),
        projectFilesProvider.overrideWithValue(IoProjectFiles(support.path)),
      ],
      child: const RestylerApp(),
    ),
  );
}
