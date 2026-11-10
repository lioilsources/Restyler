// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'या बिल्डमध्ये सर्व्हर टोकन नाही (make run, .env.local). विश्लेषण चालते, रेंडरिंग चालत नाही.';

  @override
  String get homeEmpty => 'इथे अजून काहीच नाही. सेल्फीने सुरुवात करा.';

  @override
  String get homeNew => 'नवीन फोटो बूथ';

  @override
  String get delete => 'हटवा';

  @override
  String get statusRunning => 'सुरू आहे';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n फ्रेम',
      one: '$n फ्रेम',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'काही भाग अयशस्वी';

  @override
  String get statusFailed => 'अयशस्वी';

  @override
  String get statusRejected => 'सुरू झाले नाही';

  @override
  String get statusLost => 'सर्व्हरवर हरवले';

  @override
  String get selfieTitle => 'सेल्फी';

  @override
  String get selfieHint =>
      'एका व्यक्तीचे समोरून काढलेले पोर्ट्रेट, चेहरा स्पष्ट दिसेल असे.';

  @override
  String get selfieAnalysing => 'फोटो पाहत आहे…';

  @override
  String get takePhoto => 'फोटो काढा';

  @override
  String get pickGallery => 'गॅलरीतून निवडा';

  @override
  String get stepKeep => 'तसेच ठेवा';

  @override
  String get stepNext => 'पुढे';

  @override
  String get hairTitle => 'केस';

  @override
  String get beardTitle => 'दाढी';

  @override
  String get glassesTitle => 'चष्मा';

  @override
  String get glassesFinish => 'फ्रेम';

  @override
  String get hairWomen => 'महिला';

  @override
  String get hairMen => 'पुरुष';

  @override
  String get hairKeepCut => 'केशरचना ठेवा, फक्त रंग बदला';

  @override
  String get hairColour => 'रंग';

  @override
  String hairColourOnPhoto(String colour) {
    return 'रंग (फोटोमध्ये: $colour)';
  }

  @override
  String get hairNoChange => 'बदल नाही';

  @override
  String get stylesTitle => 'शैली';

  @override
  String get frameCount => 'किती फ्रेम';

  @override
  String get mixes => 'तयार मिक्स';

  @override
  String pickedOf(int picked, int count) {
    return '$count पैकी $picked निवडले';
  }

  @override
  String get mediumIllustration => 'चित्र';

  @override
  String get mediumPhoto => 'फोटो';

  @override
  String get searchStyle => 'शैली शोधा';

  @override
  String get pickSomething => 'किमान एक बदल किंवा शैली निवडा.';

  @override
  String get startBooth => 'फोटो बूथ सुरू करा';

  @override
  String get mixGalerie => 'गॅलरी';

  @override
  String get mixKomiks => 'पॉप आणि कॉमिक्स';

  @override
  String get mixEpochy => 'युगांमधून प्रवास';

  @override
  String get mixAsie => 'आशिया';

  @override
  String get mixCesko => 'झेक ठसा';

  @override
  String get boothTitle => 'फोटो बूथ';

  @override
  String get boothSomeFailed =>
      'काही फ्रेम अयशस्वी झाल्या. त्यांचे जनरेशन परत केले आहेत.';

  @override
  String get layoutGrid => 'ग्रिड';

  @override
  String get layoutStrip => 'पट्टी';

  @override
  String get saveToPhotos => 'फोटोमध्ये जतन करा';

  @override
  String get share => 'शेअर करा';

  @override
  String get stripSaved => 'पट्टी फोटोमध्ये आहे.';

  @override
  String get stripSaveFailed => 'पट्टी फोटोमध्ये जतन करता आली नाही.';

  @override
  String get nothingReady => 'अजून कोणतीही फ्रेम तयार नाही.';

  @override
  String get rerun => 'पुन्हा चालवा';

  @override
  String rerunCost(int cost) {
    return 'पुन्हा चालवा ($cost)';
  }

  @override
  String get clipDefaultName => 'क्लिप';

  @override
  String get clipAnimating => 'अ‍ॅनिमेट होत आहे…';

  @override
  String get clipDone => 'पूर्ण';

  @override
  String get clipFailed => 'अयशस्वी झाले. जनरेशन परत केले आहेत.';

  @override
  String get playClip => 'क्लिप चालवा';

  @override
  String get clipSaved => 'क्लिप फोटोमध्ये आहे.';

  @override
  String get clipSaveFailed => 'क्लिप फोटोमध्ये जतन करता आली नाही.';

  @override
  String get clipCantPlay => 'क्लिप चालवता येत नाही.';

  @override
  String get animate => 'अ‍ॅनिमेट करा';

  @override
  String get motionFast => 'जलद, काही सेकंदांत';

  @override
  String get motionSlow => 'संथ, दहा-वीस मिनिटे';

  @override
  String get tileNewLook => 'नवीन लूक';

  @override
  String get frameNotReady => 'ही फ्रेम अजून तयार नाही.';

  @override
  String get runNotStarted => 'रेंडरिंग सुरू करता आले नाही.';

  @override
  String get runFailedRefunded =>
      'रेंडरिंग अयशस्वी झाले. जनरेशन परत केले आहेत.';

  @override
  String get runLost => 'दरम्यान सर्व्हर रीस्टार्ट झाला आणि रेंडरिंग हरवले.';

  @override
  String get errNoFace =>
      'चेहरा सापडला नाही. एका व्यक्तीचे समोरून काढलेले पोर्ट्रेट वापरा.';

  @override
  String get errFaceTooSmall =>
      'चेहरा खूप लहान आहे. फोटो डोके आणि खांद्यांच्या जवळून क्रॉप करा.';

  @override
  String get errMaskTooSmallHair => 'बदलण्यासाठी फोटोत पुरेसे केस नाहीत.';

  @override
  String get errMouthNotVisible =>
      'तोंड दिसले पाहिजे. चेहऱ्यासमोर हात न ठेवता लेन्सकडे पाहा.';

  @override
  String get errNoBeardToShave => 'फोटोत करायला दाढी नाही.';

  @override
  String get errEyesNotVisible =>
      'डोळे दिसले पाहिजेत. डोळ्यांवर हात किंवा केस न ठेवता लेन्सकडे पाहा.';

  @override
  String get errMaskTooLarge => 'चेहरा खूप जवळ आहे. फोन थोडा दूर धरा.';

  @override
  String get errNoGlassesToRemove => 'फोटोत चष्मा नाही.';

  @override
  String get errNothingToChange => 'या फोटोत बदलण्यासारखे काही नाही.';

  @override
  String get errBusy =>
      'दुसरे रेंडरिंग सुरू आहे. ते संपेपर्यंत नवीन सुरू करता येत नाही आणि अ‍ॅनिमेटही करता येत नाही. “वाऱ्यात उडणारे केस” क्लिपला सुमारे 20 मिनिटे लागू शकतात.';

  @override
  String get errOffline =>
      'सर्व्हरशी संपर्क होत नाही. तुमचे कनेक्शन तपासा आणि पुन्हा प्रयत्न करा.';

  @override
  String get errAccessDenied =>
      'सर्व्हरने प्रवेश नाकारला. या बिल्डचा टोकन चुकीचा आहे.';

  @override
  String get errNotFound =>
      'सर्व्हरला हे रेंडरिंग आता माहीत नाही. ते पुन्हा सुरू करा.';

  @override
  String get errPlanRejected =>
      'सर्व्हरने योजना नाकारली. हा फोटो पाठवता येत नाही.';

  @override
  String errServer(int status) {
    return 'सर्व्हरमध्ये बिघाड झाला ($status). थोड्या वेळाने पुन्हा प्रयत्न करा.';
  }

  @override
  String errGeneric(String error) {
    return 'काहीतरी चुकले: $error';
  }

  @override
  String get photoUnreadable => 'फोटो वाचता आला नाही. JPEG किंवा PNG वापरा.';

  @override
  String get stageWaitingServer => 'सर्व्हरची वाट पाहत आहे…';

  @override
  String get stageBeard => 'दाढी सुधारत आहे…';

  @override
  String get stageGlasses => 'चष्मा घालत आहे…';

  @override
  String get stageHair => 'केस कापत आहे…';

  @override
  String get stageQueue => 'रांगेत वाट पाहत आहे…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total रंगवत आहे';
  }
}
