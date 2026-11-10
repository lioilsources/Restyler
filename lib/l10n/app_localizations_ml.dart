// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'ഈ ബിൽഡിൽ സെർവർ ടോക്കൺ ഇല്ല (make run, .env.local). വിശകലനം പ്രവർത്തിക്കുന്നു, റെൻഡറിങ് പ്രവർത്തിക്കുന്നില്ല.';

  @override
  String get homeEmpty => 'ഇവിടെ ഇതുവരെ ഒന്നുമില്ല. ഒരു സെൽഫിയിൽ തുടങ്ങൂ.';

  @override
  String get homeNew => 'പുതിയ ഫോട്ടോ ബൂത്ത്';

  @override
  String get delete => 'ഇല്ലാതാക്കുക';

  @override
  String get statusRunning => 'പുരോഗമിക്കുന്നു';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ഫ്രെയിമുകൾ',
      one: '$n ഫ്രെയിം',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'ഭാഗികമായി പരാജയപ്പെട്ടു';

  @override
  String get statusFailed => 'പരാജയപ്പെട്ടു';

  @override
  String get statusRejected => 'തുടങ്ങിയിട്ടില്ല';

  @override
  String get statusLost => 'സെർവറിൽ നഷ്ടപ്പെട്ടു';

  @override
  String get selfieTitle => 'സെൽഫി';

  @override
  String get selfieHint =>
      'ഒരാളുടെ മുന്നിൽ നിന്നുള്ള പോർട്രെയ്റ്റ്, മുഖം വ്യക്തമായി കാണണം.';

  @override
  String get selfieAnalysing => 'ഫോട്ടോ നോക്കുന്നു…';

  @override
  String get takePhoto => 'ഫോട്ടോ എടുക്കുക';

  @override
  String get pickGallery => 'ഗാലറിയിൽ നിന്ന് തിരഞ്ഞെടുക്കുക';

  @override
  String get stepKeep => 'അങ്ങനെ തന്നെ നിർത്തുക';

  @override
  String get stepNext => 'അടുത്തത്';

  @override
  String get hairTitle => 'മുടി';

  @override
  String get beardTitle => 'താടി';

  @override
  String get glassesTitle => 'കണ്ണട';

  @override
  String get glassesFinish => 'ഫ്രെയിം';

  @override
  String get hairWomen => 'സ്ത്രീകൾ';

  @override
  String get hairMen => 'പുരുഷന്മാർ';

  @override
  String get hairKeepCut => 'ഹെയർസ്റ്റൈൽ നിലനിർത്തി നിറം മാത്രം മാറ്റുക';

  @override
  String get hairColour => 'നിറം';

  @override
  String hairColourOnPhoto(String colour) {
    return 'നിറം (ഫോട്ടോയിൽ: $colour)';
  }

  @override
  String get hairNoChange => 'മാറ്റമില്ല';

  @override
  String get stylesTitle => 'ശൈലികൾ';

  @override
  String get frameCount => 'എത്ര ഫ്രെയിമുകൾ';

  @override
  String get mixes => 'തയ്യാറായ മിക്സുകൾ';

  @override
  String pickedOf(int picked, int count) {
    return '$count-ൽ $picked തിരഞ്ഞെടുത്തു';
  }

  @override
  String get mediumIllustration => 'ചിത്രരചന';

  @override
  String get mediumPhoto => 'ഫോട്ടോ';

  @override
  String get searchStyle => 'ശൈലി തിരയുക';

  @override
  String get pickSomething => 'കുറഞ്ഞത് ഒരു മാറ്റമോ ശൈലിയോ തിരഞ്ഞെടുക്കുക.';

  @override
  String get startBooth => 'ഫോട്ടോ ബൂത്ത് തുടങ്ങുക';

  @override
  String get mixGalerie => 'ഗാലറി';

  @override
  String get mixKomiks => 'പോപ്പും കോമിക്സും';

  @override
  String get mixEpochy => 'യുഗങ്ങളിലൂടെ';

  @override
  String get mixAsie => 'ഏഷ്യ';

  @override
  String get mixCesko => 'ചെക്ക് മുദ്ര';

  @override
  String get boothTitle => 'ഫോട്ടോ ബൂത്ത്';

  @override
  String get boothSomeFailed =>
      'ചില ഫ്രെയിമുകൾ പരാജയപ്പെട്ടു. അവയുടെ ജനറേഷനുകൾ തിരികെ നൽകി.';

  @override
  String get layoutGrid => 'ഗ്രിഡ്';

  @override
  String get layoutStrip => 'സ്ട്രിപ്പ്';

  @override
  String get saveToPhotos => 'ഫോട്ടോസിൽ സേവ് ചെയ്യുക';

  @override
  String get share => 'പങ്കിടുക';

  @override
  String get stripSaved => 'സ്ട്രിപ്പ് ഫോട്ടോസിൽ ഉണ്ട്.';

  @override
  String get stripSaveFailed => 'സ്ട്രിപ്പ് ഫോട്ടോസിൽ സേവ് ചെയ്യാനായില്ല.';

  @override
  String get nothingReady => 'ഇതുവരെ ഒരു ഫ്രെയിമും തയ്യാറായിട്ടില്ല.';

  @override
  String get rerun => 'വീണ്ടും പ്രവർത്തിപ്പിക്കുക';

  @override
  String rerunCost(int cost) {
    return 'വീണ്ടും പ്രവർത്തിപ്പിക്കുക ($cost)';
  }

  @override
  String get clipDefaultName => 'ക്ലിപ്പ്';

  @override
  String get clipAnimating => 'ആനിമേറ്റ് ചെയ്യുന്നു…';

  @override
  String get clipDone => 'പൂർത്തിയായി';

  @override
  String get clipFailed => 'പരാജയപ്പെട്ടു. ജനറേഷനുകൾ തിരികെ നൽകി.';

  @override
  String get playClip => 'ക്ലിപ്പ് പ്ലേ ചെയ്യുക';

  @override
  String get clipSaved => 'ക്ലിപ്പ് ഫോട്ടോസിൽ ഉണ്ട്.';

  @override
  String get clipSaveFailed => 'ക്ലിപ്പ് ഫോട്ടോസിൽ സേവ് ചെയ്യാനായില്ല.';

  @override
  String get clipCantPlay => 'ക്ലിപ്പ് പ്ലേ ചെയ്യാനാവില്ല.';

  @override
  String get animate => 'ആനിമേറ്റ് ചെയ്യുക';

  @override
  String get motionFast => 'വേഗത്തിൽ, സെക്കൻഡുകൾക്കുള്ളിൽ';

  @override
  String get motionSlow => 'പതുക്കെ, പത്തുകണക്കിന് മിനിറ്റുകൾ';

  @override
  String get tileNewLook => 'പുതിയ ലുക്ക്';

  @override
  String get frameNotReady => 'ഈ ഫ്രെയിം ഇതുവരെ തയ്യാറായിട്ടില്ല.';

  @override
  String get runNotStarted => 'റെൻഡറിങ് തുടങ്ങാനായില്ല.';

  @override
  String get runFailedRefunded =>
      'റെൻഡറിങ് പരാജയപ്പെട്ടു. ജനറേഷനുകൾ തിരികെ നൽകി.';

  @override
  String get runLost =>
      'ഇതിനിടെ സെർവർ റീസ്റ്റാർട്ട് ചെയ്യുകയും റെൻഡറിങ് നഷ്ടപ്പെടുകയും ചെയ്തു.';

  @override
  String get errNoFace =>
      'മുഖം കണ്ടെത്തിയില്ല. ഒരാളുടെ മുന്നിൽ നിന്നുള്ള പോർട്രെയ്റ്റ് ഉപയോഗിക്കുക.';

  @override
  String get errFaceTooSmall =>
      'മുഖം വളരെ ചെറുതാണ്. ഫോട്ടോ തലയോടും തോളുകളോടും കൂടുതൽ അടുത്ത് ക്രോപ്പ് ചെയ്യുക.';

  @override
  String get errMaskTooSmallHair => 'മാറ്റാൻ ആവശ്യത്തിന് മുടി ഫോട്ടോയിലില്ല.';

  @override
  String get errMouthNotVisible =>
      'വായ കാണണം. മുഖത്തിന് മുന്നിൽ കൈ വയ്ക്കാതെ ലെൻസിലേക്ക് നോക്കുക.';

  @override
  String get errNoBeardToShave => 'ഫോട്ടോയിൽ ഷേവ് ചെയ്യാൻ താടിയില്ല.';

  @override
  String get errEyesNotVisible =>
      'കണ്ണുകൾ കാണണം. കണ്ണിന് മുകളിൽ കൈയോ മുടിയോ ഇല്ലാതെ ലെൻസിലേക്ക് നോക്കുക.';

  @override
  String get errMaskTooLarge =>
      'മുഖം വളരെ അടുത്താണ്. ഫോൺ കുറച്ച് അകലെ പിടിക്കുക.';

  @override
  String get errNoGlassesToRemove => 'ഫോട്ടോയിൽ കണ്ണടയില്ല.';

  @override
  String get errNothingToChange => 'ഈ ഫോട്ടോയിൽ മാറ്റാൻ ഒന്നുമില്ല.';

  @override
  String get errBusy =>
      'മറ്റൊരു റെൻഡറിങ് പ്രവർത്തിക്കുന്നു. അത് തീരുന്നതുവരെ പുതിയത് തുടങ്ങാനോ ആനിമേറ്റ് ചെയ്യാനോ കഴിയില്ല. “കാറ്റിൽ പറക്കുന്ന മുടി” ക്ലിപ്പിന് ഏകദേശം 20 മിനിറ്റ് എടുത്തേക്കാം.';

  @override
  String get errOffline =>
      'സെർവറിൽ എത്താൻ കഴിയുന്നില്ല. കണക്ഷൻ പരിശോധിച്ച് വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get errAccessDenied =>
      'സെർവർ ആക്സസ് നിരസിച്ചു. ഈ ബിൽഡിലെ ടോക്കൺ തെറ്റാണ്.';

  @override
  String get errNotFound =>
      'ഈ റെൻഡറിങ് സെർവറിന് ഇനി അറിയില്ല. വീണ്ടും തുടങ്ങുക.';

  @override
  String get errPlanRejected =>
      'സെർവർ പ്ലാൻ നിരസിച്ചു. ഈ ഫോട്ടോ അയയ്ക്കാനാവില്ല.';

  @override
  String errServer(int status) {
    return 'സെർവറിൽ പിഴവ് ($status). അൽപ്പം കഴിഞ്ഞ് വീണ്ടും ശ്രമിക്കുക.';
  }

  @override
  String errGeneric(String error) {
    return 'എന്തോ കുഴപ്പം സംഭവിച്ചു: $error';
  }

  @override
  String get photoUnreadable =>
      'ഫോട്ടോ വായിക്കാനായില്ല. JPEG അല്ലെങ്കിൽ PNG ഉപയോഗിക്കുക.';

  @override
  String get stageWaitingServer => 'സെർവറിനായി കാത്തിരിക്കുന്നു…';

  @override
  String get stageBeard => 'താടി ശരിയാക്കുന്നു…';

  @override
  String get stageGlasses => 'കണ്ണട വയ്ക്കുന്നു…';

  @override
  String get stageHair => 'മുടി വെട്ടുന്നു…';

  @override
  String get stageQueue => 'ക്യൂവിൽ കാത്തിരിക്കുന്നു…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total വരയ്ക്കുന്നു';
  }
}
