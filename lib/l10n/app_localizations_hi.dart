// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'इस बिल्ड में सर्वर टोकन नहीं है (make run, .env.local)। विश्लेषण काम करता है, रेंडरिंग नहीं।';

  @override
  String get homeEmpty => 'यहाँ अभी कुछ नहीं है। एक सेल्फ़ी से शुरू करें।';

  @override
  String get homeNew => 'नया फ़ोटो बूथ';

  @override
  String get delete => 'हटाएँ';

  @override
  String get statusRunning => 'जारी है';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n फ़्रेम',
      one: '$n फ़्रेम',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'कुछ हिस्सा विफल रहा';

  @override
  String get statusFailed => 'विफल';

  @override
  String get statusRejected => 'शुरू नहीं हुआ';

  @override
  String get statusLost => 'सर्वर पर खो गया';

  @override
  String get selfieTitle => 'सेल्फ़ी';

  @override
  String get selfieHint => 'एक व्यक्ति का सामने से पोर्ट्रेट, चेहरा साफ़ दिखे।';

  @override
  String get selfieAnalysing => 'फ़ोटो देख रहा हूँ…';

  @override
  String get takePhoto => 'फ़ोटो खींचें';

  @override
  String get pickGallery => 'गैलरी से चुनें';

  @override
  String get stepKeep => 'रहने दें';

  @override
  String get stepNext => 'आगे';

  @override
  String get hairTitle => 'बाल';

  @override
  String get beardTitle => 'दाढ़ी';

  @override
  String get glassesTitle => 'चश्मा';

  @override
  String get glassesFinish => 'फ़्रेम';

  @override
  String get hairWomen => 'महिलाएँ';

  @override
  String get hairMen => 'पुरुष';

  @override
  String get hairKeepCut => 'हेयरस्टाइल रखें, सिर्फ़ रंग बदलें';

  @override
  String get hairColour => 'रंग';

  @override
  String hairColourOnPhoto(String colour) {
    return 'रंग (फ़ोटो में: $colour)';
  }

  @override
  String get hairNoChange => 'कोई बदलाव नहीं';

  @override
  String get stylesTitle => 'स्टाइल';

  @override
  String get frameCount => 'कितने फ़्रेम';

  @override
  String get mixes => 'तैयार मिक्स';

  @override
  String pickedOf(int picked, int count) {
    return '$count में से $picked चुने गए';
  }

  @override
  String get mediumIllustration => 'पेंटिंग';

  @override
  String get mediumPhoto => 'फ़ोटो';

  @override
  String get searchStyle => 'स्टाइल खोजें';

  @override
  String get pickSomething => 'कम से कम एक बदलाव या स्टाइल चुनें।';

  @override
  String get startBooth => 'फ़ोटो बूथ शुरू करें';

  @override
  String get mixGalerie => 'गैलरी';

  @override
  String get mixKomiks => 'पॉप और कॉमिक्स';

  @override
  String get mixEpochy => 'युगों के आर-पार';

  @override
  String get mixAsie => 'एशिया';

  @override
  String get mixCesko => 'चेक छाप';

  @override
  String get boothTitle => 'फ़ोटो बूथ';

  @override
  String get boothSomeFailed =>
      'कुछ फ़्रेम विफल रहे। उनके जनरेशन वापस कर दिए गए हैं।';

  @override
  String get layoutGrid => 'ग्रिड';

  @override
  String get layoutStrip => 'पट्टी';

  @override
  String get saveToPhotos => 'फ़ोटो में सहेजें';

  @override
  String get share => 'साझा करें';

  @override
  String get stripSaved => 'पट्टी फ़ोटो में है।';

  @override
  String get stripSaveFailed => 'पट्टी को फ़ोटो में सहेजा नहीं जा सका।';

  @override
  String get nothingReady => 'अभी कोई फ़्रेम तैयार नहीं है।';

  @override
  String get rerun => 'फिर से चलाएँ';

  @override
  String rerunCost(int cost) {
    return 'फिर से चलाएँ ($cost)';
  }

  @override
  String get clipDefaultName => 'क्लिप';

  @override
  String get clipAnimating => 'एनिमेट किया जा रहा है…';

  @override
  String get clipDone => 'पूरा हुआ';

  @override
  String get clipFailed => 'विफल रहा। जनरेशन वापस कर दिए गए हैं।';

  @override
  String get playClip => 'क्लिप चलाएँ';

  @override
  String get clipSaved => 'क्लिप फ़ोटो में है।';

  @override
  String get clipSaveFailed => 'क्लिप को फ़ोटो में सहेजा नहीं जा सका।';

  @override
  String get clipCantPlay => 'क्लिप चलाई नहीं जा सकती।';

  @override
  String get animate => 'एनिमेट करें';

  @override
  String get motionFast => 'तेज़, कुछ ही सेकंड में';

  @override
  String get motionSlow => 'धीमा, दसियों मिनट';

  @override
  String get tileNewLook => 'नया लुक';

  @override
  String get frameNotReady => 'यह फ़्रेम अभी तैयार नहीं है।';

  @override
  String get runNotStarted => 'रेंडरिंग शुरू नहीं की जा सकी।';

  @override
  String get runFailedRefunded =>
      'रेंडरिंग विफल रही। जनरेशन वापस कर दिए गए हैं।';

  @override
  String get runLost => 'इस बीच सर्वर रीस्टार्ट हो गया और रेंडरिंग खो गई।';

  @override
  String get errNoFace =>
      'चेहरा नहीं मिला। एक व्यक्ति का सामने से पोर्ट्रेट इस्तेमाल करें।';

  @override
  String get errFaceTooSmall =>
      'चेहरा बहुत छोटा है। फ़ोटो को सिर और कंधों के और पास से क्रॉप करें।';

  @override
  String get errMaskTooSmallHair =>
      'फ़ोटो में बदलने लायक पर्याप्त बाल नहीं हैं।';

  @override
  String get errMouthNotVisible =>
      'मुँह दिखना चाहिए। चेहरे के आगे हाथ रखे बिना लेंस की ओर देखें।';

  @override
  String get errNoBeardToShave => 'फ़ोटो में मुंडवाने लायक दाढ़ी नहीं है।';

  @override
  String get errEyesNotVisible =>
      'आँखें दिखनी चाहिए। आँखों पर हाथ या बाल रखे बिना लेंस की ओर देखें।';

  @override
  String get errMaskTooLarge => 'चेहरा बहुत पास है। फ़ोन को थोड़ा दूर रखें।';

  @override
  String get errNoGlassesToRemove => 'फ़ोटो में चश्मा नहीं है।';

  @override
  String get errNothingToChange => 'इस फ़ोटो में बदलने के लिए कुछ नहीं है।';

  @override
  String get errBusy =>
      'दूसरी रेंडरिंग चल रही है। जब तक वह पूरी नहीं होती, आप नई शुरू नहीं कर सकते और एनिमेट भी नहीं कर सकते। “हवा में उड़ते बाल” क्लिप में लगभग 20 मिनट लग सकते हैं।';

  @override
  String get errOffline =>
      'सर्वर तक पहुँचा नहीं जा सका। अपना कनेक्शन जाँचें और फिर कोशिश करें।';

  @override
  String get errAccessDenied =>
      'सर्वर ने एक्सेस देने से मना कर दिया। इस बिल्ड का टोकन गलत है।';

  @override
  String get errNotFound =>
      'सर्वर अब इस रेंडरिंग को नहीं पहचानता। इसे फिर से शुरू करें।';

  @override
  String get errPlanRejected =>
      'सर्वर ने योजना अस्वीकार कर दी। यह फ़ोटो भेजी नहीं जा सकती।';

  @override
  String errServer(int status) {
    return 'सर्वर में गड़बड़ी हुई ($status)। थोड़ी देर बाद फिर कोशिश करें।';
  }

  @override
  String errGeneric(String error) {
    return 'कुछ गड़बड़ हो गई: $error';
  }

  @override
  String get photoUnreadable =>
      'फ़ोटो पढ़ी नहीं जा सकी। JPEG या PNG इस्तेमाल करें।';

  @override
  String get stageWaitingServer => 'सर्वर का इंतज़ार है…';

  @override
  String get stageBeard => 'दाढ़ी बदली जा रही है…';

  @override
  String get stageGlasses => 'चश्मा पहनाया जा रहा है…';

  @override
  String get stageHair => 'बाल काटे जा रहे हैं…';

  @override
  String get stageQueue => 'कतार में इंतज़ार है…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total पेंट किया जा रहा है';
  }
}
