// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'ਇਸ ਬਿਲਡ ਵਿੱਚ ਸਰਵਰ ਟੋਕਨ ਨਹੀਂ ਹੈ (make run, .env.local)। ਵਿਸ਼ਲੇਸ਼ਣ ਚੱਲਦਾ ਹੈ, ਰੈਂਡਰਿੰਗ ਨਹੀਂ।';

  @override
  String get homeEmpty => 'ਇੱਥੇ ਹਾਲੇ ਕੁਝ ਨਹੀਂ ਹੈ। ਇੱਕ ਸੈਲਫ਼ੀ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ।';

  @override
  String get homeNew => 'ਨਵਾਂ ਫ਼ੋਟੋ ਬੂਥ';

  @override
  String get delete => 'ਮਿਟਾਓ';

  @override
  String get statusRunning => 'ਜਾਰੀ ਹੈ';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ਫ਼ਰੇਮ',
      one: '$n ਫ਼ਰੇਮ',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'ਕੁਝ ਹਿੱਸਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get statusFailed => 'ਅਸਫਲ';

  @override
  String get statusRejected => 'ਸ਼ੁਰੂ ਨਹੀਂ ਹੋਇਆ';

  @override
  String get statusLost => 'ਸਰਵਰ ਉੱਤੇ ਗੁੰਮ ਹੋ ਗਿਆ';

  @override
  String get selfieTitle => 'ਸੈਲਫ਼ੀ';

  @override
  String get selfieHint =>
      'ਇੱਕ ਵਿਅਕਤੀ ਦਾ ਸਾਹਮਣੇ ਤੋਂ ਪੋਰਟਰੇਟ, ਚਿਹਰਾ ਸਾਫ਼ ਦਿਖਾਈ ਦੇਵੇ।';

  @override
  String get selfieAnalysing => 'ਫ਼ੋਟੋ ਦੇਖ ਰਿਹਾ ਹਾਂ…';

  @override
  String get takePhoto => 'ਫ਼ੋਟੋ ਖਿੱਚੋ';

  @override
  String get pickGallery => 'ਗੈਲਰੀ ਵਿੱਚੋਂ ਚੁਣੋ';

  @override
  String get stepKeep => 'ਰਹਿਣ ਦਿਓ';

  @override
  String get stepNext => 'ਅੱਗੇ';

  @override
  String get hairTitle => 'ਵਾਲ਼';

  @override
  String get beardTitle => 'ਦਾੜ੍ਹੀ';

  @override
  String get glassesTitle => 'ਐਨਕਾਂ';

  @override
  String get glassesFinish => 'ਫ਼ਰੇਮ';

  @override
  String get hairWomen => 'ਔਰਤਾਂ';

  @override
  String get hairMen => 'ਮਰਦ';

  @override
  String get hairKeepCut => 'ਹੇਅਰਸਟਾਈਲ ਰੱਖੋ, ਸਿਰਫ਼ ਰੰਗ ਬਦਲੋ';

  @override
  String get hairColour => 'ਰੰਗ';

  @override
  String hairColourOnPhoto(String colour) {
    return 'ਰੰਗ (ਫ਼ੋਟੋ ਵਿੱਚ: $colour)';
  }

  @override
  String get hairNoChange => 'ਕੋਈ ਬਦਲਾਅ ਨਹੀਂ';

  @override
  String get stylesTitle => 'ਸ਼ੈਲੀਆਂ';

  @override
  String get frameCount => 'ਕਿੰਨੇ ਫ਼ਰੇਮ';

  @override
  String get mixes => 'ਤਿਆਰ ਮਿਕਸ';

  @override
  String pickedOf(int picked, int count) {
    return '$count ਵਿੱਚੋਂ $picked ਚੁਣੇ ਗਏ';
  }

  @override
  String get mediumIllustration => 'ਚਿੱਤਰਕਾਰੀ';

  @override
  String get mediumPhoto => 'ਫ਼ੋਟੋ';

  @override
  String get searchStyle => 'ਸ਼ੈਲੀ ਲੱਭੋ';

  @override
  String get pickSomething => 'ਘੱਟੋ-ਘੱਟ ਇੱਕ ਬਦਲਾਅ ਜਾਂ ਸ਼ੈਲੀ ਚੁਣੋ।';

  @override
  String get startBooth => 'ਫ਼ੋਟੋ ਬੂਥ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get mixGalerie => 'ਗੈਲਰੀ';

  @override
  String get mixKomiks => 'ਪੌਪ ਅਤੇ ਕਾਮਿਕਸ';

  @override
  String get mixEpochy => 'ਯੁੱਗਾਂ ਵਿੱਚੋਂ ਲੰਘਦਿਆਂ';

  @override
  String get mixAsie => 'ਏਸ਼ੀਆ';

  @override
  String get mixCesko => 'ਚੈੱਕ ਛਾਪ';

  @override
  String get boothTitle => 'ਫ਼ੋਟੋ ਬੂਥ';

  @override
  String get boothSomeFailed =>
      'ਕੁਝ ਫ਼ਰੇਮ ਅਸਫਲ ਰਹੇ। ਉਨ੍ਹਾਂ ਦੇ ਜਨਰੇਸ਼ਨ ਵਾਪਸ ਕਰ ਦਿੱਤੇ ਗਏ ਹਨ।';

  @override
  String get layoutGrid => 'ਗ੍ਰਿਡ';

  @override
  String get layoutStrip => 'ਪੱਟੀ';

  @override
  String get saveToPhotos => 'ਫ਼ੋਟੋਜ਼ ਵਿੱਚ ਸੰਭਾਲੋ';

  @override
  String get share => 'ਸਾਂਝਾ ਕਰੋ';

  @override
  String get stripSaved => 'ਪੱਟੀ ਫ਼ੋਟੋਜ਼ ਵਿੱਚ ਹੈ।';

  @override
  String get stripSaveFailed => 'ਪੱਟੀ ਫ਼ੋਟੋਜ਼ ਵਿੱਚ ਸੰਭਾਲੀ ਨਹੀਂ ਜਾ ਸਕੀ।';

  @override
  String get nothingReady => 'ਹਾਲੇ ਕੋਈ ਫ਼ਰੇਮ ਤਿਆਰ ਨਹੀਂ ਹੈ।';

  @override
  String get rerun => 'ਦੁਬਾਰਾ ਚਲਾਓ';

  @override
  String rerunCost(int cost) {
    return 'ਦੁਬਾਰਾ ਚਲਾਓ ($cost)';
  }

  @override
  String get clipDefaultName => 'ਕਲਿੱਪ';

  @override
  String get clipAnimating => 'ਐਨੀਮੇਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ…';

  @override
  String get clipDone => 'ਪੂਰਾ ਹੋਇਆ';

  @override
  String get clipFailed => 'ਅਸਫਲ ਰਿਹਾ। ਜਨਰੇਸ਼ਨ ਵਾਪਸ ਕਰ ਦਿੱਤੇ ਗਏ ਹਨ।';

  @override
  String get playClip => 'ਕਲਿੱਪ ਚਲਾਓ';

  @override
  String get clipSaved => 'ਕਲਿੱਪ ਫ਼ੋਟੋਜ਼ ਵਿੱਚ ਹੈ।';

  @override
  String get clipSaveFailed => 'ਕਲਿੱਪ ਫ਼ੋਟੋਜ਼ ਵਿੱਚ ਸੰਭਾਲੀ ਨਹੀਂ ਜਾ ਸਕੀ।';

  @override
  String get clipCantPlay => 'ਕਲਿੱਪ ਚਲਾਈ ਨਹੀਂ ਜਾ ਸਕਦੀ।';

  @override
  String get animate => 'ਐਨੀਮੇਟ ਕਰੋ';

  @override
  String get motionFast => 'ਤੇਜ਼, ਕੁਝ ਸਕਿੰਟਾਂ ਵਿੱਚ';

  @override
  String get motionSlow => 'ਹੌਲੀ, ਦਸਾਂ ਮਿੰਟਾਂ ਤੱਕ';

  @override
  String get tileNewLook => 'ਨਵਾਂ ਲੁੱਕ';

  @override
  String get frameNotReady => 'ਇਹ ਫ਼ਰੇਮ ਹਾਲੇ ਤਿਆਰ ਨਹੀਂ ਹੈ।';

  @override
  String get runNotStarted => 'ਰੈਂਡਰਿੰਗ ਸ਼ੁਰੂ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ।';

  @override
  String get runFailedRefunded =>
      'ਰੈਂਡਰਿੰਗ ਅਸਫਲ ਰਹੀ। ਜਨਰੇਸ਼ਨ ਵਾਪਸ ਕਰ ਦਿੱਤੇ ਗਏ ਹਨ।';

  @override
  String get runLost =>
      'ਇਸ ਦੌਰਾਨ ਸਰਵਰ ਮੁੜ ਚਾਲੂ ਹੋ ਗਿਆ ਅਤੇ ਰੈਂਡਰਿੰਗ ਗੁੰਮ ਹੋ ਗਈ।';

  @override
  String get errNoFace =>
      'ਚਿਹਰਾ ਨਹੀਂ ਮਿਲਿਆ। ਇੱਕ ਵਿਅਕਤੀ ਦਾ ਸਾਹਮਣੇ ਤੋਂ ਪੋਰਟਰੇਟ ਵਰਤੋ।';

  @override
  String get errFaceTooSmall =>
      'ਚਿਹਰਾ ਬਹੁਤ ਛੋਟਾ ਹੈ। ਫ਼ੋਟੋ ਨੂੰ ਸਿਰ ਅਤੇ ਮੋਢਿਆਂ ਦੇ ਹੋਰ ਨੇੜਿਓਂ ਕ੍ਰੌਪ ਕਰੋ।';

  @override
  String get errMaskTooSmallHair => 'ਬਦਲਣ ਲਈ ਫ਼ੋਟੋ ਵਿੱਚ ਕਾਫ਼ੀ ਵਾਲ਼ ਨਹੀਂ ਹਨ।';

  @override
  String get errMouthNotVisible =>
      'ਮੂੰਹ ਦਿਖਾਈ ਦੇਣਾ ਚਾਹੀਦਾ ਹੈ। ਚਿਹਰੇ ਅੱਗੇ ਹੱਥ ਰੱਖੇ ਬਿਨਾਂ ਲੈਂਜ਼ ਵੱਲ ਦੇਖੋ।';

  @override
  String get errNoBeardToShave => 'ਫ਼ੋਟੋ ਵਿੱਚ ਮੁੰਨਣ ਲਈ ਦਾੜ੍ਹੀ ਨਹੀਂ ਹੈ।';

  @override
  String get errEyesNotVisible =>
      'ਅੱਖਾਂ ਦਿਖਾਈ ਦੇਣੀਆਂ ਚਾਹੀਦੀਆਂ ਹਨ। ਅੱਖਾਂ ਉੱਤੇ ਹੱਥ ਜਾਂ ਵਾਲ਼ ਰੱਖੇ ਬਿਨਾਂ ਲੈਂਜ਼ ਵੱਲ ਦੇਖੋ।';

  @override
  String get errMaskTooLarge => 'ਚਿਹਰਾ ਬਹੁਤ ਨੇੜੇ ਹੈ। ਫ਼ੋਨ ਨੂੰ ਹੋਰ ਦੂਰ ਰੱਖੋ।';

  @override
  String get errNoGlassesToRemove => 'ਫ਼ੋਟੋ ਵਿੱਚ ਐਨਕਾਂ ਨਹੀਂ ਹਨ।';

  @override
  String get errNothingToChange => 'ਇਸ ਫ਼ੋਟੋ ਵਿੱਚ ਬਦਲਣ ਲਈ ਕੁਝ ਨਹੀਂ ਹੈ।';

  @override
  String get errBusy =>
      'ਇੱਕ ਹੋਰ ਰੈਂਡਰਿੰਗ ਚੱਲ ਰਹੀ ਹੈ। ਜਦੋਂ ਤੱਕ ਉਹ ਪੂਰੀ ਨਹੀਂ ਹੁੰਦੀ, ਤੁਸੀਂ ਨਵੀਂ ਸ਼ੁਰੂ ਨਹੀਂ ਕਰ ਸਕਦੇ ਅਤੇ ਐਨੀਮੇਟ ਵੀ ਨਹੀਂ ਕਰ ਸਕਦੇ। “ਹਵਾ ਵਿੱਚ ਉੱਡਦੇ ਵਾਲ਼” ਕਲਿੱਪ ਨੂੰ ਲਗਭਗ 20 ਮਿੰਟ ਲੱਗ ਸਕਦੇ ਹਨ।';

  @override
  String get errOffline =>
      'ਸਰਵਰ ਤੱਕ ਪਹੁੰਚ ਨਹੀਂ ਹੋ ਰਹੀ। ਆਪਣਾ ਕਨੈਕਸ਼ਨ ਜਾਂਚੋ ਅਤੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get errAccessDenied =>
      'ਸਰਵਰ ਨੇ ਪਹੁੰਚ ਤੋਂ ਇਨਕਾਰ ਕੀਤਾ। ਇਸ ਬਿਲਡ ਦਾ ਟੋਕਨ ਗਲਤ ਹੈ।';

  @override
  String get errNotFound =>
      'ਸਰਵਰ ਹੁਣ ਇਸ ਰੈਂਡਰਿੰਗ ਨੂੰ ਨਹੀਂ ਜਾਣਦਾ। ਇਸਨੂੰ ਦੁਬਾਰਾ ਸ਼ੁਰੂ ਕਰੋ।';

  @override
  String get errPlanRejected =>
      'ਸਰਵਰ ਨੇ ਯੋਜਨਾ ਰੱਦ ਕਰ ਦਿੱਤੀ। ਇਹ ਫ਼ੋਟੋ ਭੇਜੀ ਨਹੀਂ ਜਾ ਸਕਦੀ।';

  @override
  String errServer(int status) {
    return 'ਸਰਵਰ ਵਿੱਚ ਖ਼ਰਾਬੀ ਆਈ ($status)। ਕੁਝ ਦੇਰ ਬਾਅਦ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';
  }

  @override
  String errGeneric(String error) {
    return 'ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ: $error';
  }

  @override
  String get photoUnreadable => 'ਫ਼ੋਟੋ ਪੜ੍ਹੀ ਨਹੀਂ ਜਾ ਸਕੀ। JPEG ਜਾਂ PNG ਵਰਤੋ।';

  @override
  String get stageWaitingServer => 'ਸਰਵਰ ਦੀ ਉਡੀਕ ਹੈ…';

  @override
  String get stageBeard => 'ਦਾੜ੍ਹੀ ਠੀਕ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ…';

  @override
  String get stageGlasses => 'ਐਨਕਾਂ ਲਗਾਈਆਂ ਜਾ ਰਹੀਆਂ ਹਨ…';

  @override
  String get stageHair => 'ਵਾਲ਼ ਕੱਟੇ ਜਾ ਰਹੇ ਹਨ…';

  @override
  String get stageQueue => 'ਕਤਾਰ ਵਿੱਚ ਉਡੀਕ ਹੈ…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total ਪੇਂਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ';
  }
}
