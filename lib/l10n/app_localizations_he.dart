// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'בגרסה הזו אין אסימון שרת (make run, ‏.env.local). הניתוח עובד, העיבוד לא.';

  @override
  String get homeEmpty => 'עוד אין כאן כלום. אפשר להתחיל בסלפי.';

  @override
  String get homeNew => 'קיוסק תמונות חדש';

  @override
  String get delete => 'מחיקה';

  @override
  String get statusRunning => 'בתהליך';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n פריימים',
      two: '$n פריימים',
      one: 'פריים אחד',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'חלק נכשל';

  @override
  String get statusFailed => 'נכשל';

  @override
  String get statusRejected => 'לא הופעל';

  @override
  String get statusLost => 'אבד בשרת';

  @override
  String get selfieTitle => 'סלפי';

  @override
  String get selfieHint => 'דיוקן של אדם אחד מלפנים, כשהפנים נראים היטב.';

  @override
  String get selfieAnalysing => 'מסתכל על התמונה…';

  @override
  String get takePhoto => 'צילום תמונה';

  @override
  String get pickGallery => 'בחירה מהגלריה';

  @override
  String get stepKeep => 'להשאיר';

  @override
  String get stepNext => 'הבא';

  @override
  String get hairTitle => 'שיער';

  @override
  String get beardTitle => 'זקן';

  @override
  String get glassesTitle => 'משקפיים';

  @override
  String get glassesFinish => 'מסגרת';

  @override
  String get hairWomen => 'נשים';

  @override
  String get hairMen => 'גברים';

  @override
  String get hairKeepCut => 'להשאיר את התספורת ולשנות רק צבע';

  @override
  String get hairColour => 'צבע';

  @override
  String hairColourOnPhoto(String colour) {
    return 'צבע (בתמונה: $colour)';
  }

  @override
  String get hairNoChange => 'ללא שינוי';

  @override
  String get stylesTitle => 'סגנונות';

  @override
  String get frameCount => 'כמה פריימים';

  @override
  String get mixes => 'מיקסים מוכנים';

  @override
  String pickedOf(int picked, int count) {
    return 'נבחרו $picked מתוך $count';
  }

  @override
  String get mediumIllustration => 'ציור';

  @override
  String get mediumPhoto => 'תמונה';

  @override
  String get searchStyle => 'חיפוש סגנון';

  @override
  String get pickSomething => 'בחרו לפחות עריכה אחת או סגנון אחד.';

  @override
  String get startBooth => 'הפעלת הקיוסק';

  @override
  String get mixGalerie => 'גלריה';

  @override
  String get mixKomiks => 'פופ וקומיקס';

  @override
  String get mixEpochy => 'מסע בין תקופות';

  @override
  String get mixAsie => 'אסיה';

  @override
  String get mixCesko => 'עקבות צ׳כיות';

  @override
  String get boothTitle => 'קיוסק תמונות';

  @override
  String get boothSomeFailed => 'חלק מהפריימים נכשלו. היצירות שלהם הוחזרו.';

  @override
  String get layoutGrid => 'רשת';

  @override
  String get layoutStrip => 'רצועה';

  @override
  String get saveToPhotos => 'שמירה ב״תמונות״';

  @override
  String get share => 'שיתוף';

  @override
  String get stripSaved => 'הרצועה נמצאת ב״תמונות״.';

  @override
  String get stripSaveFailed => 'לא ניתן היה לשמור את הרצועה ב״תמונות״.';

  @override
  String get nothingReady => 'עדיין אין פריים מוכן.';

  @override
  String get rerun => 'הפעלה מחדש';

  @override
  String rerunCost(int cost) {
    return 'הפעלה מחדש ($cost)';
  }

  @override
  String get clipDefaultName => 'קליפ';

  @override
  String get clipAnimating => 'מנפישים…';

  @override
  String get clipDone => 'הסתיים';

  @override
  String get clipFailed => 'נכשל. היצירות הוחזרו.';

  @override
  String get playClip => 'הפעלת הקליפ';

  @override
  String get clipSaved => 'הקליפ נמצא ב״תמונות״.';

  @override
  String get clipSaveFailed => 'לא ניתן היה לשמור את הקליפ ב״תמונות״.';

  @override
  String get clipCantPlay => 'לא ניתן להפעיל את הקליפ.';

  @override
  String get animate => 'הנפשה';

  @override
  String get motionFast => 'מהיר, תוך שניות';

  @override
  String get motionSlow => 'איטי, עשרות דקות';

  @override
  String get tileNewLook => 'מראה חדש';

  @override
  String get frameNotReady => 'הפריים הזה עדיין לא מוכן.';

  @override
  String get runNotStarted => 'לא ניתן היה להתחיל את העיבוד.';

  @override
  String get runFailedRefunded => 'העיבוד נכשל. היצירות הוחזרו.';

  @override
  String get runLost => 'השרת הופעל מחדש בינתיים והעיבוד אבד.';

  @override
  String get errNoFace => 'לא מצאנו פנים. השתמשו בדיוקן של אדם אחד מלפנים.';

  @override
  String get errFaceTooSmall =>
      'הפנים קטנות מדי. חתכו את התמונה קרוב יותר לראש ולכתפיים.';

  @override
  String get errMaskTooSmallHair => 'אין בתמונה מספיק שיער כדי לשנות.';

  @override
  String get errMouthNotVisible =>
      'הפה חייב להיות גלוי. הביטו אל העדשה, בלי יד מול הפנים.';

  @override
  String get errNoBeardToShave => 'אין בתמונה זקן לגלח.';

  @override
  String get errEyesNotVisible =>
      'העיניים חייבות להיות גלויות. הביטו אל העדשה, בלי יד או שיער מעל העיניים.';

  @override
  String get errMaskTooLarge => 'הפנים קרובות מדי. החזיקו את הטלפון רחוק יותר.';

  @override
  String get errNoGlassesToRemove => 'אין משקפיים בתמונה.';

  @override
  String get errNothingToChange => 'אין מה לשנות בתמונה הזו.';

  @override
  String get errBusy =>
      'עיבוד אחר רץ כרגע. עד שיסתיים אי אפשר להתחיל עיבוד חדש וגם לא להנפיש. הקליפ ״שיער ברוח״ יכול להימשך כ־20 דקות.';

  @override
  String get errOffline => 'אי אפשר להגיע לשרת. בדקו את החיבור ונסו שוב.';

  @override
  String get errAccessDenied => 'השרת סירב לגישה. בגרסה הזו יש אסימון שגוי.';

  @override
  String get errNotFound => 'השרת כבר לא מכיר את העיבוד הזה. התחילו אותו מחדש.';

  @override
  String get errPlanRejected =>
      'השרת דחה את התוכנית. אי אפשר לשלוח את התמונה הזו.';

  @override
  String errServer(int status) {
    return 'השרת נכשל ($status). נסו שוב בעוד רגע.';
  }

  @override
  String errGeneric(String error) {
    return 'משהו השתבש: $error';
  }

  @override
  String get photoUnreadable =>
      'לא ניתן היה לקרוא את התמונה. השתמשו ב־JPEG או PNG.';

  @override
  String get stageWaitingServer => 'ממתין לשרת…';

  @override
  String get stageBeard => 'עורך את הזקן…';

  @override
  String get stageGlasses => 'מרכיב משקפיים…';

  @override
  String get stageHair => 'מסדר את השיער…';

  @override
  String get stageQueue => 'ממתין בתור…';

  @override
  String stagePainting(int current, int total) {
    return 'מצייר $current/$total';
  }
}
