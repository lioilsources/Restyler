import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'providers/core_providers.dart';
import 'services/project_files.dart';
import 'services/project_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final store = await HiveProjectStore.open();
  final support = await getApplicationSupportDirectory();
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
