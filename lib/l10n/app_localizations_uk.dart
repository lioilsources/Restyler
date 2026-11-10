// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'У цій збірці немає токена сервера (make run, .env.local). Аналіз працює, рендер ні.';

  @override
  String get homeEmpty => 'Тут поки порожньо. Почніть із селфі.';

  @override
  String get homeNew => 'Нова фотобудка';

  @override
  String get delete => 'Видалити';

  @override
  String get statusRunning => 'Триває';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n кадру',
      many: '$n кадрів',
      few: '$n кадри',
      one: '$n кадр',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Частина не вдалася';

  @override
  String get statusFailed => 'Не вдалося';

  @override
  String get statusRejected => 'Не запущено';

  @override
  String get statusLost => 'Втрачено на сервері';

  @override
  String get selfieTitle => 'Селфі';

  @override
  String get selfieHint => 'Портрет однієї людини анфас, обличчя добре видно.';

  @override
  String get selfieAnalysing => 'Дивлюся фото…';

  @override
  String get takePhoto => 'Сфотографуватися';

  @override
  String get pickGallery => 'Вибрати з галереї';

  @override
  String get stepKeep => 'Залишити';

  @override
  String get stepNext => 'Далі';

  @override
  String get hairTitle => 'Волосся';

  @override
  String get beardTitle => 'Борода';

  @override
  String get glassesTitle => 'Окуляри';

  @override
  String get glassesFinish => 'Оправа';

  @override
  String get hairWomen => 'Жінки';

  @override
  String get hairMen => 'Чоловіки';

  @override
  String get hairKeepCut => 'Залишити зачіску, змінити лише колір';

  @override
  String get hairColour => 'Колір';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Колір (на фото: $colour)';
  }

  @override
  String get hairNoChange => 'Без змін';

  @override
  String get stylesTitle => 'Стилі';

  @override
  String get frameCount => 'Скільки кадрів';

  @override
  String get mixes => 'Готові мікси';

  @override
  String pickedOf(int picked, int count) {
    return 'Вибрано $picked з $count';
  }

  @override
  String get mediumIllustration => 'Живопис';

  @override
  String get mediumPhoto => 'Фото';

  @override
  String get searchStyle => 'Шукати стиль';

  @override
  String get pickSomething => 'Виберіть принаймні одну зміну або стиль.';

  @override
  String get startBooth => 'Запустити фотобудку';

  @override
  String get mixGalerie => 'Галерея';

  @override
  String get mixKomiks => 'Поп і комікси';

  @override
  String get mixEpochy => 'Крізь епохи';

  @override
  String get mixAsie => 'Азія';

  @override
  String get mixCesko => 'Чеський слід';

  @override
  String get boothTitle => 'Фотобудка';

  @override
  String get boothSomeFailed =>
      'Деякі кадри не вдалися. Генерації за них повернено.';

  @override
  String get layoutGrid => 'Сітка';

  @override
  String get layoutStrip => 'Стрічка';

  @override
  String get saveToPhotos => 'Зберегти у «Фото»';

  @override
  String get share => 'Поділитися';

  @override
  String get stripSaved => 'Стрічку збережено у «Фото».';

  @override
  String get stripSaveFailed => 'Не вдалося зберегти стрічку у «Фото».';

  @override
  String get nothingReady => 'Поки жоден кадр не готовий.';

  @override
  String get rerun => 'Запустити знову';

  @override
  String rerunCost(int cost) {
    return 'Запустити знову ($cost)';
  }

  @override
  String get clipDefaultName => 'Кліп';

  @override
  String get clipAnimating => 'Оживлюю…';

  @override
  String get clipDone => 'Готово';

  @override
  String get clipFailed => 'Не вдалося. Генерації повернено.';

  @override
  String get playClip => 'Відтворити кліп';

  @override
  String get clipSaved => 'Кліп збережено у «Фото».';

  @override
  String get clipSaveFailed => 'Не вдалося зберегти кліп у «Фото».';

  @override
  String get clipCantPlay => 'Кліп не відтворюється.';

  @override
  String get animate => 'Оживити';

  @override
  String get motionFast => 'Швидко, за секунди';

  @override
  String get motionSlow => 'Повільно, десятки хвилин';

  @override
  String get tileNewLook => 'Новий вигляд';

  @override
  String get frameNotReady => 'Цей кадр ще не готовий.';

  @override
  String get runNotStarted => 'Не вдалося запустити рендер.';

  @override
  String get runFailedRefunded => 'Рендер не вдався. Генерації повернено.';

  @override
  String get runLost => 'Тим часом сервер перезапустився й втратив рендер.';

  @override
  String get errNoFace =>
      'Обличчя не знайдено. Використайте портрет однієї людини анфас.';

  @override
  String get errFaceTooSmall =>
      'Обличчя надто маленьке. Обріжте фото ближче до голови та плечей.';

  @override
  String get errMaskTooSmallHair =>
      'На фото замало волосся, щоб його змінювати.';

  @override
  String get errMouthNotVisible =>
      'Рот має бути видно. Дивіться в об’єктив, без руки перед обличчям.';

  @override
  String get errNoBeardToShave => 'На фото немає бороди, яку можна поголити.';

  @override
  String get errEyesNotVisible =>
      'Очі мають бути видні. Дивіться в об’єктив, без руки й волосся перед очима.';

  @override
  String get errMaskTooLarge => 'Обличчя надто близько. Тримайте телефон далі.';

  @override
  String get errNoGlassesToRemove => 'На фото немає окулярів.';

  @override
  String get errNothingToChange => 'На цьому фото нічого міняти.';

  @override
  String get errBusy =>
      'Уже триває інший рендер. Поки він не закінчиться, не можна запустити новий і не можна оживити. Кліп «волосся на вітрі» може тривати близько 20 хвилин.';

  @override
  String get errOffline =>
      'Сервер недоступний. Перевірте з’єднання й спробуйте ще раз.';

  @override
  String get errAccessDenied =>
      'Сервер відмовив у доступі. У цій збірці хибний токен.';

  @override
  String get errNotFound =>
      'Сервер більше не знає про цей рендер. Запустіть його знову.';

  @override
  String get errPlanRejected =>
      'Сервер відхилив план. Це фото не можна надіслати.';

  @override
  String errServer(int status) {
    return 'Збій сервера ($status). Спробуйте за хвилину.';
  }

  @override
  String errGeneric(String error) {
    return 'Щось пішло не так: $error';
  }

  @override
  String get photoUnreadable =>
      'Не вдалося прочитати фото. Використайте JPEG або PNG.';

  @override
  String get stageWaitingServer => 'Чекаю на сервер…';

  @override
  String get stageBeard => 'Правлю бороду…';

  @override
  String get stageGlasses => 'Одягаю окуляри…';

  @override
  String get stageHair => 'Стрижу волосся…';

  @override
  String get stageQueue => 'Чекаю в черзі…';

  @override
  String stagePainting(int current, int total) {
    return 'Малюю $current/$total';
  }
}
