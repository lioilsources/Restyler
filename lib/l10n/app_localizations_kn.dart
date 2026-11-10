// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'ಈ ಬಿಲ್ಡ್‌ನಲ್ಲಿ ಸರ್ವರ್ ಟೋಕನ್ ಇಲ್ಲ (make run, .env.local). ವಿಶ್ಲೇಷಣೆ ಕೆಲಸ ಮಾಡುತ್ತದೆ, ರೆಂಡರಿಂಗ್ ಮಾಡುವುದಿಲ್ಲ.';

  @override
  String get homeEmpty => 'ಇಲ್ಲಿ ಇನ್ನೂ ಏನೂ ಇಲ್ಲ. ಒಂದು ಸೆಲ್ಫಿಯಿಂದ ಪ್ರಾರಂಭಿಸಿ.';

  @override
  String get homeNew => 'ಹೊಸ ಫೋಟೋ ಬೂತ್';

  @override
  String get delete => 'ಅಳಿಸಿ';

  @override
  String get statusRunning => 'ನಡೆಯುತ್ತಿದೆ';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ಫ್ರೇಮ್‌ಗಳು',
      one: '$n ಫ್ರೇಮ್',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'ಭಾಗಶಃ ವಿಫಲ';

  @override
  String get statusFailed => 'ವಿಫಲವಾಯಿತು';

  @override
  String get statusRejected => 'ಪ್ರಾರಂಭವಾಗಿಲ್ಲ';

  @override
  String get statusLost => 'ಸರ್ವರ್‌ನಲ್ಲಿ ಕಳೆದುಹೋಯಿತು';

  @override
  String get selfieTitle => 'ಸೆಲ್ಫಿ';

  @override
  String get selfieHint =>
      'ಒಬ್ಬ ವ್ಯಕ್ತಿಯ ಮುಂಭಾಗದ ಭಾವಚಿತ್ರ, ಮುಖ ಸ್ಪಷ್ಟವಾಗಿ ಕಾಣಬೇಕು.';

  @override
  String get selfieAnalysing => 'ಫೋಟೋ ನೋಡುತ್ತಿದ್ದೇನೆ…';

  @override
  String get takePhoto => 'ಫೋಟೋ ತೆಗೆಯಿರಿ';

  @override
  String get pickGallery => 'ಗ್ಯಾಲರಿಯಿಂದ ಆರಿಸಿ';

  @override
  String get stepKeep => 'ಹಾಗೆಯೇ ಬಿಡಿ';

  @override
  String get stepNext => 'ಮುಂದೆ';

  @override
  String get hairTitle => 'ಕೂದಲು';

  @override
  String get beardTitle => 'ಗಡ್ಡ';

  @override
  String get glassesTitle => 'ಕನ್ನಡಕ';

  @override
  String get glassesFinish => 'ಫ್ರೇಮ್';

  @override
  String get hairWomen => 'ಮಹಿಳೆಯರು';

  @override
  String get hairMen => 'ಪುರುಷರು';

  @override
  String get hairKeepCut => 'ಕೇಶವಿನ್ಯಾಸ ಉಳಿಸಿ, ಬಣ್ಣ ಮಾತ್ರ ಬದಲಿಸಿ';

  @override
  String get hairColour => 'ಬಣ್ಣ';

  @override
  String hairColourOnPhoto(String colour) {
    return 'ಬಣ್ಣ (ಫೋಟೋದಲ್ಲಿ: $colour)';
  }

  @override
  String get hairNoChange => 'ಬದಲಾವಣೆ ಇಲ್ಲ';

  @override
  String get stylesTitle => 'ಶೈಲಿಗಳು';

  @override
  String get frameCount => 'ಎಷ್ಟು ಫ್ರೇಮ್‌ಗಳು';

  @override
  String get mixes => 'ಸಿದ್ಧ ಮಿಕ್ಸ್‌ಗಳು';

  @override
  String pickedOf(int picked, int count) {
    return '$count ರಲ್ಲಿ $picked ಆಯ್ಕೆ ಮಾಡಲಾಗಿದೆ';
  }

  @override
  String get mediumIllustration => 'ಚಿತ್ರಕಲೆ';

  @override
  String get mediumPhoto => 'ಫೋಟೋ';

  @override
  String get searchStyle => 'ಶೈಲಿಗಾಗಿ ಹುಡುಕಿ';

  @override
  String get pickSomething => 'ಕನಿಷ್ಠ ಒಂದು ಬದಲಾವಣೆ ಅಥವಾ ಶೈಲಿಯನ್ನು ಆರಿಸಿ.';

  @override
  String get startBooth => 'ಫೋಟೋ ಬೂತ್ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get mixGalerie => 'ಗ್ಯಾಲರಿ';

  @override
  String get mixKomiks => 'ಪಾಪ್ ಮತ್ತು ಕಾಮಿಕ್ಸ್';

  @override
  String get mixEpochy => 'ಯುಗಗಳ ಮೂಲಕ';

  @override
  String get mixAsie => 'ಏಷ್ಯಾ';

  @override
  String get mixCesko => 'ಜೆಕ್ ಹೆಜ್ಜೆಗುರುತು';

  @override
  String get boothTitle => 'ಫೋಟೋ ಬೂತ್';

  @override
  String get boothSomeFailed =>
      'ಕೆಲವು ಫ್ರೇಮ್‌ಗಳು ವಿಫಲವಾದವು. ಅವುಗಳ ಜನರೇಶನ್‌ಗಳನ್ನು ಹಿಂದಿರುಗಿಸಲಾಗಿದೆ.';

  @override
  String get layoutGrid => 'ಗ್ರಿಡ್';

  @override
  String get layoutStrip => 'ಪಟ್ಟಿ';

  @override
  String get saveToPhotos => 'ಫೋಟೋಗಳಲ್ಲಿ ಉಳಿಸಿ';

  @override
  String get share => 'ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get stripSaved => 'ಪಟ್ಟಿ ಫೋಟೋಗಳಲ್ಲಿದೆ.';

  @override
  String get stripSaveFailed => 'ಪಟ್ಟಿಯನ್ನು ಫೋಟೋಗಳಲ್ಲಿ ಉಳಿಸಲಾಗಲಿಲ್ಲ.';

  @override
  String get nothingReady => 'ಇನ್ನೂ ಯಾವುದೇ ಫ್ರೇಮ್ ಸಿದ್ಧವಿಲ್ಲ.';

  @override
  String get rerun => 'ಮತ್ತೆ ಚಲಾಯಿಸಿ';

  @override
  String rerunCost(int cost) {
    return 'ಮತ್ತೆ ಚಲಾಯಿಸಿ ($cost)';
  }

  @override
  String get clipDefaultName => 'ಕ್ಲಿಪ್';

  @override
  String get clipAnimating => 'ಅನಿಮೇಟ್ ಮಾಡಲಾಗುತ್ತಿದೆ…';

  @override
  String get clipDone => 'ಮುಗಿಯಿತು';

  @override
  String get clipFailed => 'ವಿಫಲವಾಯಿತು. ಜನರೇಶನ್‌ಗಳನ್ನು ಹಿಂದಿರುಗಿಸಲಾಗಿದೆ.';

  @override
  String get playClip => 'ಕ್ಲಿಪ್ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get clipSaved => 'ಕ್ಲಿಪ್ ಫೋಟೋಗಳಲ್ಲಿದೆ.';

  @override
  String get clipSaveFailed => 'ಕ್ಲಿಪ್ ಅನ್ನು ಫೋಟೋಗಳಲ್ಲಿ ಉಳಿಸಲಾಗಲಿಲ್ಲ.';

  @override
  String get clipCantPlay => 'ಕ್ಲಿಪ್ ಪ್ಲೇ ಮಾಡಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get animate => 'ಅನಿಮೇಟ್ ಮಾಡಿ';

  @override
  String get motionFast => 'ವೇಗ, ಕೆಲವೇ ಸೆಕೆಂಡುಗಳಲ್ಲಿ';

  @override
  String get motionSlow => 'ನಿಧಾನ, ಹತ್ತಾರು ನಿಮಿಷಗಳು';

  @override
  String get tileNewLook => 'ಹೊಸ ನೋಟ';

  @override
  String get frameNotReady => 'ಈ ಫ್ರೇಮ್ ಇನ್ನೂ ಸಿದ್ಧವಿಲ್ಲ.';

  @override
  String get runNotStarted => 'ರೆಂಡರಿಂಗ್ ಪ್ರಾರಂಭಿಸಲಾಗಲಿಲ್ಲ.';

  @override
  String get runFailedRefunded =>
      'ರೆಂಡರಿಂಗ್ ವಿಫಲವಾಯಿತು. ಜನರೇಶನ್‌ಗಳನ್ನು ಹಿಂದಿರುಗಿಸಲಾಗಿದೆ.';

  @override
  String get runLost => 'ಈ ನಡುವೆ ಸರ್ವರ್ ಮರುಪ್ರಾರಂಭವಾಗಿ ರೆಂಡರಿಂಗ್ ಕಳೆದುಹೋಯಿತು.';

  @override
  String get errNoFace =>
      'ಮುಖ ಕಂಡುಬಂದಿಲ್ಲ. ಒಬ್ಬ ವ್ಯಕ್ತಿಯ ಮುಂಭಾಗದ ಭಾವಚಿತ್ರವನ್ನು ಬಳಸಿ.';

  @override
  String get errFaceTooSmall =>
      'ಮುಖ ತುಂಬಾ ಚಿಕ್ಕದಾಗಿದೆ. ಫೋಟೋವನ್ನು ತಲೆ ಮತ್ತು ಭುಜಗಳಿಗೆ ಹತ್ತಿರವಾಗಿ ಕ್ರಾಪ್ ಮಾಡಿ.';

  @override
  String get errMaskTooSmallHair => 'ಬದಲಿಸಲು ಫೋಟೋದಲ್ಲಿ ಸಾಕಷ್ಟು ಕೂದಲಿಲ್ಲ.';

  @override
  String get errMouthNotVisible =>
      'ಬಾಯಿ ಕಾಣಬೇಕು. ಮುಖದ ಮುಂದೆ ಕೈ ಇಲ್ಲದೆ ಲೆನ್ಸ್‌ನತ್ತ ನೋಡಿ.';

  @override
  String get errNoBeardToShave => 'ಫೋಟೋದಲ್ಲಿ ಕ್ಷೌರ ಮಾಡಲು ಗಡ್ಡವಿಲ್ಲ.';

  @override
  String get errEyesNotVisible =>
      'ಕಣ್ಣುಗಳು ಕಾಣಬೇಕು. ಕಣ್ಣಿನ ಮೇಲೆ ಕೈ ಅಥವಾ ಕೂದಲು ಇಲ್ಲದೆ ಲೆನ್ಸ್‌ನತ್ತ ನೋಡಿ.';

  @override
  String get errMaskTooLarge =>
      'ಮುಖ ತುಂಬಾ ಹತ್ತಿರವಿದೆ. ಫೋನ್ ಅನ್ನು ದೂರ ಹಿಡಿಯಿರಿ.';

  @override
  String get errNoGlassesToRemove => 'ಫೋಟೋದಲ್ಲಿ ಕನ್ನಡಕವಿಲ್ಲ.';

  @override
  String get errNothingToChange => 'ಈ ಫೋಟೋದಲ್ಲಿ ಬದಲಿಸಲು ಏನೂ ಇಲ್ಲ.';

  @override
  String get errBusy =>
      'ಇನ್ನೊಂದು ರೆಂಡರಿಂಗ್ ನಡೆಯುತ್ತಿದೆ. ಅದು ಮುಗಿಯುವವರೆಗೆ ಹೊಸದನ್ನು ಪ್ರಾರಂಭಿಸಲು ಅಥವಾ ಅನಿಮೇಟ್ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ. “ಗಾಳಿಯಲ್ಲಿ ಹಾರುವ ಕೂದಲು” ಕ್ಲಿಪ್‌ಗೆ ಸುಮಾರು 20 ನಿಮಿಷ ಬೇಕಾಗಬಹುದು.';

  @override
  String get errOffline =>
      'ಸರ್ವರ್ ತಲುಪಲಾಗುತ್ತಿಲ್ಲ. ನಿಮ್ಮ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get errAccessDenied =>
      'ಸರ್ವರ್ ಪ್ರವೇಶವನ್ನು ನಿರಾಕರಿಸಿತು. ಈ ಬಿಲ್ಡ್‌ನ ಟೋಕನ್ ತಪ್ಪಾಗಿದೆ.';

  @override
  String get errNotFound =>
      'ಸರ್ವರ್‌ಗೆ ಈ ರೆಂಡರಿಂಗ್ ಇನ್ನು ತಿಳಿದಿಲ್ಲ. ಮತ್ತೆ ಪ್ರಾರಂಭಿಸಿ.';

  @override
  String get errPlanRejected =>
      'ಸರ್ವರ್ ಯೋಜನೆಯನ್ನು ತಿರಸ್ಕರಿಸಿತು. ಈ ಫೋಟೋವನ್ನು ಕಳುಹಿಸಲಾಗುವುದಿಲ್ಲ.';

  @override
  String errServer(int status) {
    return 'ಸರ್ವರ್ ವಿಫಲವಾಯಿತು ($status). ಸ್ವಲ್ಪ ಹೊತ್ತಿನ ನಂತರ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';
  }

  @override
  String errGeneric(String error) {
    return 'ಏನೋ ತಪ್ಪಾಗಿದೆ: $error';
  }

  @override
  String get photoUnreadable => 'ಫೋಟೋ ಓದಲಾಗಲಿಲ್ಲ. JPEG ಅಥವಾ PNG ಬಳಸಿ.';

  @override
  String get stageWaitingServer => 'ಸರ್ವರ್‌ಗಾಗಿ ಕಾಯಲಾಗುತ್ತಿದೆ…';

  @override
  String get stageBeard => 'ಗಡ್ಡವನ್ನು ತಿದ್ದಲಾಗುತ್ತಿದೆ…';

  @override
  String get stageGlasses => 'ಕನ್ನಡಕ ಹಾಕಲಾಗುತ್ತಿದೆ…';

  @override
  String get stageHair => 'ಕೂದಲು ಕತ್ತರಿಸಲಾಗುತ್ತಿದೆ…';

  @override
  String get stageQueue => 'ಸರದಿಯಲ್ಲಿ ಕಾಯಲಾಗುತ್ತಿದೆ…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total ಚಿತ್ರಿಸಲಾಗುತ್ತಿದೆ';
  }
}
