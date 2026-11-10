// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'ଏହି ବିଲ୍ଡରେ ସର୍ଭର ଟୋକନ ନାହିଁ (make run, .env.local)। ବିଶ୍ଳେଷଣ ଚାଲେ, ରେଣ୍ଡରିଂ ଚାଲେ ନାହିଁ।';

  @override
  String get homeEmpty =>
      'ଏଠାରେ ଏପର୍ଯ୍ୟନ୍ତ କିଛି ନାହିଁ। ଏକ ସେଲଫିରୁ ଆରମ୍ଭ କରନ୍ତୁ।';

  @override
  String get homeNew => 'ନୂଆ ଫଟୋ ବୁଥ';

  @override
  String get delete => 'ଡିଲିଟ୍ କରନ୍ତୁ';

  @override
  String get statusRunning => 'ଚାଲିଛି';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nଟି ଫ୍ରେମ୍',
      one: '$nଟି ଫ୍ରେମ୍',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'କିଛି ଅଂଶ ବିଫଳ ହେଲା';

  @override
  String get statusFailed => 'ବିଫଳ ହେଲା';

  @override
  String get statusRejected => 'ଆରମ୍ଭ ହୋଇନାହିଁ';

  @override
  String get statusLost => 'ସର୍ଭରରେ ହଜିଗଲା';

  @override
  String get selfieTitle => 'ସେଲଫି';

  @override
  String get selfieHint =>
      'ଜଣେ ବ୍ୟକ୍ତିଙ୍କର ସାମନାରୁ ଉଠାଯାଇଥିବା ପୋର୍ଟ୍ରେଟ୍, ମୁହଁ ସ୍ପଷ୍ଟ ଦେଖାଯିବା ଦରକାର।';

  @override
  String get selfieAnalysing => 'ଫଟୋ ଦେଖୁଛି…';

  @override
  String get takePhoto => 'ଫଟୋ ଉଠାନ୍ତୁ';

  @override
  String get pickGallery => 'ଗ୍ୟାଲେରିରୁ ବାଛନ୍ତୁ';

  @override
  String get stepKeep => 'ସେମିତି ରଖନ୍ତୁ';

  @override
  String get stepNext => 'ପରବର୍ତ୍ତୀ';

  @override
  String get hairTitle => 'କେଶ';

  @override
  String get beardTitle => 'ଦାଢ଼ି';

  @override
  String get glassesTitle => 'ଚଷମା';

  @override
  String get glassesFinish => 'ଫ୍ରେମ୍';

  @override
  String get hairWomen => 'ମହିଳା';

  @override
  String get hairMen => 'ପୁରୁଷ';

  @override
  String get hairKeepCut => 'ହେୟାରଷ୍ଟାଇଲ୍ ରଖନ୍ତୁ, କେବଳ ରଙ୍ଗ ବଦଳାନ୍ତୁ';

  @override
  String get hairColour => 'ରଙ୍ଗ';

  @override
  String hairColourOnPhoto(String colour) {
    return 'ରଙ୍ଗ (ଫଟୋରେ: $colour)';
  }

  @override
  String get hairNoChange => 'ବଦଳ ନାହିଁ';

  @override
  String get stylesTitle => 'ଷ୍ଟାଇଲ୍';

  @override
  String get frameCount => 'କେତୋଟି ଫ୍ରେମ୍';

  @override
  String get mixes => 'ପ୍ରସ୍ତୁତ ମିକ୍ସ';

  @override
  String pickedOf(int picked, int count) {
    return '$countରୁ $picked ବଛାଯାଇଛି';
  }

  @override
  String get mediumIllustration => 'ଚିତ୍ର';

  @override
  String get mediumPhoto => 'ଫଟୋ';

  @override
  String get searchStyle => 'ଷ୍ଟାଇଲ୍ ଖୋଜନ୍ତୁ';

  @override
  String get pickSomething => 'ଅତିକମରେ ଗୋଟିଏ ବଦଳ କିମ୍ବା ଷ୍ଟାଇଲ୍ ବାଛନ୍ତୁ।';

  @override
  String get startBooth => 'ଫଟୋ ବୁଥ ଆରମ୍ଭ କରନ୍ତୁ';

  @override
  String get mixGalerie => 'ଗ୍ୟାଲେରି';

  @override
  String get mixKomiks => 'ପପ୍ ଏବଂ କମିକ୍ସ';

  @override
  String get mixEpochy => 'ଯୁଗ ଯୁଗ ଧରି';

  @override
  String get mixAsie => 'ଏସିଆ';

  @override
  String get mixCesko => 'ଚେକ୍ ଛାପ';

  @override
  String get boothTitle => 'ଫଟୋ ବୁଥ';

  @override
  String get boothSomeFailed =>
      'କିଛି ଫ୍ରେମ୍ ବିଫଳ ହେଲା। ସେଗୁଡ଼ିକର ଜେନେରେସନ୍ ଫେରାଇ ଦିଆଯାଇଛି।';

  @override
  String get layoutGrid => 'ଗ୍ରିଡ୍';

  @override
  String get layoutStrip => 'ଷ୍ଟ୍ରିପ୍';

  @override
  String get saveToPhotos => 'ଫଟୋରେ ସେଭ୍ କରନ୍ତୁ';

  @override
  String get share => 'ସେୟାର୍ କରନ୍ତୁ';

  @override
  String get stripSaved => 'ଷ୍ଟ୍ରିପ୍ ଫଟୋରେ ଅଛି।';

  @override
  String get stripSaveFailed => 'ଷ୍ଟ୍ରିପ୍ ଫଟୋରେ ସେଭ୍ କରାଯାଇପାରିଲା ନାହିଁ।';

  @override
  String get nothingReady => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ଫ୍ରେମ୍ ପ୍ରସ୍ତୁତ ନାହିଁ।';

  @override
  String get rerun => 'ପୁଣି ଚଲାନ୍ତୁ';

  @override
  String rerunCost(int cost) {
    return 'ପୁଣି ଚଲାନ୍ତୁ ($cost)';
  }

  @override
  String get clipDefaultName => 'କ୍ଲିପ୍';

  @override
  String get clipAnimating => 'ଆନିମେଟ୍ ହେଉଛି…';

  @override
  String get clipDone => 'ସମାପ୍ତ';

  @override
  String get clipFailed => 'ବିଫଳ ହେଲା। ଜେନେରେସନ୍ ଫେରାଇ ଦିଆଯାଇଛି।';

  @override
  String get playClip => 'କ୍ଲିପ୍ ଚଲାନ୍ତୁ';

  @override
  String get clipSaved => 'କ୍ଲିପ୍ ଫଟୋରେ ଅଛି।';

  @override
  String get clipSaveFailed => 'କ୍ଲିପ୍ ଫଟୋରେ ସେଭ୍ କରାଯାଇପାରିଲା ନାହିଁ।';

  @override
  String get clipCantPlay => 'କ୍ଲିପ୍ ଚଲାଯାଇପାରିବ ନାହିଁ।';

  @override
  String get animate => 'ଆନିମେଟ୍ କରନ୍ତୁ';

  @override
  String get motionFast => 'ଶୀଘ୍ର, କିଛି ସେକେଣ୍ଡରେ';

  @override
  String get motionSlow => 'ଧୀର, ଦଶ ଦଶ ମିନିଟ୍';

  @override
  String get tileNewLook => 'ନୂଆ ଲୁକ୍';

  @override
  String get frameNotReady => 'ଏହି ଫ୍ରେମ୍ ଏପର୍ଯ୍ୟନ୍ତ ପ୍ରସ୍ତୁତ ନୁହେଁ।';

  @override
  String get runNotStarted => 'ରେଣ୍ଡରିଂ ଆରମ୍ଭ କରାଯାଇପାରିଲା ନାହିଁ।';

  @override
  String get runFailedRefunded =>
      'ରେଣ୍ଡରିଂ ବିଫଳ ହେଲା। ଜେନେରେସନ୍ ଫେରାଇ ଦିଆଯାଇଛି।';

  @override
  String get runLost => 'ଏହି ମଧ୍ୟରେ ସର୍ଭର ପୁନଃଆରମ୍ଭ ହୋଇ ରେଣ୍ଡରିଂ ହଜିଗଲା।';

  @override
  String get errNoFace =>
      'ମୁହଁ ମିଳିଲା ନାହିଁ। ଜଣେ ବ୍ୟକ୍ତିଙ୍କର ସାମନାରୁ ଉଠାଯାଇଥିବା ପୋର୍ଟ୍ରେଟ୍ ବ୍ୟବହାର କରନ୍ତୁ।';

  @override
  String get errFaceTooSmall =>
      'ମୁହଁ ବହୁତ ଛୋଟ। ଫଟୋକୁ ମୁଣ୍ଡ ଓ କାନ୍ଧର ଅଧିକ ପାଖରୁ କ୍ରପ୍ କରନ୍ତୁ।';

  @override
  String get errMaskTooSmallHair => 'ବଦଳାଇବା ପାଇଁ ଫଟୋରେ ଯଥେଷ୍ଟ କେଶ ନାହିଁ।';

  @override
  String get errMouthNotVisible =>
      'ମୁହଁ (ଓଠ) ଦେଖାଯିବା ଦରକାର। ମୁହଁ ଆଗରେ ହାତ ନରଖି ଲେନ୍ସକୁ ଦେଖନ୍ତୁ।';

  @override
  String get errNoBeardToShave => 'ଫଟୋରେ କାଟିବା ପାଇଁ ଦାଢ଼ି ନାହିଁ।';

  @override
  String get errEyesNotVisible =>
      'ଆଖି ଦେଖାଯିବା ଦରକାର। ଆଖି ଉପରେ ହାତ କିମ୍ବା କେଶ ନରଖି ଲେନ୍ସକୁ ଦେଖନ୍ତୁ।';

  @override
  String get errMaskTooLarge =>
      'ମୁହଁ ବହୁତ ପାଖରେ ଅଛି। ଫୋନ୍‌କୁ ଟିକେ ଦୂରରେ ଧରନ୍ତୁ।';

  @override
  String get errNoGlassesToRemove => 'ଫଟୋରେ ଚଷମା ନାହିଁ।';

  @override
  String get errNothingToChange => 'ଏହି ଫଟୋରେ ବଦଳାଇବାକୁ କିଛି ନାହିଁ।';

  @override
  String get errBusy =>
      'ଅନ୍ୟ ଏକ ରେଣ୍ଡରିଂ ଚାଲିଛି। ତାହା ସରିବା ପର୍ଯ୍ୟନ୍ତ ନୂଆଟି ଆରମ୍ଭ କରିହେବ ନାହିଁ କି ଆନିମେଟ୍ ମଧ୍ୟ କରିହେବ ନାହିଁ। “ପବନରେ ଉଡ଼ୁଥିବା କେଶ” କ୍ଲିପ୍‌ରେ ପ୍ରାୟ 20 ମିନିଟ୍ ଲାଗିପାରେ।';

  @override
  String get errOffline =>
      'ସର୍ଭରକୁ ପହଞ୍ଚିହେଉନାହିଁ। ଆପଣଙ୍କ ସଂଯୋଗ ଯାଞ୍ଚ କରି ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get errAccessDenied =>
      'ସର୍ଭର ଆକ୍ସେସ୍ ପ୍ରତ୍ୟାଖ୍ୟାନ କଲା। ଏହି ବିଲ୍ଡର ଟୋକନ ଭୁଲ।';

  @override
  String get errNotFound =>
      'ସର୍ଭର ଆଉ ଏହି ରେଣ୍ଡରିଂକୁ ଜାଣେ ନାହିଁ। ଏହାକୁ ପୁଣି ଆରମ୍ଭ କରନ୍ତୁ।';

  @override
  String get errPlanRejected =>
      'ସର୍ଭର ଯୋଜନା ପ୍ରତ୍ୟାଖ୍ୟାନ କଲା। ଏହି ଫଟୋ ପଠାଯାଇପାରିବ ନାହିଁ।';

  @override
  String errServer(int status) {
    return 'ସର୍ଭରରେ ତ୍ରୁଟି ($status)। କିଛି ସମୟ ପରେ ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ।';
  }

  @override
  String errGeneric(String error) {
    return 'କିଛି ଭୁଲ ହୋଇଗଲା: $error';
  }

  @override
  String get photoUnreadable =>
      'ଫଟୋ ପଢ଼ାଯାଇପାରିଲା ନାହିଁ। JPEG କିମ୍ବା PNG ବ୍ୟବହାର କରନ୍ତୁ।';

  @override
  String get stageWaitingServer => 'ସର୍ଭର ପାଇଁ ଅପେକ୍ଷା କରୁଛି…';

  @override
  String get stageBeard => 'ଦାଢ଼ି ସୁଧାରୁଛି…';

  @override
  String get stageGlasses => 'ଚଷମା ପିନ୍ଧାଉଛି…';

  @override
  String get stageHair => 'କେଶ କାଟୁଛି…';

  @override
  String get stageQueue => 'ଧାଡ଼ିରେ ଅପେକ୍ଷା କରୁଛି…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total ଅଙ୍କା ଯାଉଛି';
  }
}
