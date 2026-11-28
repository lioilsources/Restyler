import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:ol1n_telemetry/ol1n_telemetry.dart';
import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../l10n/app_localizations.dart';
import '../services/photo.dart';

/// The app version this build reports; `test/telemetry_test.dart` keeps it
/// equal to `version:` in `pubspec.yaml`.
const kAppVersion = '1.0.0';

/// Route name → screen. Every push names its route (`RouteSettings`);
/// unnamed routes report `other`, sheets and dialogs do not change it.
const kScreenRoutes = {
  '/': 'home',
  '/selfie': 'selfie',
  '/beard': 'beard',
  '/glasses': 'glasses',
  '/hair': 'hair',
  '/styles': 'styles',
  '/booth': 'booth',
  '/clip': 'clip',
};

/// A catalog id as it is reported: ids outside the catalog are `other`.
String catalogValue(String? id, Set<String> known) =>
    id == null ? 'none' : (known.contains(id) ? id : 'other');

final kTelemetryStyleIds = {for (final s in kRestyleStyles) s.id};
final kTelemetryLookIds = {
  for (final b in kBeards) b.id,
  for (final g in kGlasses) g.id,
  for (final h in kHairstyles) h.id,
  kKeepCutId,
};
final kTelemetryColourIds = {for (final c in kHairColours) c.id};
final kTelemetryMotionIds = {for (final m in kMotions) m.id};

/// Why a mask could not be built (`HairMaskException.code`).
const kMaskErrorKinds = {
  'no_face',
  'face_too_small',
  'mask_too_small',
  'mouth_not_visible',
  'no_beard_to_shave',
  'eyes_not_visible',
  'mask_too_large',
  'no_glasses_to_remove',
};

/// The kind of an error from the selfie analysis or a wizard pick.
String analysisErrorKind(Object e) => switch (e) {
  HairMaskException(:final code) when kMaskErrorKinds.contains(code) => code,
  HairMaskException() => 'mask_other',
  PhotoException() => 'photo',
  _ => 'analysis',
};

/// The kind of an error the render backend or the network threw.
String backendErrorKind(Object e) {
  if (e is BackendException) {
    return switch (e.statusCode) {
      429 => 'busy',
      401 || 403 => 'auth',
      404 => 'not_found',
      422 => 'plan_rejected',
      _ => 'server',
    };
  }
  if (_offline(e)) return 'offline';
  return 'other';
}

/// `restyle_end.result` for a render the server did not take.
String backendRefusalResult(Object e) {
  if (e is BackendException) {
    return switch (e.statusCode) {
      429 => 'refused',
      401 || 403 || 422 => 'rejected',
      _ => 'error',
    };
  }
  return _offline(e) ? 'timeout' : 'error';
}

bool _offline(Object e) =>
    e is TimeoutException ||
    e is http.ClientException ||
    e.toString().contains('SocketException');

/// The one event dictionary of Restyler, mirrored in `docs/telemetry.md`.
final restylerDictionary = TelemetryDictionary(
  appVersion: kAppVersion,
  languages: {
    for (final l in AppLocalizations.supportedLocales) telemetryLocaleId(l),
  },
  screens: kScreenRoutes.values.toSet(),
  features: {
    'mix',
    'search',
    'photo_medium',
    'strip_layout',
    'save_photos',
    'share',
    'animate',
    'clip_play',
    'fill_in',
    'delete',
  },
  errorKinds: {
    ...kMaskErrorKinds,
    'mask_other',
    'photo',
    'analysis',
    'offline',
    'busy',
    'queue_full',
    'auth',
    'not_found',
    'plan_rejected',
    'server',
    'lost',
    'nude',
    'render_failed',
    'retired_style',
    'nothing_ready',
    'export',
    'other',
  },
  events: {
    ...TelemetryDictionary.flow(
      'analyse',
      start: {
        'source': const EnumProp({'camera', 'gallery'}),
      },
    ),
    'look_step': {
      'step': const EnumProp({'beard', 'glasses', 'hair'}),
      'choice': const EnumProp({'change', 'keep', 'blocked'}),
      'item': EnumProp({...kTelemetryLookIds, 'none', 'other'}),
      'colour': EnumProp({...kTelemetryColourIds, 'none', 'other'}),
    },
    'style_pick': {
      'style': EnumProp({...kTelemetryStyleIds, 'other'}),
      'medium': const EnumProp({'illustration', 'photo'}),
    },
    ...TelemetryDictionary.flow(
      'restyle',
      results: {
        'partial',
        'queued',
        'timeout',
        'refused',
        'rejected',
        'lost',
        'filtered',
      },
      start: {
        'kind': const EnumProp({
          'booth',
          'retry',
          'fill_in',
          'clip',
          'clip_retry',
        }),
        'steps': const IntProp(100),
        'cost': const IntProp(10000),
        'beard': const BoolProp(),
        'glasses': const BoolProp(),
        'hair': const BoolProp(),
        'motion': EnumProp({...kTelemetryMotionIds, 'none', 'other'}),
      },
      end: {
        'stage': const EnumProp({'upload', 'queue', 'render', 'done'}),
        'wait_secs': const IntProp(86400),
        'frames_ok': const IntProp(100),
      },
    ),
    ...TelemetryDictionary.flow(
      'export',
      results: {'empty'},
      start: {
        'target': const EnumProp({'photos', 'share'}),
        'layout': const EnumProp({'grid', 'strip'}),
      },
    ),
  },
);
