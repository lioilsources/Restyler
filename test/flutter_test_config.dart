import 'dart:async';
import 'dart:ui';

import 'package:restyler/l10n/l10n.dart';

/// The expectations in the suite are Czech: pin the language that code without
/// a BuildContext (providers, services) reads.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  debugLocale = const Locale('cs');
  await testMain();
}
