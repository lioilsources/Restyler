import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:tsumiki_shared/tsumiki_shared.dart';

import '../l10n/l10n.dart';

/// Text per [HairMaskException.code]; these appear before anything is sent.
/// `mask_too_small` has its own word per step, see [maskErrorText]. Null for a
/// code the app does not know.
String? maskTextForCode(String code, [AppLocalizations? l]) {
  l ??= deviceL10n;
  return switch (code) {
    'no_face' => l.errNoFace,
    'face_too_small' => l.errFaceTooSmall,
    'mask_too_small' => l.errMaskTooSmallHair,
    'mouth_not_visible' => l.errMouthNotVisible,
    'no_beard_to_shave' => l.errNoBeardToShave,
    'eyes_not_visible' => l.errEyesNotVisible,
    'mask_too_large' => l.errMaskTooLarge,
    'no_glasses_to_remove' => l.errNoGlassesToRemove,
    _ => null,
  };
}

String nothingToChangeText([AppLocalizations? l]) => (l ?? deviceL10n).errNothingToChange;

/// Which mask step raised the error: `mask_too_small` means "no hair" only on
/// the hair step.
enum MaskStep { hair, beard, glasses }

String maskErrorText(
  HairMaskException e, [
  MaskStep step = MaskStep.hair,
  AppLocalizations? l,
]) {
  if (e.code == 'mask_too_small' && step != MaskStep.hair) {
    return nothingToChangeText(l);
  }
  return maskTextForCode(e.code, l) ?? e.message;
}

String busyText([AppLocalizations? l]) => (l ?? deviceL10n).errBusy;
String offlineText([AppLocalizations? l]) => (l ?? deviceL10n).errOffline;

/// Text for anything the render backend or the network threw.
String backendErrorText(Object e, [AppLocalizations? l]) {
  l ??= deviceL10n;
  if (e is BackendException) {
    return switch (e.statusCode) {
      429 => l.errBusy,
      401 || 403 => l.errAccessDenied,
      404 => l.errNotFound,
      422 => l.errPlanRejected,
      _ => l.errServer(e.statusCode),
    };
  }
  if (e is TimeoutException || e is http.ClientException) return l.errOffline;
  if (e is Exception && e.toString().contains('SocketException')) {
    return l.errOffline;
  }
  return l.errGeneric('$e');
}
