// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'આ બિલ્ડમાં સર્વર ટોકન નથી (make run, .env.local). વિશ્લેષણ ચાલે છે, રેન્ડરિંગ નહીં.';

  @override
  String get homeEmpty => 'અહીં હજી કંઈ નથી. એક સેલ્ફીથી શરૂઆત કરો.';

  @override
  String get homeNew => 'નવું ફોટો બૂથ';

  @override
  String get delete => 'ડિલીટ કરો';

  @override
  String get statusRunning => 'ચાલુ છે';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ફ્રેમ',
      one: '$n ફ્રેમ',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'થોડો ભાગ નિષ્ફળ ગયો';

  @override
  String get statusFailed => 'નિષ્ફળ';

  @override
  String get statusRejected => 'શરૂ થયું નથી';

  @override
  String get statusLost => 'સર્વર પર ખોવાઈ ગયું';

  @override
  String get selfieTitle => 'સેલ્ફી';

  @override
  String get selfieHint =>
      'એક વ્યક્તિનું સામેથી પોર્ટ્રેટ, ચહેરો સ્પષ્ટ દેખાય એવું.';

  @override
  String get selfieAnalysing => 'ફોટો જોઈ રહ્યો છું…';

  @override
  String get takePhoto => 'ફોટો લો';

  @override
  String get pickGallery => 'ગેલેરીમાંથી પસંદ કરો';

  @override
  String get stepKeep => 'રહેવા દો';

  @override
  String get stepNext => 'આગળ';

  @override
  String get hairTitle => 'વાળ';

  @override
  String get beardTitle => 'દાઢી';

  @override
  String get glassesTitle => 'ચશ્માં';

  @override
  String get glassesFinish => 'ફ્રેમ';

  @override
  String get hairWomen => 'મહિલાઓ';

  @override
  String get hairMen => 'પુરુષો';

  @override
  String get hairKeepCut => 'હેરસ્ટાઇલ રાખો, ફક્ત રંગ બદલો';

  @override
  String get hairColour => 'રંગ';

  @override
  String hairColourOnPhoto(String colour) {
    return 'રંગ (ફોટોમાં: $colour)';
  }

  @override
  String get hairNoChange => 'કોઈ ફેરફાર નહીં';

  @override
  String get stylesTitle => 'શૈલીઓ';

  @override
  String get frameCount => 'કેટલી ફ્રેમ';

  @override
  String get mixes => 'તૈયાર મિક્સ';

  @override
  String pickedOf(int picked, int count) {
    return '$count માંથી $picked પસંદ કરી';
  }

  @override
  String get mediumIllustration => 'ચિત્ર';

  @override
  String get mediumPhoto => 'ફોટો';

  @override
  String get searchStyle => 'શૈલી શોધો';

  @override
  String get pickSomething => 'ઓછામાં ઓછો એક ફેરફાર અથવા શૈલી પસંદ કરો.';

  @override
  String get startBooth => 'ફોટો બૂથ શરૂ કરો';

  @override
  String get mixGalerie => 'ગેલેરી';

  @override
  String get mixKomiks => 'પૉપ અને કૉમિક્સ';

  @override
  String get mixEpochy => 'યુગોની સફર';

  @override
  String get mixAsie => 'એશિયા';

  @override
  String get mixCesko => 'ચેક છાપ';

  @override
  String get boothTitle => 'ફોટો બૂથ';

  @override
  String get boothSomeFailed =>
      'કેટલીક ફ્રેમ નિષ્ફળ ગઈ. તેમના જનરેશન પાછા આપ્યા છે.';

  @override
  String get layoutGrid => 'ગ્રિડ';

  @override
  String get layoutStrip => 'પટ્ટી';

  @override
  String get saveToPhotos => 'ફોટોઝમાં સાચવો';

  @override
  String get share => 'શેર કરો';

  @override
  String get stripSaved => 'પટ્ટી ફોટોઝમાં છે.';

  @override
  String get stripSaveFailed => 'પટ્ટી ફોટોઝમાં સાચવી શકાઈ નહીં.';

  @override
  String get nothingReady => 'હજી કોઈ ફ્રેમ તૈયાર નથી.';

  @override
  String get rerun => 'ફરી ચલાવો';

  @override
  String rerunCost(int cost) {
    return 'ફરી ચલાવો ($cost)';
  }

  @override
  String get clipDefaultName => 'ક્લિપ';

  @override
  String get clipAnimating => 'એનિમેટ થઈ રહ્યું છે…';

  @override
  String get clipDone => 'પૂર્ણ';

  @override
  String get clipFailed => 'નિષ્ફળ ગયું. જનરેશન પાછા આપ્યા છે.';

  @override
  String get playClip => 'ક્લિપ ચલાવો';

  @override
  String get clipSaved => 'ક્લિપ ફોટોઝમાં છે.';

  @override
  String get clipSaveFailed => 'ક્લિપ ફોટોઝમાં સાચવી શકાઈ નહીં.';

  @override
  String get clipCantPlay => 'ક્લિપ ચલાવી શકાતી નથી.';

  @override
  String get animate => 'એનિમેટ કરો';

  @override
  String get motionFast => 'ઝડપી, થોડી સેકન્ડમાં';

  @override
  String get motionSlow => 'ધીમું, દસેક મિનિટ';

  @override
  String get tileNewLook => 'નવો લુક';

  @override
  String get frameNotReady => 'આ ફ્રેમ હજી તૈયાર નથી.';

  @override
  String get runNotStarted => 'રેન્ડરિંગ શરૂ થઈ શક્યું નહીં.';

  @override
  String get runFailedRefunded =>
      'રેન્ડરિંગ નિષ્ફળ ગયું. જનરેશન પાછા આપ્યા છે.';

  @override
  String get runLost => 'દરમિયાન સર્વર ફરી શરૂ થયું અને રેન્ડરિંગ ખોવાઈ ગયું.';

  @override
  String get errNoFace =>
      'ચહેરો મળ્યો નથી. એક વ્યક્તિનું સામેથી પોર્ટ્રેટ વાપરો.';

  @override
  String get errFaceTooSmall =>
      'ચહેરો બહુ નાનો છે. ફોટો માથા અને ખભાની વધુ નજીકથી ક્રૉપ કરો.';

  @override
  String get errMaskTooSmallHair => 'ફોટોમાં બદલવા જેટલા વાળ નથી.';

  @override
  String get errMouthNotVisible =>
      'મોં દેખાવું જોઈએ. ચહેરા આગળ હાથ રાખ્યા વિના લેન્સ તરફ જુઓ.';

  @override
  String get errNoBeardToShave => 'ફોટોમાં હજામત કરવા જેવી દાઢી નથી.';

  @override
  String get errEyesNotVisible =>
      'આંખો દેખાવી જોઈએ. આંખો પર હાથ કે વાળ રાખ્યા વિના લેન્સ તરફ જુઓ.';

  @override
  String get errMaskTooLarge => 'ચહેરો બહુ નજીક છે. ફોન થોડો દૂર રાખો.';

  @override
  String get errNoGlassesToRemove => 'ફોટોમાં ચશ્માં નથી.';

  @override
  String get errNothingToChange => 'આ ફોટોમાં બદલવા જેવું કંઈ નથી.';

  @override
  String get errBusy =>
      'બીજું રેન્ડરિંગ ચાલુ છે. તે પૂરું ન થાય ત્યાં સુધી તમે નવું શરૂ કરી શકતા નથી કે એનિમેટ પણ કરી શકતા નથી. “પવનમાં ઉડતા વાળ” ક્લિપમાં લગભગ 20 મિનિટ લાગી શકે.';

  @override
  String get errOffline =>
      'સર્વર સુધી પહોંચી શકાતું નથી. તમારું કનેક્શન તપાસો અને ફરી પ્રયાસ કરો.';

  @override
  String get errAccessDenied => 'સર્વરે ઍક્સેસ નકારી. આ બિલ્ડનો ટોકન ખોટો છે.';

  @override
  String get errNotFound =>
      'સર્વર હવે આ રેન્ડરિંગને ઓળખતું નથી. તેને ફરી શરૂ કરો.';

  @override
  String get errPlanRejected => 'સર્વરે યોજના નકારી. આ ફોટો મોકલી શકાતો નથી.';

  @override
  String errServer(int status) {
    return 'સર્વરમાં ખામી આવી ($status). થોડી વારમાં ફરી પ્રયાસ કરો.';
  }

  @override
  String errGeneric(String error) {
    return 'કંઈક ખોટું થયું: $error';
  }

  @override
  String get photoUnreadable => 'ફોટો વાંચી શકાયો નહીં. JPEG અથવા PNG વાપરો.';

  @override
  String get stageWaitingServer => 'સર્વરની રાહ જોવાઈ રહી છે…';

  @override
  String get stageBeard => 'દાઢીમાં ફેરફાર થઈ રહ્યો છે…';

  @override
  String get stageGlasses => 'ચશ્માં પહેરાવાઈ રહ્યાં છે…';

  @override
  String get stageHair => 'વાળ કપાઈ રહ્યા છે…';

  @override
  String get stageQueue => 'કતારમાં રાહ જોવાઈ રહી છે…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total પેઇન્ટ થઈ રહ્યું છે';
  }
}
