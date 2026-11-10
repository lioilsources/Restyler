// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Ova verzija nema token poslužitelja (make run, .env.local). Analiza radi, renderiranje ne.';

  @override
  String get homeEmpty => 'Ovdje još nema ničega. Počni sa selfijem.';

  @override
  String get homeNew => 'Nova fotokabina';

  @override
  String get delete => 'Izbriši';

  @override
  String get statusRunning => 'U tijeku';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n okvira',
      few: '$n okvira',
      one: '$n okvir',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Dio nije uspio';

  @override
  String get statusFailed => 'Nije uspjelo';

  @override
  String get statusRejected => 'Nije pokrenuto';

  @override
  String get statusLost => 'Izgubljeno na poslužitelju';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Portret jedne osobe s prednje strane, lice dobro vidljivo.';

  @override
  String get selfieAnalysing => 'Pregledavam fotografiju…';

  @override
  String get takePhoto => 'Slikaj se';

  @override
  String get pickGallery => 'Odaberi iz galerije';

  @override
  String get stepKeep => 'Ostavi';

  @override
  String get stepNext => 'Dalje';

  @override
  String get hairTitle => 'Kosa';

  @override
  String get beardTitle => 'Brada';

  @override
  String get glassesTitle => 'Naočale';

  @override
  String get glassesFinish => 'Okvir';

  @override
  String get hairWomen => 'Žene';

  @override
  String get hairMen => 'Muškarci';

  @override
  String get hairKeepCut => 'Ostavi frizuru, promijeni samo boju';

  @override
  String get hairColour => 'Boja';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Boja (na fotografiji: $colour)';
  }

  @override
  String get hairNoChange => 'Bez promjene';

  @override
  String get stylesTitle => 'Stilovi';

  @override
  String get frameCount => 'Koliko okvira';

  @override
  String get mixes => 'Gotovi mixevi';

  @override
  String pickedOf(int picked, int count) {
    return 'Odabrano $picked od $count';
  }

  @override
  String get mediumIllustration => 'Slika';

  @override
  String get mediumPhoto => 'Fotografija';

  @override
  String get searchStyle => 'Traži stil';

  @override
  String get pickSomething => 'Odaberi barem jednu izmjenu ili stil.';

  @override
  String get startBooth => 'Pokreni fotokabinu';

  @override
  String get mixGalerie => 'Galerija';

  @override
  String get mixKomiks => 'Pop i strip';

  @override
  String get mixEpochy => 'Kroz epohe';

  @override
  String get mixAsie => 'Azija';

  @override
  String get mixCesko => 'Češki trag';

  @override
  String get boothTitle => 'Fotokabina';

  @override
  String get boothSomeFailed =>
      'Neki okviri nisu uspjeli. Generacije za njih su vraćene.';

  @override
  String get layoutGrid => 'Mreža';

  @override
  String get layoutStrip => 'Traka';

  @override
  String get saveToPhotos => 'Spremi u Fotografije';

  @override
  String get share => 'Podijeli';

  @override
  String get stripSaved => 'Traka je u Fotografijama.';

  @override
  String get stripSaveFailed =>
      'Traku nije bilo moguće spremiti u Fotografije.';

  @override
  String get nothingReady => 'Još nijedan okvir nije gotov.';

  @override
  String get rerun => 'Pokreni ponovno';

  @override
  String rerunCost(int cost) {
    return 'Pokreni ponovno ($cost)';
  }

  @override
  String get clipDefaultName => 'Isječak';

  @override
  String get clipAnimating => 'Animiram…';

  @override
  String get clipDone => 'Gotovo';

  @override
  String get clipFailed => 'Nije uspjelo. Generacije su vraćene.';

  @override
  String get playClip => 'Reproduciraj isječak';

  @override
  String get clipSaved => 'Isječak je u Fotografijama.';

  @override
  String get clipSaveFailed =>
      'Isječak nije bilo moguće spremiti u Fotografije.';

  @override
  String get clipCantPlay => 'Isječak se ne može reproducirati.';

  @override
  String get animate => 'Animiraj';

  @override
  String get motionFast => 'Brzo, u nekoliko sekundi';

  @override
  String get motionSlow => 'Sporo, deseci minuta';

  @override
  String get tileNewLook => 'Novi izgled';

  @override
  String get frameNotReady => 'Ovaj okvir još nije gotov.';

  @override
  String get runNotStarted => 'Renderiranje nije bilo moguće pokrenuti.';

  @override
  String get runFailedRefunded =>
      'Renderiranje nije uspjelo. Generacije su vraćene.';

  @override
  String get runLost =>
      'Poslužitelj se u međuvremenu ponovno pokrenuo i izgubio renderiranje.';

  @override
  String get errNoFace =>
      'Nismo našli lice. Upotrijebi portret jedne osobe s prednje strane.';

  @override
  String get errFaceTooSmall =>
      'Lice je premalo. Izreži fotografiju bliže glavi i ramenima.';

  @override
  String get errMaskTooSmallHair =>
      'Na fotografiji nema dovoljno kose za promjenu.';

  @override
  String get errMouthNotVisible =>
      'Usta moraju biti vidljiva. Gledaj u objektiv, bez ruke ispred lica.';

  @override
  String get errNoBeardToShave => 'Na fotografiji nema brade za brijanje.';

  @override
  String get errEyesNotVisible =>
      'Oči moraju biti vidljive. Gledaj u objektiv, bez ruke ili kose preko očiju.';

  @override
  String get errMaskTooLarge => 'Lice je preblizu. Drži telefon dalje.';

  @override
  String get errNoGlassesToRemove => 'Na fotografiji nema naočala.';

  @override
  String get errNothingToChange => 'Na ovoj fotografiji nema se što mijenjati.';

  @override
  String get errBusy =>
      'Traje drugo renderiranje. Dok ne završi, ne možeš pokrenuti novo niti animirati. Isječak „kosa na vjetru” može trajati oko 20 minuta.';

  @override
  String get errOffline =>
      'Poslužitelj nije dostupan. Provjeri vezu i pokušaj ponovno.';

  @override
  String get errAccessDenied =>
      'Poslužitelj je odbio pristup. Ova verzija ima pogrešan token.';

  @override
  String get errNotFound =>
      'Poslužitelj više ne zna za ovo renderiranje. Pokreni ga ponovno.';

  @override
  String get errPlanRejected =>
      'Poslužitelj je odbio plan. Ova se fotografija ne može poslati.';

  @override
  String errServer(int status) {
    return 'Poslužitelj je zakazao ($status). Pokušaj za trenutak.';
  }

  @override
  String errGeneric(String error) {
    return 'Nešto je pošlo po zlu: $error';
  }

  @override
  String get photoUnreadable =>
      'Fotografiju nije bilo moguće pročitati. Upotrijebi JPEG ili PNG.';

  @override
  String get stageWaitingServer => 'Čekam poslužitelj…';

  @override
  String get stageBeard => 'Uređujem bradu…';

  @override
  String get stageGlasses => 'Stavljam naočale…';

  @override
  String get stageHair => 'Šišam kosu…';

  @override
  String get stageQueue => 'Čekam u redu…';

  @override
  String stagePainting(int current, int total) {
    return 'Slikam $current/$total';
  }
}
