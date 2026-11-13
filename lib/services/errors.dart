import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:tsumiki_shared/tsumiki_shared.dart';

/// Czech text per [HairMaskException.code]; these appear before anything is
/// sent. `mask_too_small` has its own word per step, see [maskErrorText].
const kMaskErrors = <String, String>{
  'no_face': 'Tvář jsme nenašli. Použij čelní portrét jednoho člověka.',
  'face_too_small': 'Tvář je moc malá. Ořízni fotku blíž k hlavě a ramenům.',
  'mask_too_small': 'Na fotce není dost vlasů, které by šlo přestříhat.',
  'mouth_not_visible': 'Ústa musí být vidět. Dívej se do objektivu, bez ruky '
      'před tváří.',
  'no_beard_to_shave': 'Na fotce nejsou vousy k oholení.',
  'eyes_not_visible': 'Oči musí být vidět. Dívej se do objektivu, bez ruky a '
      'vlasů přes oči.',
  'mask_too_large': 'Tvář je moc blízko. Drž telefon dál.',
  'no_glasses_to_remove': 'Na fotce nejsou brýle.',
};

const kNothingToChange = 'Na téhle fotce není co změnit.';

/// Which mask step raised the error: `mask_too_small` means "no hair" only on
/// the hair step.
enum MaskStep { hair, beard, glasses }

String maskErrorText(HairMaskException e, [MaskStep step = MaskStep.hair]) {
  if (e.code == 'mask_too_small' && step != MaskStep.hair) {
    return kNothingToChange;
  }
  return kMaskErrors[e.code] ?? e.message;
}

const kBusyText =
    'Běží ti jiný render. Dokud nedoběhne, nový nespustíš a nejde ani Oživit. '
    'Klip „vlasy ve větru“ může trvat kolem 20 minut.';
const kRetiredStyleText =
    'Některý styl v tomhle projektu jsme z appky odebrali. '
    'Založ nový projekt s jinými styly.';
const kServerBusyText =
    'Server je teď vytížený. Zkus to za pár minut, generace jsou vrácené.';
const kOfflineText =
    'Server není dostupný. Zkontroluj připojení a zkus to znovu.';

/// Text for anything the render backend or the network threw.
String backendErrorText(Object e) {
  if (e is BackendException) {
    return switch (e.statusCode) {
      429 => kBusyText,
      401 || 403 => 'Server odmítl přístup. Tenhle build má špatný token.',
      404 => 'Server o tomhle renderu už neví. Spusť ho znovu.',
      422 => 'Server plán odmítl. Tahle fotka se nedá poslat.',
      _ => 'Server selhal (${e.statusCode}). Zkus to za chvíli.',
    };
  }
  if (e is TimeoutException || e is http.ClientException) return kOfflineText;
  if (e is Exception && e.toString().contains('SocketException')) {
    return kOfflineText;
  }
  return 'Něco se nepovedlo: $e';
}
