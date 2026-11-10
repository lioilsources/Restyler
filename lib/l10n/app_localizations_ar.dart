// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'لا يحتوي هذا الإصدار على رمز الخادم (make run، ‏.env.local). التحليل يعمل أما التصيير فلا.';

  @override
  String get homeEmpty => 'لا يوجد شيء هنا بعد. ابدأ بصورة سيلفي.';

  @override
  String get homeNew => 'كشك صور جديد';

  @override
  String get delete => 'حذف';

  @override
  String get statusRunning => 'قيد التنفيذ';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n إطار',
      many: '$n إطارًا',
      few: '$n إطارات',
      two: 'إطاران',
      one: 'إطار واحد',
      zero: '$n إطار',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'فشل جزء منها';

  @override
  String get statusFailed => 'فشل';

  @override
  String get statusRejected => 'لم يبدأ';

  @override
  String get statusLost => 'فُقد على الخادم';

  @override
  String get selfieTitle => 'سيلفي';

  @override
  String get selfieHint => 'صورة شخصية لشخص واحد من الأمام، والوجه ظاهر بوضوح.';

  @override
  String get selfieAnalysing => 'أنظر إلى الصورة…';

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get pickGallery => 'اختيار من المعرض';

  @override
  String get stepKeep => 'إبقاء';

  @override
  String get stepNext => 'التالي';

  @override
  String get hairTitle => 'الشعر';

  @override
  String get beardTitle => 'اللحية';

  @override
  String get glassesTitle => 'النظارات';

  @override
  String get glassesFinish => 'الإطار';

  @override
  String get hairWomen => 'نساء';

  @override
  String get hairMen => 'رجال';

  @override
  String get hairKeepCut => 'إبقاء قصة الشعر وتغيير اللون فقط';

  @override
  String get hairColour => 'اللون';

  @override
  String hairColourOnPhoto(String colour) {
    return 'اللون (في الصورة: $colour)';
  }

  @override
  String get hairNoChange => 'بلا تغيير';

  @override
  String get stylesTitle => 'الأنماط';

  @override
  String get frameCount => 'عدد الإطارات';

  @override
  String get mixes => 'توليفات جاهزة';

  @override
  String pickedOf(int picked, int count) {
    return 'تم اختيار $picked من $count';
  }

  @override
  String get mediumIllustration => 'لوحة';

  @override
  String get mediumPhoto => 'صورة';

  @override
  String get searchStyle => 'ابحث عن نمط';

  @override
  String get pickSomething => 'اختر تعديلًا أو نمطًا واحدًا على الأقل.';

  @override
  String get startBooth => 'تشغيل كشك الصور';

  @override
  String get mixGalerie => 'المعرض';

  @override
  String get mixKomiks => 'البوب والقصص المصورة';

  @override
  String get mixEpochy => 'عبر العصور';

  @override
  String get mixAsie => 'آسيا';

  @override
  String get mixCesko => 'الأثر التشيكي';

  @override
  String get boothTitle => 'كشك الصور';

  @override
  String get boothSomeFailed =>
      'فشلت بعض الإطارات. تمت إعادة عمليات التوليد الخاصة بها.';

  @override
  String get layoutGrid => 'شبكة';

  @override
  String get layoutStrip => 'شريط';

  @override
  String get saveToPhotos => 'حفظ في الصور';

  @override
  String get share => 'مشاركة';

  @override
  String get stripSaved => 'الشريط موجود في الصور.';

  @override
  String get stripSaveFailed => 'تعذّر حفظ الشريط في الصور.';

  @override
  String get nothingReady => 'لا يوجد إطار جاهز بعد.';

  @override
  String get rerun => 'تشغيل مرة أخرى';

  @override
  String rerunCost(int cost) {
    return 'تشغيل مرة أخرى ($cost)';
  }

  @override
  String get clipDefaultName => 'مقطع';

  @override
  String get clipAnimating => 'جارٍ التحريك…';

  @override
  String get clipDone => 'تم';

  @override
  String get clipFailed => 'فشلت العملية. تمت إعادة عمليات التوليد.';

  @override
  String get playClip => 'تشغيل المقطع';

  @override
  String get clipSaved => 'المقطع موجود في الصور.';

  @override
  String get clipSaveFailed => 'تعذّر حفظ المقطع في الصور.';

  @override
  String get clipCantPlay => 'لا يمكن تشغيل المقطع.';

  @override
  String get animate => 'تحريك';

  @override
  String get motionFast => 'سريع، خلال ثوانٍ';

  @override
  String get motionSlow => 'بطيء، عشرات الدقائق';

  @override
  String get tileNewLook => 'مظهر جديد';

  @override
  String get frameNotReady => 'هذا الإطار ليس جاهزًا بعد.';

  @override
  String get runNotStarted => 'تعذّر بدء التصيير.';

  @override
  String get runFailedRefunded => 'فشل التصيير. تمت إعادة عمليات التوليد.';

  @override
  String get runLost => 'أُعيد تشغيل الخادم في هذه الأثناء وفُقد التصيير.';

  @override
  String get errNoFace =>
      'لم نعثر على وجه. استخدم صورة شخصية لشخص واحد من الأمام.';

  @override
  String get errFaceTooSmall =>
      'الوجه صغير جدًا. اقتص الصورة أقرب إلى الرأس والكتفين.';

  @override
  String get errMaskTooSmallHair => 'لا يوجد شعر كافٍ في الصورة لتغييره.';

  @override
  String get errMouthNotVisible =>
      'يجب أن يكون الفم ظاهرًا. انظر إلى العدسة دون أن تضع يدك أمام وجهك.';

  @override
  String get errNoBeardToShave => 'لا توجد لحية في الصورة لحلاقتها.';

  @override
  String get errEyesNotVisible =>
      'يجب أن تكون العينان ظاهرتين. انظر إلى العدسة دون يد أو شعر يغطي عينيك.';

  @override
  String get errMaskTooLarge => 'الوجه قريب جدًا. أبعد الهاتف قليلًا.';

  @override
  String get errNoGlassesToRemove => 'لا توجد نظارات في الصورة.';

  @override
  String get errNothingToChange => 'لا يوجد ما يمكن تغييره في هذه الصورة.';

  @override
  String get errBusy =>
      'هناك تصيير آخر قيد التشغيل. إلى أن ينتهي لا يمكنك بدء تصيير جديد ولا التحريك. قد يستغرق مقطع «الشعر في الريح» نحو 20 دقيقة.';

  @override
  String get errOffline =>
      'تعذّر الوصول إلى الخادم. تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get errAccessDenied =>
      'رفض الخادم الوصول. هذا الإصدار يحمل رمزًا خاطئًا.';

  @override
  String get errNotFound => 'لم يعد الخادم يعرف هذا التصيير. ابدأه من جديد.';

  @override
  String get errPlanRejected => 'رفض الخادم الخطة. لا يمكن إرسال هذه الصورة.';

  @override
  String errServer(int status) {
    return 'تعطّل الخادم ($status). حاول مرة أخرى بعد قليل.';
  }

  @override
  String errGeneric(String error) {
    return 'حدث خطأ ما: $error';
  }

  @override
  String get photoUnreadable => 'تعذّرت قراءة الصورة. استخدم JPEG أو PNG.';

  @override
  String get stageWaitingServer => 'في انتظار الخادم…';

  @override
  String get stageBeard => 'جارٍ تعديل اللحية…';

  @override
  String get stageGlasses => 'جارٍ وضع النظارات…';

  @override
  String get stageHair => 'جارٍ قص الشعر…';

  @override
  String get stageQueue => 'في الانتظار بالطابور…';

  @override
  String stagePainting(int current, int total) {
    return 'جارٍ الرسم $current/$total';
  }
}
