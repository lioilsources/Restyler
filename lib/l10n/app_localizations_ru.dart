// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'В этой сборке нет токена сервера (make run, .env.local). Анализ работает, рендер нет.';

  @override
  String get homeEmpty => 'Пока здесь пусто. Начните с селфи.';

  @override
  String get homeNew => 'Новая фотобудка';

  @override
  String get delete => 'Удалить';

  @override
  String get statusRunning => 'Выполняется';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n кадра',
      many: '$n кадров',
      few: '$n кадра',
      one: '$n кадр',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Часть не удалась';

  @override
  String get statusFailed => 'Не удалось';

  @override
  String get statusRejected => 'Не запущено';

  @override
  String get statusLost => 'Потеряно на сервере';

  @override
  String get selfieTitle => 'Селфи';

  @override
  String get selfieHint => 'Портрет одного человека анфас, лицо хорошо видно.';

  @override
  String get selfieAnalysing => 'Смотрю фото…';

  @override
  String get takePhoto => 'Сфотографироваться';

  @override
  String get pickGallery => 'Выбрать из галереи';

  @override
  String get stepKeep => 'Оставить';

  @override
  String get stepNext => 'Далее';

  @override
  String get hairTitle => 'Волосы';

  @override
  String get beardTitle => 'Борода';

  @override
  String get glassesTitle => 'Очки';

  @override
  String get glassesFinish => 'Оправа';

  @override
  String get hairWomen => 'Женщины';

  @override
  String get hairMen => 'Мужчины';

  @override
  String get hairKeepCut => 'Оставить причёску, изменить только цвет';

  @override
  String get hairColour => 'Цвет';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Цвет (на фото: $colour)';
  }

  @override
  String get hairNoChange => 'Без изменений';

  @override
  String get stylesTitle => 'Стили';

  @override
  String get frameCount => 'Сколько кадров';

  @override
  String get mixes => 'Готовые миксы';

  @override
  String pickedOf(int picked, int count) {
    return 'Выбрано $picked из $count';
  }

  @override
  String get mediumIllustration => 'Живопись';

  @override
  String get mediumPhoto => 'Фото';

  @override
  String get searchStyle => 'Искать стиль';

  @override
  String get pickSomething => 'Выберите хотя бы одно изменение или стиль.';

  @override
  String get startBooth => 'Запустить фотобудку';

  @override
  String get mixGalerie => 'Галерея';

  @override
  String get mixKomiks => 'Поп и комиксы';

  @override
  String get mixEpochy => 'Сквозь эпохи';

  @override
  String get mixAsie => 'Азия';

  @override
  String get mixCesko => 'Чешский след';

  @override
  String get boothTitle => 'Фотобудка';

  @override
  String get boothSomeFailed =>
      'Некоторые кадры не удались. Генерации за них возвращены.';

  @override
  String get layoutGrid => 'Сетка';

  @override
  String get layoutStrip => 'Лента';

  @override
  String get saveToPhotos => 'Сохранить в «Фото»';

  @override
  String get share => 'Поделиться';

  @override
  String get stripSaved => 'Лента сохранена в «Фото».';

  @override
  String get stripSaveFailed => 'Не удалось сохранить ленту в «Фото».';

  @override
  String get nothingReady => 'Пока ни один кадр не готов.';

  @override
  String get rerun => 'Запустить снова';

  @override
  String rerunCost(int cost) {
    return 'Запустить снова ($cost)';
  }

  @override
  String get clipDefaultName => 'Клип';

  @override
  String get clipAnimating => 'Оживляю…';

  @override
  String get clipDone => 'Готово';

  @override
  String get clipFailed => 'Не удалось. Генерации возвращены.';

  @override
  String get playClip => 'Воспроизвести клип';

  @override
  String get clipSaved => 'Клип сохранён в «Фото».';

  @override
  String get clipSaveFailed => 'Не удалось сохранить клип в «Фото».';

  @override
  String get clipCantPlay => 'Клип не воспроизводится.';

  @override
  String get animate => 'Оживить';

  @override
  String get motionFast => 'Быстро, за секунды';

  @override
  String get motionSlow => 'Медленно, десятки минут';

  @override
  String get tileNewLook => 'Новый образ';

  @override
  String get frameNotReady => 'Этот кадр ещё не готов.';

  @override
  String get runNotStarted => 'Не удалось запустить рендер.';

  @override
  String get runFailedRefunded => 'Рендер не удался. Генерации возвращены.';

  @override
  String get runLost => 'Сервер тем временем перезапустился и потерял рендер.';

  @override
  String get errNoFace =>
      'Лицо не найдено. Используйте портрет одного человека анфас.';

  @override
  String get errFaceTooSmall =>
      'Лицо слишком маленькое. Обрежьте фото ближе к голове и плечам.';

  @override
  String get errMaskTooSmallHair =>
      'На фото недостаточно волос, чтобы их менять.';

  @override
  String get errMouthNotVisible =>
      'Рот должен быть виден. Смотрите в объектив, без руки перед лицом.';

  @override
  String get errNoBeardToShave => 'На фото нет бороды, которую можно сбрить.';

  @override
  String get errEyesNotVisible =>
      'Глаза должны быть видны. Смотрите в объектив, без руки и волос перед глазами.';

  @override
  String get errMaskTooLarge => 'Лицо слишком близко. Держите телефон дальше.';

  @override
  String get errNoGlassesToRemove => 'На фото нет очков.';

  @override
  String get errNothingToChange => 'На этом фото нечего менять.';

  @override
  String get errBusy =>
      'Уже идёт другой рендер. Пока он не закончится, нельзя запустить новый и нельзя оживить. Клип «волосы на ветру» может занять около 20 минут.';

  @override
  String get errOffline =>
      'Сервер недоступен. Проверьте подключение и повторите попытку.';

  @override
  String get errAccessDenied =>
      'Сервер отказал в доступе. В этой сборке неверный токен.';

  @override
  String get errNotFound =>
      'Сервер больше не знает об этом рендере. Запустите его снова.';

  @override
  String get errPlanRejected =>
      'Сервер отклонил план. Это фото нельзя отправить.';

  @override
  String errServer(int status) {
    return 'Сбой сервера ($status). Повторите через минуту.';
  }

  @override
  String errGeneric(String error) {
    return 'Что-то пошло не так: $error';
  }

  @override
  String get photoUnreadable =>
      'Не удалось прочитать фото. Используйте JPEG или PNG.';

  @override
  String get stageWaitingServer => 'Жду сервер…';

  @override
  String get stageBeard => 'Правлю бороду…';

  @override
  String get stageGlasses => 'Надеваю очки…';

  @override
  String get stageHair => 'Стригу волосы…';

  @override
  String get stageQueue => 'Жду в очереди…';

  @override
  String stagePainting(int current, int total) {
    return 'Рисую $current/$total';
  }
}
