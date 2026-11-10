// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Ta wersja nie ma tokenu serwera (make run, .env.local). Analiza działa, renderowanie nie.';

  @override
  String get homeEmpty => 'Na razie nic tu nie ma. Zacznij od selfie.';

  @override
  String get homeNew => 'Nowa fotobudka';

  @override
  String get delete => 'Usuń';

  @override
  String get statusRunning => 'W toku';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n klatki',
      many: '$n klatek',
      few: '$n klatki',
      one: '$n klatka',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Część się nie udała';

  @override
  String get statusFailed => 'Nie udało się';

  @override
  String get statusRejected => 'Nie uruchomiono';

  @override
  String get statusLost => 'Utracone na serwerze';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Portret jednej osoby z przodu, twarz dobrze widoczna.';

  @override
  String get selfieAnalysing => 'Oglądam zdjęcie…';

  @override
  String get takePhoto => 'Zrób zdjęcie';

  @override
  String get pickGallery => 'Wybierz z galerii';

  @override
  String get stepKeep => 'Zostaw';

  @override
  String get stepNext => 'Dalej';

  @override
  String get hairTitle => 'Włosy';

  @override
  String get beardTitle => 'Broda';

  @override
  String get glassesTitle => 'Okulary';

  @override
  String get glassesFinish => 'Oprawki';

  @override
  String get hairWomen => 'Kobiety';

  @override
  String get hairMen => 'Mężczyźni';

  @override
  String get hairKeepCut => 'Zostaw fryzurę, zmień tylko kolor';

  @override
  String get hairColour => 'Kolor';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Kolor (na zdjęciu: $colour)';
  }

  @override
  String get hairNoChange => 'Bez zmian';

  @override
  String get stylesTitle => 'Style';

  @override
  String get frameCount => 'Ile klatek';

  @override
  String get mixes => 'Gotowe miksy';

  @override
  String pickedOf(int picked, int count) {
    return 'Wybrano $picked z $count';
  }

  @override
  String get mediumIllustration => 'Obraz';

  @override
  String get mediumPhoto => 'Zdjęcie';

  @override
  String get searchStyle => 'Szukaj stylu';

  @override
  String get pickSomething => 'Wybierz co najmniej jedną zmianę lub styl.';

  @override
  String get startBooth => 'Uruchom fotobudkę';

  @override
  String get mixGalerie => 'Galeria';

  @override
  String get mixKomiks => 'Pop i komiks';

  @override
  String get mixEpochy => 'Przez epoki';

  @override
  String get mixAsie => 'Azja';

  @override
  String get mixCesko => 'Czeski ślad';

  @override
  String get boothTitle => 'Fotobudka';

  @override
  String get boothSomeFailed =>
      'Niektóre klatki się nie udały. Generacje za nie zostały zwrócone.';

  @override
  String get layoutGrid => 'Siatka';

  @override
  String get layoutStrip => 'Pasek';

  @override
  String get saveToPhotos => 'Zapisz w Zdjęciach';

  @override
  String get share => 'Udostępnij';

  @override
  String get stripSaved => 'Pasek jest w Zdjęciach.';

  @override
  String get stripSaveFailed => 'Nie udało się zapisać paska w Zdjęciach.';

  @override
  String get nothingReady => 'Żadna klatka nie jest jeszcze gotowa.';

  @override
  String get rerun => 'Uruchom ponownie';

  @override
  String rerunCost(int cost) {
    return 'Uruchom ponownie ($cost)';
  }

  @override
  String get clipDefaultName => 'Klip';

  @override
  String get clipAnimating => 'Animuję…';

  @override
  String get clipDone => 'Gotowe';

  @override
  String get clipFailed => 'Nie udało się. Generacje zostały zwrócone.';

  @override
  String get playClip => 'Odtwórz klip';

  @override
  String get clipSaved => 'Klip jest w Zdjęciach.';

  @override
  String get clipSaveFailed => 'Nie udało się zapisać klipu w Zdjęciach.';

  @override
  String get clipCantPlay => 'Nie można odtworzyć klipu.';

  @override
  String get animate => 'Ożyw';

  @override
  String get motionFast => 'Szybko, w kilka sekund';

  @override
  String get motionSlow => 'Wolno, dziesiątki minut';

  @override
  String get tileNewLook => 'Nowy wygląd';

  @override
  String get frameNotReady => 'Ta klatka nie jest jeszcze gotowa.';

  @override
  String get runNotStarted => 'Nie udało się uruchomić renderowania.';

  @override
  String get runFailedRefunded =>
      'Renderowanie się nie udało. Generacje zostały zwrócone.';

  @override
  String get runLost =>
      'Serwer w międzyczasie się zrestartował i utracił renderowanie.';

  @override
  String get errNoFace =>
      'Nie znaleźliśmy twarzy. Użyj portretu jednej osoby z przodu.';

  @override
  String get errFaceTooSmall =>
      'Twarz jest za mała. Przytnij zdjęcie bliżej głowy i ramion.';

  @override
  String get errMaskTooSmallHair =>
      'Na zdjęciu nie ma dość włosów, które można zmienić.';

  @override
  String get errMouthNotVisible =>
      'Usta muszą być widoczne. Patrz w obiektyw, bez ręki przed twarzą.';

  @override
  String get errNoBeardToShave => 'Na zdjęciu nie ma brody do ogolenia.';

  @override
  String get errEyesNotVisible =>
      'Oczy muszą być widoczne. Patrz w obiektyw, bez ręki i włosów przed oczami.';

  @override
  String get errMaskTooLarge => 'Twarz jest za blisko. Trzymaj telefon dalej.';

  @override
  String get errNoGlassesToRemove => 'Na zdjęciu nie ma okularów.';

  @override
  String get errNothingToChange => 'Na tym zdjęciu nie ma czego zmieniać.';

  @override
  String get errBusy =>
      'Trwa inne renderowanie. Dopóki się nie skończy, nie uruchomisz nowego ani nie ożywisz. Klip „włosy na wietrze” może trwać około 20 minut.';

  @override
  String get errOffline =>
      'Serwer jest niedostępny. Sprawdź połączenie i spróbuj ponownie.';

  @override
  String get errAccessDenied =>
      'Serwer odmówił dostępu. Ta wersja ma zły token.';

  @override
  String get errNotFound =>
      'Serwer nie zna już tego renderowania. Uruchom je ponownie.';

  @override
  String get errPlanRejected =>
      'Serwer odrzucił plan. Tego zdjęcia nie można wysłać.';

  @override
  String errServer(int status) {
    return 'Serwer zawiódł ($status). Spróbuj za chwilę.';
  }

  @override
  String errGeneric(String error) {
    return 'Coś poszło nie tak: $error';
  }

  @override
  String get photoUnreadable =>
      'Nie udało się odczytać zdjęcia. Użyj JPEG lub PNG.';

  @override
  String get stageWaitingServer => 'Czekam na serwer…';

  @override
  String get stageBeard => 'Poprawiam brodę…';

  @override
  String get stageGlasses => 'Zakładam okulary…';

  @override
  String get stageHair => 'Strzygę włosy…';

  @override
  String get stageQueue => 'Czekam w kolejce…';

  @override
  String stagePainting(int current, int total) {
    return 'Maluję $current/$total';
  }
}
