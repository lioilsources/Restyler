// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Acest build nu are token de server (make run, .env.local). Analiza funcționează, randarea nu.';

  @override
  String get homeEmpty => 'Încă nu e nimic aici. Începe cu un selfie.';

  @override
  String get homeNew => 'Cabină foto nouă';

  @override
  String get delete => 'Șterge';

  @override
  String get statusRunning => 'În curs';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n de cadre',
      few: '$n cadre',
      one: '$n cadru',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'O parte a eșuat';

  @override
  String get statusFailed => 'Eșuat';

  @override
  String get statusRejected => 'Nepornit';

  @override
  String get statusLost => 'Pierdut pe server';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Portret din față al unei singure persoane, fața bine vizibilă.';

  @override
  String get selfieAnalysing => 'Mă uit la poză…';

  @override
  String get takePhoto => 'Fă o poză';

  @override
  String get pickGallery => 'Alege din galerie';

  @override
  String get stepKeep => 'Păstrează';

  @override
  String get stepNext => 'Înainte';

  @override
  String get hairTitle => 'Păr';

  @override
  String get beardTitle => 'Barbă';

  @override
  String get glassesTitle => 'Ochelari';

  @override
  String get glassesFinish => 'Ramă';

  @override
  String get hairWomen => 'Femei';

  @override
  String get hairMen => 'Bărbați';

  @override
  String get hairKeepCut => 'Păstrează freza, schimbă doar culoarea';

  @override
  String get hairColour => 'Culoare';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Culoare (în poză: $colour)';
  }

  @override
  String get hairNoChange => 'Fără schimbare';

  @override
  String get stylesTitle => 'Stiluri';

  @override
  String get frameCount => 'Câte cadre';

  @override
  String get mixes => 'Mixuri gata făcute';

  @override
  String pickedOf(int picked, int count) {
    return 'Selectate $picked din $count';
  }

  @override
  String get mediumIllustration => 'Pictură';

  @override
  String get mediumPhoto => 'Fotografie';

  @override
  String get searchStyle => 'Caută un stil';

  @override
  String get pickSomething => 'Alege cel puțin o modificare sau un stil.';

  @override
  String get startBooth => 'Pornește cabina foto';

  @override
  String get mixGalerie => 'Galerie';

  @override
  String get mixKomiks => 'Pop și benzi desenate';

  @override
  String get mixEpochy => 'Prin epoci';

  @override
  String get mixAsie => 'Asia';

  @override
  String get mixCesko => 'Urma cehă';

  @override
  String get boothTitle => 'Cabină foto';

  @override
  String get boothSomeFailed =>
      'Unele cadre au eșuat. Generările pentru ele au fost returnate.';

  @override
  String get layoutGrid => 'Grilă';

  @override
  String get layoutStrip => 'Bandă';

  @override
  String get saveToPhotos => 'Salvează în Poze';

  @override
  String get share => 'Distribuie';

  @override
  String get stripSaved => 'Banda este în Poze.';

  @override
  String get stripSaveFailed => 'Banda nu a putut fi salvată în Poze.';

  @override
  String get nothingReady => 'Încă nu este gata niciun cadru.';

  @override
  String get rerun => 'Rulează din nou';

  @override
  String rerunCost(int cost) {
    return 'Rulează din nou ($cost)';
  }

  @override
  String get clipDefaultName => 'Clip';

  @override
  String get clipAnimating => 'Se animă…';

  @override
  String get clipDone => 'Gata';

  @override
  String get clipFailed => 'A eșuat. Generările au fost returnate.';

  @override
  String get playClip => 'Redă clipul';

  @override
  String get clipSaved => 'Clipul este în Poze.';

  @override
  String get clipSaveFailed => 'Clipul nu a putut fi salvat în Poze.';

  @override
  String get clipCantPlay => 'Clipul nu poate fi redat.';

  @override
  String get animate => 'Animă';

  @override
  String get motionFast => 'Rapid, în câteva secunde';

  @override
  String get motionSlow => 'Lent, zeci de minute';

  @override
  String get tileNewLook => 'Look nou';

  @override
  String get frameNotReady => 'Acest cadru nu este încă gata.';

  @override
  String get runNotStarted => 'Randarea nu a putut fi pornită.';

  @override
  String get runFailedRefunded =>
      'Randarea a eșuat. Generările au fost returnate.';

  @override
  String get runLost => 'Între timp serverul a repornit și a pierdut randarea.';

  @override
  String get errNoFace =>
      'Nu am găsit o față. Folosește un portret din față al unei singure persoane.';

  @override
  String get errFaceTooSmall =>
      'Fața e prea mică. Decupează poza mai aproape de cap și de umeri.';

  @override
  String get errMaskTooSmallHair => 'În poză nu e destul păr de schimbat.';

  @override
  String get errMouthNotVisible =>
      'Gura trebuie să se vadă. Privește în obiectiv, fără mâna în fața feței.';

  @override
  String get errNoBeardToShave => 'În poză nu e nicio barbă de bărbierit.';

  @override
  String get errEyesNotVisible =>
      'Ochii trebuie să se vadă. Privește în obiectiv, fără mână sau păr peste ochi.';

  @override
  String get errMaskTooLarge =>
      'Fața e prea aproape. Ține telefonul mai departe.';

  @override
  String get errNoGlassesToRemove => 'În poză nu sunt ochelari.';

  @override
  String get errNothingToChange => 'În această poză nu e nimic de schimbat.';

  @override
  String get errBusy =>
      'Rulează o altă randare. Până nu se termină, nu poți porni una nouă și nici nu poți anima. Clipul „păr în vânt” poate dura în jur de 20 de minute.';

  @override
  String get errOffline =>
      'Serverul nu este accesibil. Verifică conexiunea și încearcă din nou.';

  @override
  String get errAccessDenied =>
      'Serverul a refuzat accesul. Acest build are un token greșit.';

  @override
  String get errNotFound =>
      'Serverul nu mai știe de această randare. Pornește-o din nou.';

  @override
  String get errPlanRejected =>
      'Serverul a respins planul. Această poză nu poate fi trimisă.';

  @override
  String errServer(int status) {
    return 'Serverul a eșuat ($status). Încearcă peste puțin.';
  }

  @override
  String errGeneric(String error) {
    return 'Ceva n-a mers: $error';
  }

  @override
  String get photoUnreadable =>
      'Poza nu a putut fi citită. Folosește JPEG sau PNG.';

  @override
  String get stageWaitingServer => 'Aștept serverul…';

  @override
  String get stageBeard => 'Aranjez barba…';

  @override
  String get stageGlasses => 'Pun ochelarii…';

  @override
  String get stageHair => 'Tund părul…';

  @override
  String get stageQueue => 'Aștept la coadă…';

  @override
  String stagePainting(int current, int total) {
    return 'Pictez $current/$total';
  }
}
