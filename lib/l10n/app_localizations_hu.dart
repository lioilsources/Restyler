// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Ennek a buildnek nincs szervertokenje (make run, .env.local). Az elemzés működik, a renderelés nem.';

  @override
  String get homeEmpty => 'Itt még nincs semmi. Kezdd egy szelfivel.';

  @override
  String get homeNew => 'Új fotófülke';

  @override
  String get delete => 'Törlés';

  @override
  String get statusRunning => 'Folyamatban';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n képkocka',
      one: '$n képkocka',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Egy része nem sikerült';

  @override
  String get statusFailed => 'Nem sikerült';

  @override
  String get statusRejected => 'Nem indult el';

  @override
  String get statusLost => 'Elveszett a szerveren';

  @override
  String get selfieTitle => 'Szelfi';

  @override
  String get selfieHint => 'Egy ember elölnézeti portréja, az arc jól látszik.';

  @override
  String get selfieAnalysing => 'Nézem a fotót…';

  @override
  String get takePhoto => 'Fotó készítése';

  @override
  String get pickGallery => 'Választás a galériából';

  @override
  String get stepKeep => 'Marad';

  @override
  String get stepNext => 'Tovább';

  @override
  String get hairTitle => 'Haj';

  @override
  String get beardTitle => 'Szakáll';

  @override
  String get glassesTitle => 'Szemüveg';

  @override
  String get glassesFinish => 'Keret';

  @override
  String get hairWomen => 'Nők';

  @override
  String get hairMen => 'Férfiak';

  @override
  String get hairKeepCut => 'A frizura marad, csak a szín változik';

  @override
  String get hairColour => 'Szín';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Szín (a fotón: $colour)';
  }

  @override
  String get hairNoChange => 'Változatlan';

  @override
  String get stylesTitle => 'Stílusok';

  @override
  String get frameCount => 'Hány képkocka';

  @override
  String get mixes => 'Kész keverékek';

  @override
  String pickedOf(int picked, int count) {
    return 'Kiválasztva: $picked / $count';
  }

  @override
  String get mediumIllustration => 'Festmény';

  @override
  String get mediumPhoto => 'Fotó';

  @override
  String get searchStyle => 'Stílus keresése';

  @override
  String get pickSomething => 'Válassz legalább egy módosítást vagy stílust.';

  @override
  String get startBooth => 'Fotófülke indítása';

  @override
  String get mixGalerie => 'Galéria';

  @override
  String get mixKomiks => 'Pop és képregény';

  @override
  String get mixEpochy => 'Korszakokon át';

  @override
  String get mixAsie => 'Ázsia';

  @override
  String get mixCesko => 'Cseh nyom';

  @override
  String get boothTitle => 'Fotófülke';

  @override
  String get boothSomeFailed =>
      'Néhány képkocka nem sikerült. A hozzájuk tartozó generálásokat visszatérítettük.';

  @override
  String get layoutGrid => 'Rács';

  @override
  String get layoutStrip => 'Csík';

  @override
  String get saveToPhotos => 'Mentés a Fotókba';

  @override
  String get share => 'Megosztás';

  @override
  String get stripSaved => 'A csík a Fotókban van.';

  @override
  String get stripSaveFailed => 'A csíkot nem sikerült a Fotókba menteni.';

  @override
  String get nothingReady => 'Még egyik képkocka sem kész.';

  @override
  String get rerun => 'Futtatás újra';

  @override
  String rerunCost(int cost) {
    return 'Futtatás újra ($cost)';
  }

  @override
  String get clipDefaultName => 'Klip';

  @override
  String get clipAnimating => 'Animálás…';

  @override
  String get clipDone => 'Kész';

  @override
  String get clipFailed => 'Nem sikerült. A generálásokat visszatérítettük.';

  @override
  String get playClip => 'Klip lejátszása';

  @override
  String get clipSaved => 'A klip a Fotókban van.';

  @override
  String get clipSaveFailed => 'A klipet nem sikerült a Fotókba menteni.';

  @override
  String get clipCantPlay => 'A klip nem játszható le.';

  @override
  String get animate => 'Animálás';

  @override
  String get motionFast => 'Gyors, másodpercek alatt';

  @override
  String get motionSlow => 'Lassú, tíz-húsz perc';

  @override
  String get tileNewLook => 'Új megjelenés';

  @override
  String get frameNotReady => 'Ez a képkocka még nem kész.';

  @override
  String get runNotStarted => 'A renderelést nem sikerült elindítani.';

  @override
  String get runFailedRefunded =>
      'A renderelés nem sikerült. A generálásokat visszatérítettük.';

  @override
  String get runLost =>
      'A szerver közben újraindult, és elvesztette a renderelést.';

  @override
  String get errNoFace =>
      'Nem találtunk arcot. Használj egy ember elölnézeti portréját.';

  @override
  String get errFaceTooSmall =>
      'Az arc túl kicsi. Vágd a fotót közelebb a fejhez és a vállhoz.';

  @override
  String get errMaskTooSmallHair => 'A fotón nincs elég haj az átalakításhoz.';

  @override
  String get errMouthNotVisible =>
      'A szájnak látszania kell. Nézz a lencsébe, kéz nélkül az arcod előtt.';

  @override
  String get errNoBeardToShave =>
      'A fotón nincs szakáll, amit le lehetne borotválni.';

  @override
  String get errEyesNotVisible =>
      'A szemnek látszania kell. Nézz a lencsébe, kéz vagy haj nélkül a szemed előtt.';

  @override
  String get errMaskTooLarge =>
      'Az arc túl közel van. Tartsd távolabb a telefont.';

  @override
  String get errNoGlassesToRemove => 'A fotón nincs szemüveg.';

  @override
  String get errNothingToChange => 'Ezen a fotón nincs mit változtatni.';

  @override
  String get errBusy =>
      'Másik renderelés fut. Amíg nem fejeződik be, nem indíthatsz újat, és animálni sem lehet. A „haj a szélben” klip kb. 20 percig is tarthat.';

  @override
  String get errOffline =>
      'A szerver nem érhető el. Ellenőrizd a kapcsolatot, és próbáld újra.';

  @override
  String get errAccessDenied =>
      'A szerver megtagadta a hozzáférést. Ennek a buildnek rossz a tokenje.';

  @override
  String get errNotFound =>
      'A szerver már nem ismeri ezt a renderelést. Indítsd el újra.';

  @override
  String get errPlanRejected =>
      'A szerver elutasította a tervet. Ez a fotó nem küldhető el.';

  @override
  String errServer(int status) {
    return 'A szerver hibázott ($status). Próbáld meg egy perc múlva.';
  }

  @override
  String errGeneric(String error) {
    return 'Valami elromlott: $error';
  }

  @override
  String get photoUnreadable =>
      'A fotót nem sikerült beolvasni. Használj JPEG vagy PNG fájlt.';

  @override
  String get stageWaitingServer => 'Várakozás a szerverre…';

  @override
  String get stageBeard => 'Szakáll szerkesztése…';

  @override
  String get stageGlasses => 'Szemüveg feltétele…';

  @override
  String get stageHair => 'Hajvágás…';

  @override
  String get stageQueue => 'Várakozás a sorban…';

  @override
  String stagePainting(int current, int total) {
    return 'Festés $current/$total';
  }
}
