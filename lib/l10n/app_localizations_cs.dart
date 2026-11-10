// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Tenhle build nemá token serveru (make run, .env.local). Analýza funguje, render ne.';

  @override
  String get homeEmpty => 'Zatím tu nic není. Začni selfie.';

  @override
  String get homeNew => 'Nová fotobuňka';

  @override
  String get delete => 'Smazat';

  @override
  String get statusRunning => 'Probíhá';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rámečků',
      few: '$n rámečky',
      one: '$n rámeček',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Část se nepovedla';

  @override
  String get statusFailed => 'Nepovedlo se';

  @override
  String get statusRejected => 'Nespuštěno';

  @override
  String get statusLost => 'Ztraceno na serveru';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Čelní portrét jednoho člověka, obličej dobře vidět.';

  @override
  String get selfieAnalysing => 'Prohlížím fotku…';

  @override
  String get takePhoto => 'Vyfotit se';

  @override
  String get pickGallery => 'Vybrat z galerie';

  @override
  String get stepKeep => 'Nechat';

  @override
  String get stepNext => 'Další';

  @override
  String get hairTitle => 'Vlasy';

  @override
  String get beardTitle => 'Vousy';

  @override
  String get glassesTitle => 'Brýle';

  @override
  String get glassesFinish => 'Provedení';

  @override
  String get hairWomen => 'Ženy';

  @override
  String get hairMen => 'Muži';

  @override
  String get hairKeepCut => 'Nechat účes, změnit jen barvu';

  @override
  String get hairColour => 'Barva';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Barva (na fotce $colour)';
  }

  @override
  String get hairNoChange => 'Beze změny';

  @override
  String get stylesTitle => 'Styly';

  @override
  String get frameCount => 'Kolik rámečků';

  @override
  String get mixes => 'Hotové mixy';

  @override
  String pickedOf(int picked, int count) {
    return 'Vybráno $picked z $count';
  }

  @override
  String get mediumIllustration => 'Malba';

  @override
  String get mediumPhoto => 'Fotka';

  @override
  String get searchStyle => 'Hledat styl';

  @override
  String get pickSomething => 'Vyber aspoň jednu úpravu nebo styl.';

  @override
  String get startBooth => 'Spustit fotobuňku';

  @override
  String get mixGalerie => 'Galerie';

  @override
  String get mixKomiks => 'Pop a komiks';

  @override
  String get mixEpochy => 'Cesta epochami';

  @override
  String get mixAsie => 'Asie';

  @override
  String get mixCesko => 'Česká stopa';

  @override
  String get boothTitle => 'Fotobuňka';

  @override
  String get boothSomeFailed =>
      'Některé rámečky se nepovedly. Generace za ně jsou vrácené.';

  @override
  String get layoutGrid => 'Mřížka';

  @override
  String get layoutStrip => 'Pás';

  @override
  String get saveToPhotos => 'Uložit do Fotek';

  @override
  String get share => 'Sdílet';

  @override
  String get stripSaved => 'Pás je ve Fotkách.';

  @override
  String get stripSaveFailed => 'Pás se nepodařilo uložit do Fotek.';

  @override
  String get nothingReady => 'Zatím není hotový žádný rámeček.';

  @override
  String get rerun => 'Spustit znovu';

  @override
  String rerunCost(int cost) {
    return 'Spustit znovu ($cost)';
  }

  @override
  String get clipDefaultName => 'Klip';

  @override
  String get clipAnimating => 'Oživuji…';

  @override
  String get clipDone => 'Hotovo';

  @override
  String get clipFailed => 'Nepovedlo se. Generace jsou vrácené.';

  @override
  String get playClip => 'Přehrát klip';

  @override
  String get clipSaved => 'Klip je ve Fotkách.';

  @override
  String get clipSaveFailed => 'Klip se nepodařilo uložit do Fotek.';

  @override
  String get clipCantPlay => 'Klip se nedá přehrát.';

  @override
  String get animate => 'Oživit';

  @override
  String get motionFast => 'Rychlé, během sekund';

  @override
  String get motionSlow => 'Pomalé, desítky minut';

  @override
  String get tileNewLook => 'Nový vzhled';

  @override
  String get frameNotReady => 'Tenhle rámeček ještě není hotový.';

  @override
  String get runNotStarted => 'Render se nepodařilo spustit.';

  @override
  String get runFailedRefunded => 'Render se nepovedl. Generace jsou vrácené.';

  @override
  String get runLost => 'Server se mezitím restartoval a render ztratil.';

  @override
  String get errNoFace =>
      'Tvář jsme nenašli. Použij čelní portrét jednoho člověka.';

  @override
  String get errFaceTooSmall =>
      'Tvář je moc malá. Ořízni fotku blíž k hlavě a ramenům.';

  @override
  String get errMaskTooSmallHair =>
      'Na fotce není dost vlasů, které by šlo přestříhat.';

  @override
  String get errMouthNotVisible =>
      'Ústa musí být vidět. Dívej se do objektivu, bez ruky před tváří.';

  @override
  String get errNoBeardToShave => 'Na fotce nejsou vousy k oholení.';

  @override
  String get errEyesNotVisible =>
      'Oči musí být vidět. Dívej se do objektivu, bez ruky a vlasů přes oči.';

  @override
  String get errMaskTooLarge => 'Tvář je moc blízko. Drž telefon dál.';

  @override
  String get errNoGlassesToRemove => 'Na fotce nejsou brýle.';

  @override
  String get errNothingToChange => 'Na téhle fotce není co změnit.';

  @override
  String get errBusy =>
      'Běží ti jiný render. Dokud nedoběhne, nový nespustíš a nejde ani Oživit. Klip „vlasy ve větru“ může trvat kolem 20 minut.';

  @override
  String get errOffline =>
      'Server není dostupný. Zkontroluj připojení a zkus to znovu.';

  @override
  String get errAccessDenied =>
      'Server odmítl přístup. Tenhle build má špatný token.';

  @override
  String get errNotFound => 'Server o tomhle renderu už neví. Spusť ho znovu.';

  @override
  String get errPlanRejected =>
      'Server plán odmítl. Tahle fotka se nedá poslat.';

  @override
  String errServer(int status) {
    return 'Server selhal ($status). Zkus to za chvíli.';
  }

  @override
  String errGeneric(String error) {
    return 'Něco se nepovedlo: $error';
  }

  @override
  String get photoUnreadable =>
      'Fotku se nepodařilo přečíst. Použij JPEG nebo PNG.';

  @override
  String get stageWaitingServer => 'Čekám na server…';

  @override
  String get stageBeard => 'Upravuji vousy…';

  @override
  String get stageGlasses => 'Nasazuji brýle…';

  @override
  String get stageHair => 'Stříhám…';

  @override
  String get stageQueue => 'Čekám ve frontě…';

  @override
  String stagePainting(int current, int total) {
    return 'Maluji $current/$total';
  }
}
