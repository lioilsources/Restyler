// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'இந்த பில்டில் சர்வர் டோக்கன் இல்லை (make run, .env.local). பகுப்பாய்வு வேலை செய்கிறது, ரெண்டரிங் செய்யாது.';

  @override
  String get homeEmpty =>
      'இங்கே இன்னும் எதுவும் இல்லை. ஒரு செல்ஃபியுடன் தொடங்குங்கள்.';

  @override
  String get homeNew => 'புதிய புகைப்படக் கூடம்';

  @override
  String get delete => 'நீக்கு';

  @override
  String get statusRunning => 'நடைபெறுகிறது';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ஃபிரேம்கள்',
      one: '$n ஃபிரேம்',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'ஒரு பகுதி தோல்வியடைந்தது';

  @override
  String get statusFailed => 'தோல்வியடைந்தது';

  @override
  String get statusRejected => 'தொடங்கவில்லை';

  @override
  String get statusLost => 'சர்வரில் இழக்கப்பட்டது';

  @override
  String get selfieTitle => 'செல்ஃபி';

  @override
  String get selfieHint =>
      'ஒருவரின் முன்புறத் தோற்றப் படம், முகம் தெளிவாகத் தெரிய வேண்டும்.';

  @override
  String get selfieAnalysing => 'புகைப்படத்தைப் பார்க்கிறேன்…';

  @override
  String get takePhoto => 'புகைப்படம் எடு';

  @override
  String get pickGallery => 'கேலரியிலிருந்து தேர்ந்தெடு';

  @override
  String get stepKeep => 'அப்படியே விடு';

  @override
  String get stepNext => 'அடுத்து';

  @override
  String get hairTitle => 'முடி';

  @override
  String get beardTitle => 'தாடி';

  @override
  String get glassesTitle => 'கண்ணாடி';

  @override
  String get glassesFinish => 'ஃபிரேம்';

  @override
  String get hairWomen => 'பெண்கள்';

  @override
  String get hairMen => 'ஆண்கள்';

  @override
  String get hairKeepCut => 'சிகையலங்காரத்தை வைத்து, நிறத்தை மட்டும் மாற்று';

  @override
  String get hairColour => 'நிறம்';

  @override
  String hairColourOnPhoto(String colour) {
    return 'நிறம் (புகைப்படத்தில்: $colour)';
  }

  @override
  String get hairNoChange => 'மாற்றம் இல்லை';

  @override
  String get stylesTitle => 'பாணிகள்';

  @override
  String get frameCount => 'எத்தனை ஃபிரேம்கள்';

  @override
  String get mixes => 'தயார் கலவைகள்';

  @override
  String pickedOf(int picked, int count) {
    return '$count-இல் $picked தேர்ந்தெடுக்கப்பட்டது';
  }

  @override
  String get mediumIllustration => 'ஓவியம்';

  @override
  String get mediumPhoto => 'புகைப்படம்';

  @override
  String get searchStyle => 'பாணியைத் தேடு';

  @override
  String get pickSomething =>
      'குறைந்தது ஒரு மாற்றம் அல்லது பாணியைத் தேர்ந்தெடுங்கள்.';

  @override
  String get startBooth => 'புகைப்படக் கூடத்தைத் தொடங்கு';

  @override
  String get mixGalerie => 'கேலரி';

  @override
  String get mixKomiks => 'பாப் மற்றும் காமிக்ஸ்';

  @override
  String get mixEpochy => 'யுகங்கள் வழியாக';

  @override
  String get mixAsie => 'ஆசியா';

  @override
  String get mixCesko => 'செக் தடம்';

  @override
  String get boothTitle => 'புகைப்படக் கூடம்';

  @override
  String get boothSomeFailed =>
      'சில ஃபிரேம்கள் தோல்வியடைந்தன. அவற்றுக்கான ஜெனரேஷன்கள் திருப்பித் தரப்பட்டன.';

  @override
  String get layoutGrid => 'கட்டம்';

  @override
  String get layoutStrip => 'பட்டை';

  @override
  String get saveToPhotos => 'புகைப்படங்களில் சேமி';

  @override
  String get share => 'பகிர்';

  @override
  String get stripSaved => 'பட்டை புகைப்படங்களில் உள்ளது.';

  @override
  String get stripSaveFailed => 'பட்டையை புகைப்படங்களில் சேமிக்க முடியவில்லை.';

  @override
  String get nothingReady => 'இன்னும் எந்த ஃபிரேமும் தயாராகவில்லை.';

  @override
  String get rerun => 'மீண்டும் இயக்கு';

  @override
  String rerunCost(int cost) {
    return 'மீண்டும் இயக்கு ($cost)';
  }

  @override
  String get clipDefaultName => 'கிளிப்';

  @override
  String get clipAnimating => 'அனிமேட் செய்யப்படுகிறது…';

  @override
  String get clipDone => 'முடிந்தது';

  @override
  String get clipFailed => 'தோல்வியடைந்தது. ஜெனரேஷன்கள் திருப்பித் தரப்பட்டன.';

  @override
  String get playClip => 'கிளிப்பை இயக்கு';

  @override
  String get clipSaved => 'கிளிப் புகைப்படங்களில் உள்ளது.';

  @override
  String get clipSaveFailed => 'கிளிப்பை புகைப்படங்களில் சேமிக்க முடியவில்லை.';

  @override
  String get clipCantPlay => 'கிளிப்பை இயக்க முடியவில்லை.';

  @override
  String get animate => 'அனிமேட் செய்';

  @override
  String get motionFast => 'வேகமாக, சில நொடிகளில்';

  @override
  String get motionSlow => 'மெதுவாக, பல பத்து நிமிடங்கள்';

  @override
  String get tileNewLook => 'புதிய தோற்றம்';

  @override
  String get frameNotReady => 'இந்த ஃபிரேம் இன்னும் தயாராகவில்லை.';

  @override
  String get runNotStarted => 'ரெண்டரிங்கைத் தொடங்க முடியவில்லை.';

  @override
  String get runFailedRefunded =>
      'ரெண்டரிங் தோல்வியடைந்தது. ஜெனரேஷன்கள் திருப்பித் தரப்பட்டன.';

  @override
  String get runLost =>
      'இதற்கிடையில் சர்வர் மீண்டும் தொடங்கி ரெண்டரிங்கை இழந்துவிட்டது.';

  @override
  String get errNoFace =>
      'முகம் கிடைக்கவில்லை. ஒருவரின் முன்புறத் தோற்றப் படத்தைப் பயன்படுத்துங்கள்.';

  @override
  String get errFaceTooSmall =>
      'முகம் மிகச் சிறியது. புகைப்படத்தை தலை மற்றும் தோள்களுக்கு அருகில் வெட்டுங்கள்.';

  @override
  String get errMaskTooSmallHair =>
      'மாற்றுவதற்குப் போதுமான முடி புகைப்படத்தில் இல்லை.';

  @override
  String get errMouthNotVisible =>
      'வாய் தெரிய வேண்டும். முகத்தின் முன் கை இல்லாமல் லென்ஸைப் பாருங்கள்.';

  @override
  String get errNoBeardToShave => 'புகைப்படத்தில் மழிக்க தாடி இல்லை.';

  @override
  String get errEyesNotVisible =>
      'கண்கள் தெரிய வேண்டும். கண்கள் மேல் கை அல்லது முடி இல்லாமல் லென்ஸைப் பாருங்கள்.';

  @override
  String get errMaskTooLarge =>
      'முகம் மிக அருகில் உள்ளது. தொலைபேசியைச் சற்று தள்ளிப் பிடியுங்கள்.';

  @override
  String get errNoGlassesToRemove => 'புகைப்படத்தில் கண்ணாடி இல்லை.';

  @override
  String get errNothingToChange => 'இந்தப் புகைப்படத்தில் மாற்ற எதுவும் இல்லை.';

  @override
  String get errBusy =>
      'வேறொரு ரெண்டரிங் நடந்துகொண்டிருக்கிறது. அது முடியும் வரை புதியதைத் தொடங்கவோ அனிமேட் செய்யவோ முடியாது. “காற்றில் பறக்கும் முடி” கிளிப்புக்கு சுமார் 20 நிமிடங்கள் ஆகலாம்.';

  @override
  String get errOffline =>
      'சர்வரை அடைய முடியவில்லை. உங்கள் இணைப்பைச் சரிபார்த்து மீண்டும் முயலுங்கள்.';

  @override
  String get errAccessDenied =>
      'சர்வர் அணுகலை மறுத்தது. இந்த பில்டின் டோக்கன் தவறானது.';

  @override
  String get errNotFound =>
      'இந்த ரெண்டரிங்கை சர்வர் இனி அறியாது. மீண்டும் தொடங்குங்கள்.';

  @override
  String get errPlanRejected =>
      'சர்வர் திட்டத்தை நிராகரித்தது. இந்தப் புகைப்படத்தை அனுப்ப முடியாது.';

  @override
  String errServer(int status) {
    return 'சர்வரில் பிழை ($status). சிறிது நேரம் கழித்து மீண்டும் முயலுங்கள்.';
  }

  @override
  String errGeneric(String error) {
    return 'ஏதோ தவறு நடந்தது: $error';
  }

  @override
  String get photoUnreadable =>
      'புகைப்படத்தைப் படிக்க முடியவில்லை. JPEG அல்லது PNG பயன்படுத்துங்கள்.';

  @override
  String get stageWaitingServer => 'சர்வருக்காகக் காத்திருக்கிறது…';

  @override
  String get stageBeard => 'தாடியைச் சீரமைக்கிறது…';

  @override
  String get stageGlasses => 'கண்ணாடி அணிவிக்கிறது…';

  @override
  String get stageHair => 'முடி வெட்டுகிறது…';

  @override
  String get stageQueue => 'வரிசையில் காத்திருக்கிறது…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total வரையப்படுகிறது';
  }
}
