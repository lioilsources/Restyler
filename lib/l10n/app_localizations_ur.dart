// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'اس بلڈ میں سرور ٹوکن موجود نہیں (make run، ‏.env.local)۔ تجزیہ چلتا ہے، رینڈرنگ نہیں۔';

  @override
  String get homeEmpty => 'یہاں ابھی کچھ نہیں ہے۔ سیلفی سے آغاز کریں۔';

  @override
  String get homeNew => 'نیا فوٹو بوتھ';

  @override
  String get delete => 'حذف کریں';

  @override
  String get statusRunning => 'جاری ہے';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n فریم',
      one: '$n فریم',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'کچھ حصہ ناکام رہا';

  @override
  String get statusFailed => 'ناکام';

  @override
  String get statusRejected => 'شروع نہیں ہوا';

  @override
  String get statusLost => 'سرور پر ضائع ہو گیا';

  @override
  String get selfieTitle => 'سیلفی';

  @override
  String get selfieHint => 'ایک شخص کی سامنے سے پورٹریٹ، چہرہ صاف نظر آئے۔';

  @override
  String get selfieAnalysing => 'تصویر دیکھ رہا ہوں…';

  @override
  String get takePhoto => 'تصویر کھینچیں';

  @override
  String get pickGallery => 'گیلری سے منتخب کریں';

  @override
  String get stepKeep => 'رہنے دیں';

  @override
  String get stepNext => 'اگلا';

  @override
  String get hairTitle => 'بال';

  @override
  String get beardTitle => 'داڑھی';

  @override
  String get glassesTitle => 'عینک';

  @override
  String get glassesFinish => 'فریم';

  @override
  String get hairWomen => 'خواتین';

  @override
  String get hairMen => 'مرد';

  @override
  String get hairKeepCut => 'ہیئر اسٹائل رکھیں، صرف رنگ بدلیں';

  @override
  String get hairColour => 'رنگ';

  @override
  String hairColourOnPhoto(String colour) {
    return 'رنگ (تصویر میں: $colour)';
  }

  @override
  String get hairNoChange => 'کوئی تبدیلی نہیں';

  @override
  String get stylesTitle => 'انداز';

  @override
  String get frameCount => 'کتنے فریم';

  @override
  String get mixes => 'تیار مکس';

  @override
  String pickedOf(int picked, int count) {
    return '$count میں سے $picked منتخب';
  }

  @override
  String get mediumIllustration => 'پینٹنگ';

  @override
  String get mediumPhoto => 'تصویر';

  @override
  String get searchStyle => 'انداز تلاش کریں';

  @override
  String get pickSomething => 'کم از کم ایک ترمیم یا انداز منتخب کریں۔';

  @override
  String get startBooth => 'فوٹو بوتھ شروع کریں';

  @override
  String get mixGalerie => 'گیلری';

  @override
  String get mixKomiks => 'پاپ اور کامکس';

  @override
  String get mixEpochy => 'زمانوں کا سفر';

  @override
  String get mixAsie => 'ایشیا';

  @override
  String get mixCesko => 'چیک نقوش';

  @override
  String get boothTitle => 'فوٹو بوتھ';

  @override
  String get boothSomeFailed =>
      'کچھ فریم ناکام رہے۔ ان کی جنریشنز واپس کر دی گئیں۔';

  @override
  String get layoutGrid => 'گرڈ';

  @override
  String get layoutStrip => 'پٹی';

  @override
  String get saveToPhotos => 'تصاویر میں محفوظ کریں';

  @override
  String get share => 'شیئر کریں';

  @override
  String get stripSaved => 'پٹی تصاویر میں ہے۔';

  @override
  String get stripSaveFailed => 'پٹی تصاویر میں محفوظ نہیں ہو سکی۔';

  @override
  String get nothingReady => 'ابھی کوئی فریم تیار نہیں۔';

  @override
  String get rerun => 'دوبارہ چلائیں';

  @override
  String rerunCost(int cost) {
    return 'دوبارہ چلائیں ($cost)';
  }

  @override
  String get clipDefaultName => 'کلپ';

  @override
  String get clipAnimating => 'متحرک کیا جا رہا ہے…';

  @override
  String get clipDone => 'مکمل';

  @override
  String get clipFailed => 'ناکام رہا۔ جنریشنز واپس کر دی گئیں۔';

  @override
  String get playClip => 'کلپ چلائیں';

  @override
  String get clipSaved => 'کلپ تصاویر میں ہے۔';

  @override
  String get clipSaveFailed => 'کلپ تصاویر میں محفوظ نہیں ہو سکا۔';

  @override
  String get clipCantPlay => 'کلپ نہیں چلایا جا سکتا۔';

  @override
  String get animate => 'متحرک کریں';

  @override
  String get motionFast => 'تیز، چند سیکنڈ میں';

  @override
  String get motionSlow => 'سست، دسیوں منٹ';

  @override
  String get tileNewLook => 'نیا انداز';

  @override
  String get frameNotReady => 'یہ فریم ابھی تیار نہیں۔';

  @override
  String get runNotStarted => 'رینڈرنگ شروع نہیں ہو سکی۔';

  @override
  String get runFailedRefunded => 'رینڈرنگ ناکام رہی۔ جنریشنز واپس کر دی گئیں۔';

  @override
  String get runLost =>
      'اس دوران سرور دوبارہ شروع ہو گیا اور رینڈرنگ ضائع ہو گئی۔';

  @override
  String get errNoFace =>
      'چہرہ نہیں ملا۔ ایک شخص کی سامنے سے پورٹریٹ استعمال کریں۔';

  @override
  String get errFaceTooSmall =>
      'چہرہ بہت چھوٹا ہے۔ تصویر کو سر اور کندھوں کے قریب سے کراپ کریں۔';

  @override
  String get errMaskTooSmallHair => 'تصویر میں بدلنے کے لیے کافی بال نہیں ہیں۔';

  @override
  String get errMouthNotVisible =>
      'منہ نظر آنا چاہیے۔ لینس کی طرف دیکھیں، چہرے کے آگے ہاتھ نہ ہو۔';

  @override
  String get errNoBeardToShave => 'تصویر میں مونڈنے کے لیے داڑھی نہیں ہے۔';

  @override
  String get errEyesNotVisible =>
      'آنکھیں نظر آنی چاہئیں۔ لینس کی طرف دیکھیں، آنکھوں پر ہاتھ یا بال نہ ہوں۔';

  @override
  String get errMaskTooLarge => 'چہرہ بہت قریب ہے۔ فون کو دور رکھیں۔';

  @override
  String get errNoGlassesToRemove => 'تصویر میں عینک نہیں ہے۔';

  @override
  String get errNothingToChange => 'اس تصویر میں بدلنے کے لیے کچھ نہیں۔';

  @override
  String get errBusy =>
      'ایک اور رینڈرنگ چل رہی ہے۔ جب تک وہ ختم نہ ہو، آپ نئی شروع نہیں کر سکتے اور متحرک بھی نہیں کر سکتے۔ “ہوا میں اڑتے بال” کلپ میں تقریباً 20 منٹ لگ سکتے ہیں۔';

  @override
  String get errOffline =>
      'سرور تک رسائی نہیں ہو رہی۔ اپنا کنکشن چیک کریں اور دوبارہ کوشش کریں۔';

  @override
  String get errAccessDenied =>
      'سرور نے رسائی سے انکار کر دیا۔ اس بلڈ کا ٹوکن غلط ہے۔';

  @override
  String get errNotFound =>
      'سرور اب اس رینڈرنگ کو نہیں جانتا۔ اسے دوبارہ شروع کریں۔';

  @override
  String get errPlanRejected =>
      'سرور نے منصوبہ مسترد کر دیا۔ یہ تصویر بھیجی نہیں جا سکتی۔';

  @override
  String errServer(int status) {
    return 'سرور میں خرابی ($status)۔ تھوڑی دیر بعد دوبارہ کوشش کریں۔';
  }

  @override
  String errGeneric(String error) {
    return 'کچھ غلط ہو گیا: $error';
  }

  @override
  String get photoUnreadable =>
      'تصویر پڑھی نہیں جا سکی۔ JPEG یا PNG استعمال کریں۔';

  @override
  String get stageWaitingServer => 'سرور کا انتظار ہے…';

  @override
  String get stageBeard => 'داڑھی میں ترمیم ہو رہی ہے…';

  @override
  String get stageGlasses => 'عینک لگائی جا رہی ہے…';

  @override
  String get stageHair => 'بال کاٹے جا رہے ہیں…';

  @override
  String get stageQueue => 'قطار میں انتظار ہے…';

  @override
  String stagePainting(int current, int total) {
    return '$current/$total بنایا جا رہا ہے';
  }
}
