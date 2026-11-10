// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'ఈ బిల్డ్‌లో సర్వర్ టోకెన్ లేదు (make run, .env.local). విశ్లేషణ పనిచేస్తుంది, రెండరింగ్ పనిచేయదు.';

  @override
  String get homeEmpty => 'ఇక్కడ ఇంకా ఏమీ లేదు. ఒక సెల్ఫీతో ప్రారంభించండి.';

  @override
  String get homeNew => 'కొత్త ఫోటో బూత్';

  @override
  String get delete => 'తొలగించు';

  @override
  String get statusRunning => 'కొనసాగుతోంది';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ఫ్రేమ్‌లు',
      one: '$n ఫ్రేమ్',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'కొంత భాగం విఫలమైంది';

  @override
  String get statusFailed => 'విఫలమైంది';

  @override
  String get statusRejected => 'ప్రారంభం కాలేదు';

  @override
  String get statusLost => 'సర్వర్‌లో కోల్పోయింది';

  @override
  String get selfieTitle => 'సెల్ఫీ';

  @override
  String get selfieHint =>
      'ఒక వ్యక్తి ముందు నుంచి తీసిన పోర్ట్రెయిట్, ముఖం స్పష్టంగా కనిపించాలి.';

  @override
  String get selfieAnalysing => 'ఫోటో చూస్తున్నాను…';

  @override
  String get takePhoto => 'ఫోటో తీయండి';

  @override
  String get pickGallery => 'గ్యాలరీ నుండి ఎంచుకోండి';

  @override
  String get stepKeep => 'అలాగే ఉంచు';

  @override
  String get stepNext => 'తర్వాత';

  @override
  String get hairTitle => 'జుట్టు';

  @override
  String get beardTitle => 'గడ్డం';

  @override
  String get glassesTitle => 'కళ్లద్దాలు';

  @override
  String get glassesFinish => 'ఫ్రేమ్';

  @override
  String get hairWomen => 'మహిళలు';

  @override
  String get hairMen => 'పురుషులు';

  @override
  String get hairKeepCut => 'హెయిర్‌స్టైల్ ఉంచి, రంగు మాత్రమే మార్చు';

  @override
  String get hairColour => 'రంగు';

  @override
  String hairColourOnPhoto(String colour) {
    return 'రంగు (ఫోటోలో: $colour)';
  }

  @override
  String get hairNoChange => 'మార్పు లేదు';

  @override
  String get stylesTitle => 'శైలులు';

  @override
  String get frameCount => 'ఎన్ని ఫ్రేమ్‌లు';

  @override
  String get mixes => 'సిద్ధమైన మిక్స్‌లు';

  @override
  String pickedOf(int picked, int count) {
    return '$countలో $picked ఎంచుకున్నారు';
  }

  @override
  String get mediumIllustration => 'చిత్రలేఖనం';

  @override
  String get mediumPhoto => 'ఫోటో';

  @override
  String get searchStyle => 'శైలిని వెతకండి';

  @override
  String get pickSomething => 'కనీసం ఒక మార్పు లేదా శైలిని ఎంచుకోండి.';

  @override
  String get startBooth => 'ఫోటో బూత్ ప్రారంభించండి';

  @override
  String get mixGalerie => 'గ్యాలరీ';

  @override
  String get mixKomiks => 'పాప్ మరియు కామిక్స్';

  @override
  String get mixEpochy => 'యుగాల గుండా';

  @override
  String get mixAsie => 'ఆసియా';

  @override
  String get mixCesko => 'చెక్ ముద్ర';

  @override
  String get boothTitle => 'ఫోటో బూత్';

  @override
  String get boothSomeFailed =>
      'కొన్ని ఫ్రేమ్‌లు విఫలమయ్యాయి. వాటి జనరేషన్‌లు తిరిగి ఇవ్వబడ్డాయి.';

  @override
  String get layoutGrid => 'గ్రిడ్';

  @override
  String get layoutStrip => 'స్ట్రిప్';

  @override
  String get saveToPhotos => 'ఫోటోలలో సేవ్ చేయండి';

  @override
  String get share => 'షేర్ చేయండి';

  @override
  String get stripSaved => 'స్ట్రిప్ ఫోటోలలో ఉంది.';

  @override
  String get stripSaveFailed => 'స్ట్రిప్‌ను ఫోటోలలో సేవ్ చేయలేకపోయాం.';

  @override
  String get nothingReady => 'ఇంకా ఏ ఫ్రేమ్ సిద్ధంగా లేదు.';

  @override
  String get rerun => 'మళ్లీ నడపండి';

  @override
  String rerunCost(int cost) {
    return 'మళ్లీ నడపండి ($cost)';
  }

  @override
  String get clipDefaultName => 'క్లిప్';

  @override
  String get clipAnimating => 'యానిమేట్ చేస్తోంది…';

  @override
  String get clipDone => 'పూర్తయింది';

  @override
  String get clipFailed => 'విఫలమైంది. జనరేషన్‌లు తిరిగి ఇవ్వబడ్డాయి.';

  @override
  String get playClip => 'క్లిప్ ప్లే చేయండి';

  @override
  String get clipSaved => 'క్లిప్ ఫోటోలలో ఉంది.';

  @override
  String get clipSaveFailed => 'క్లిప్‌ను ఫోటోలలో సేవ్ చేయలేకపోయాం.';

  @override
  String get clipCantPlay => 'క్లిప్‌ను ప్లే చేయలేకపోతున్నాం.';

  @override
  String get animate => 'యానిమేట్ చేయండి';

  @override
  String get motionFast => 'వేగంగా, కొన్ని సెకన్లలో';

  @override
  String get motionSlow => 'నెమ్మదిగా, పదుల నిమిషాలు';

  @override
  String get tileNewLook => 'కొత్త లుక్';

  @override
  String get frameNotReady => 'ఈ ఫ్రేమ్ ఇంకా సిద్ధంగా లేదు.';

  @override
  String get runNotStarted => 'రెండరింగ్‌ను ప్రారంభించలేకపోయాం.';

  @override
  String get runFailedRefunded =>
      'రెండరింగ్ విఫలమైంది. జనరేషన్‌లు తిరిగి ఇవ్వబడ్డాయి.';

  @override
  String get runLost =>
      'ఈ లోపు సర్వర్ రీస్టార్ట్ అయి రెండరింగ్‌ను కోల్పోయింది.';

  @override
  String get errNoFace =>
      'ముఖం కనబడలేదు. ఒక వ్యక్తి ముందు నుంచి తీసిన పోర్ట్రెయిట్ వాడండి.';

  @override
  String get errFaceTooSmall =>
      'ముఖం చాలా చిన్నదిగా ఉంది. ఫోటోను తల, భుజాలకు దగ్గరగా క్రాప్ చేయండి.';

  @override
  String get errMaskTooSmallHair => 'మార్చడానికి సరిపడా జుట్టు ఫోటోలో లేదు.';

  @override
  String get errMouthNotVisible =>
      'నోరు కనిపించాలి. ముఖం ముందు చేయి లేకుండా లెన్స్ వైపు చూడండి.';

  @override
  String get errNoBeardToShave => 'ఫోటోలో షేవ్ చేయడానికి గడ్డం లేదు.';

  @override
  String get errEyesNotVisible =>
      'కళ్లు కనిపించాలి. కళ్ల మీద చేయి లేదా జుట్టు లేకుండా లెన్స్ వైపు చూడండి.';

  @override
  String get errMaskTooLarge =>
      'ముఖం చాలా దగ్గరగా ఉంది. ఫోన్‌ను కాస్త దూరంగా పట్టుకోండి.';

  @override
  String get errNoGlassesToRemove => 'ఫోటోలో కళ్లద్దాలు లేవు.';

  @override
  String get errNothingToChange => 'ఈ ఫోటోలో మార్చడానికి ఏమీ లేదు.';

  @override
  String get errBusy =>
      'మరో రెండరింగ్ నడుస్తోంది. అది పూర్తయ్యే వరకు కొత్తది ప్రారంభించలేరు, యానిమేట్ కూడా చేయలేరు. “గాలిలో ఎగిరే జుట్టు” క్లిప్‌కు సుమారు 20 నిమిషాలు పట్టవచ్చు.';

  @override
  String get errOffline =>
      'సర్వర్‌ను చేరుకోలేకపోతున్నాం. మీ కనెక్షన్‌ను తనిఖీ చేసి మళ్లీ ప్రయత్నించండి.';

  @override
  String get errAccessDenied =>
      'సర్వర్ యాక్సెస్‌ను నిరాకరించింది. ఈ బిల్డ్‌లోని టోకెన్ తప్పు.';

  @override
  String get errNotFound =>
      'ఈ రెండరింగ్ సర్వర్‌కు ఇక తెలియదు. దాన్ని మళ్లీ ప్రారంభించండి.';

  @override
  String get errPlanRejected =>
      'సర్వర్ ప్రణాళికను తిరస్కరించింది. ఈ ఫోటోను పంపలేము.';

  @override
  String errServer(int status) {
    return 'సర్వర్‌లో లోపం ($status). కాసేపట్లో మళ్లీ ప్రయత్నించండి.';
  }

  @override
  String errGeneric(String error) {
    return 'ఏదో తప్పు జరిగింది: $error';
  }

  @override
  String get photoUnreadable => 'ఫోటోను చదవలేకపోయాం. JPEG లేదా PNG వాడండి.';

  @override
  String get stageWaitingServer => 'సర్వర్ కోసం వేచి ఉంది…';

  @override
  String get stageBeard => 'గడ్డాన్ని సరిచేస్తోంది…';

  @override
  String get stageGlasses => 'కళ్లద్దాలు పెడుతోంది…';

  @override
  String get stageHair => 'జుట్టు కత్తిరిస్తోంది…';

  @override
  String get stageQueue => 'క్యూలో వేచి ఉంది…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total గీస్తోంది';
  }
}
