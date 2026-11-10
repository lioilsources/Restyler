// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Tento build nemá token servera (make run, .env.local). Analýza funguje, render nie.';

  @override
  String get homeEmpty => 'Zatiaľ tu nič nie je. Začni selfie.';

  @override
  String get homeNew => 'Nová fotobunka';

  @override
  String get delete => 'Zmazať';

  @override
  String get statusRunning => 'Prebieha';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n políčok',
      few: '$n políčka',
      one: '$n políčko',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Časť sa nepodarila';

  @override
  String get statusFailed => 'Nepodarilo sa';

  @override
  String get statusRejected => 'Nespustené';

  @override
  String get statusLost => 'Stratené na serveri';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint => 'Čelný portrét jedného človeka, tvár dobre vidieť.';

  @override
  String get selfieAnalysing => 'Prezerám fotku…';

  @override
  String get takePhoto => 'Odfotiť sa';

  @override
  String get pickGallery => 'Vybrať z galérie';

  @override
  String get stepKeep => 'Nechať';

  @override
  String get stepNext => 'Ďalej';

  @override
  String get hairTitle => 'Vlasy';

  @override
  String get beardTitle => 'Fúzy';

  @override
  String get glassesTitle => 'Okuliare';

  @override
  String get glassesFinish => 'Rámik';

  @override
  String get hairWomen => 'Ženy';

  @override
  String get hairMen => 'Muži';

  @override
  String get hairKeepCut => 'Nechať účes, zmeniť len farbu';

  @override
  String get hairColour => 'Farba';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Farba (na fotke $colour)';
  }

  @override
  String get hairNoChange => 'Bez zmeny';

  @override
  String get stylesTitle => 'Štýly';

  @override
  String get frameCount => 'Koľko políčok';

  @override
  String get mixes => 'Hotové mixy';

  @override
  String pickedOf(int picked, int count) {
    return 'Vybrané $picked z $count';
  }

  @override
  String get mediumIllustration => 'Maľba';

  @override
  String get mediumPhoto => 'Fotka';

  @override
  String get searchStyle => 'Hľadať štýl';

  @override
  String get pickSomething => 'Vyber aspoň jednu úpravu alebo štýl.';

  @override
  String get startBooth => 'Spustiť fotobunku';

  @override
  String get mixGalerie => 'Galéria';

  @override
  String get mixKomiks => 'Pop a komiks';

  @override
  String get mixEpochy => 'Cesta epochami';

  @override
  String get mixAsie => 'Ázia';

  @override
  String get mixCesko => 'Česká stopa';

  @override
  String get boothTitle => 'Fotobunka';

  @override
  String get boothSomeFailed =>
      'Niektoré políčka sa nepodarili. Generácie za ne sú vrátené.';

  @override
  String get layoutGrid => 'Mriežka';

  @override
  String get layoutStrip => 'Pás';

  @override
  String get saveToPhotos => 'Uložiť do Fotiek';

  @override
  String get share => 'Zdieľať';

  @override
  String get stripSaved => 'Pás je vo Fotkách.';

  @override
  String get stripSaveFailed => 'Pás sa nepodarilo uložiť do Fotiek.';

  @override
  String get nothingReady => 'Zatiaľ nie je hotové žiadne políčko.';

  @override
  String get rerun => 'Spustiť znova';

  @override
  String rerunCost(int cost) {
    return 'Spustiť znova ($cost)';
  }

  @override
  String get clipDefaultName => 'Klip';

  @override
  String get clipAnimating => 'Oživujem…';

  @override
  String get clipDone => 'Hotovo';

  @override
  String get clipFailed => 'Nepodarilo sa. Generácie sú vrátené.';

  @override
  String get playClip => 'Prehrať klip';

  @override
  String get clipSaved => 'Klip je vo Fotkách.';

  @override
  String get clipSaveFailed => 'Klip sa nepodarilo uložiť do Fotiek.';

  @override
  String get clipCantPlay => 'Klip sa nedá prehrať.';

  @override
  String get animate => 'Oživiť';

  @override
  String get motionFast => 'Rýchle, v priebehu sekúnd';

  @override
  String get motionSlow => 'Pomalé, desiatky minút';

  @override
  String get tileNewLook => 'Nový vzhľad';

  @override
  String get frameNotReady => 'Toto políčko ešte nie je hotové.';

  @override
  String get runNotStarted => 'Render sa nepodarilo spustiť.';

  @override
  String get runFailedRefunded => 'Render sa nepodaril. Generácie sú vrátené.';

  @override
  String get runLost => 'Server sa medzitým reštartoval a render stratil.';

  @override
  String get errNoFace =>
      'Tvár sme nenašli. Použi čelný portrét jedného človeka.';

  @override
  String get errFaceTooSmall =>
      'Tvár je príliš malá. Orež fotku bližšie k hlave a ramenám.';

  @override
  String get errMaskTooSmallHair =>
      'Na fotke nie je dosť vlasov, ktoré by sa dali preostrihať.';

  @override
  String get errMouthNotVisible =>
      'Ústa musia byť vidieť. Pozeraj sa do objektívu, bez ruky pred tvárou.';

  @override
  String get errNoBeardToShave => 'Na fotke nie sú fúzy na oholenie.';

  @override
  String get errEyesNotVisible =>
      'Oči musia byť vidieť. Pozeraj sa do objektívu, bez ruky a vlasov cez oči.';

  @override
  String get errMaskTooLarge => 'Tvár je príliš blízko. Drž telefón ďalej.';

  @override
  String get errNoGlassesToRemove => 'Na fotke nie sú okuliare.';

  @override
  String get errNothingToChange => 'Na tejto fotke nie je čo meniť.';

  @override
  String get errBusy =>
      'Beží ti iný render. Kým nedobehne, nový nespustíš a nejde ani Oživiť. Klip „vlasy vo vetre“ môže trvať okolo 20 minút.';

  @override
  String get errOffline =>
      'Server nie je dostupný. Skontroluj pripojenie a skús to znova.';

  @override
  String get errAccessDenied =>
      'Server odmietol prístup. Tento build má zlý token.';

  @override
  String get errNotFound => 'Server o tomto renderi už nevie. Spusti ho znova.';

  @override
  String get errPlanRejected =>
      'Server plán odmietol. Táto fotka sa nedá poslať.';

  @override
  String errServer(int status) {
    return 'Server zlyhal ($status). Skús to o chvíľu.';
  }

  @override
  String errGeneric(String error) {
    return 'Niečo sa nepodarilo: $error';
  }

  @override
  String get photoUnreadable =>
      'Fotku sa nepodarilo prečítať. Použi JPEG alebo PNG.';

  @override
  String get stageWaitingServer => 'Čakám na server…';

  @override
  String get stageBeard => 'Upravujem fúzy…';

  @override
  String get stageGlasses => 'Nasadzujem okuliare…';

  @override
  String get stageHair => 'Strihám…';

  @override
  String get stageQueue => 'Čakám vo fronte…';

  @override
  String stagePainting(int current, int total) {
    return 'Maľujem $current/$total';
  }
}
