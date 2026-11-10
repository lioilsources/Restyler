// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Ta gradnja nima žetona strežnika (make run, .env.local). Analiza deluje, upodabljanje ne.';

  @override
  String get homeEmpty => 'Tu še ni ničesar. Začni s selfijem.';

  @override
  String get homeNew => 'Nova fotokabina';

  @override
  String get delete => 'Izbriši';

  @override
  String get statusRunning => 'V teku';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n sličic',
      few: '$n sličice',
      two: '$n sličici',
      one: '$n sličica',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Del ni uspel';

  @override
  String get statusFailed => 'Ni uspelo';

  @override
  String get statusRejected => 'Ni zagnano';

  @override
  String get statusLost => 'Izgubljeno na strežniku';

  @override
  String get selfieTitle => 'Selfi';

  @override
  String get selfieHint => 'Portret ene osebe od spredaj, obraz dobro viden.';

  @override
  String get selfieAnalysing => 'Pregledujem fotografijo…';

  @override
  String get takePhoto => 'Slikaj se';

  @override
  String get pickGallery => 'Izberi iz galerije';

  @override
  String get stepKeep => 'Pusti';

  @override
  String get stepNext => 'Naprej';

  @override
  String get hairTitle => 'Lasje';

  @override
  String get beardTitle => 'Brada';

  @override
  String get glassesTitle => 'Očala';

  @override
  String get glassesFinish => 'Okvir';

  @override
  String get hairWomen => 'Ženske';

  @override
  String get hairMen => 'Moški';

  @override
  String get hairKeepCut => 'Obdrži pričesko, spremeni samo barvo';

  @override
  String get hairColour => 'Barva';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Barva (na fotografiji: $colour)';
  }

  @override
  String get hairNoChange => 'Brez spremembe';

  @override
  String get stylesTitle => 'Slogi';

  @override
  String get frameCount => 'Koliko sličic';

  @override
  String get mixes => 'Pripravljene mešanice';

  @override
  String pickedOf(int picked, int count) {
    return 'Izbrano $picked od $count';
  }

  @override
  String get mediumIllustration => 'Slika';

  @override
  String get mediumPhoto => 'Fotografija';

  @override
  String get searchStyle => 'Išči slog';

  @override
  String get pickSomething => 'Izberi vsaj eno spremembo ali slog.';

  @override
  String get startBooth => 'Zaženi fotokabino';

  @override
  String get mixGalerie => 'Galerija';

  @override
  String get mixKomiks => 'Pop in stripi';

  @override
  String get mixEpochy => 'Skozi obdobja';

  @override
  String get mixAsie => 'Azija';

  @override
  String get mixCesko => 'Češka sled';

  @override
  String get boothTitle => 'Fotokabina';

  @override
  String get boothSomeFailed =>
      'Nekatere sličice niso uspele. Generacije zanje so vrnjene.';

  @override
  String get layoutGrid => 'Mreža';

  @override
  String get layoutStrip => 'Trak';

  @override
  String get saveToPhotos => 'Shrani v Fotografije';

  @override
  String get share => 'Deli';

  @override
  String get stripSaved => 'Trak je v Fotografijah.';

  @override
  String get stripSaveFailed => 'Traku ni bilo mogoče shraniti v Fotografije.';

  @override
  String get nothingReady => 'Nobena sličica še ni pripravljena.';

  @override
  String get rerun => 'Zaženi znova';

  @override
  String rerunCost(int cost) {
    return 'Zaženi znova ($cost)';
  }

  @override
  String get clipDefaultName => 'Posnetek';

  @override
  String get clipAnimating => 'Animiram…';

  @override
  String get clipDone => 'Končano';

  @override
  String get clipFailed => 'Ni uspelo. Generacije so vrnjene.';

  @override
  String get playClip => 'Predvajaj posnetek';

  @override
  String get clipSaved => 'Posnetek je v Fotografijah.';

  @override
  String get clipSaveFailed =>
      'Posnetka ni bilo mogoče shraniti v Fotografije.';

  @override
  String get clipCantPlay => 'Posnetka ni mogoče predvajati.';

  @override
  String get animate => 'Animiraj';

  @override
  String get motionFast => 'Hitro, v nekaj sekundah';

  @override
  String get motionSlow => 'Počasi, deset in več minut';

  @override
  String get tileNewLook => 'Nov videz';

  @override
  String get frameNotReady => 'Ta sličica še ni pripravljena.';

  @override
  String get runNotStarted => 'Upodabljanja ni bilo mogoče zagnati.';

  @override
  String get runFailedRefunded =>
      'Upodabljanje ni uspelo. Generacije so vrnjene.';

  @override
  String get runLost =>
      'Strežnik se je vmes znova zagnal in izgubil upodabljanje.';

  @override
  String get errNoFace =>
      'Obraza nismo našli. Uporabi portret ene osebe od spredaj.';

  @override
  String get errFaceTooSmall =>
      'Obraz je premajhen. Obreži fotografijo bližje glavi in ramenom.';

  @override
  String get errMaskTooSmallHair =>
      'Na fotografiji ni dovolj las za spremembo.';

  @override
  String get errMouthNotVisible =>
      'Usta morajo biti vidna. Glej v objektiv, brez roke pred obrazom.';

  @override
  String get errNoBeardToShave => 'Na fotografiji ni brade za britje.';

  @override
  String get errEyesNotVisible =>
      'Oči morajo biti vidne. Glej v objektiv, brez roke ali las čez oči.';

  @override
  String get errMaskTooLarge => 'Obraz je preblizu. Drži telefon dlje.';

  @override
  String get errNoGlassesToRemove => 'Na fotografiji ni očal.';

  @override
  String get errNothingToChange =>
      'Na tej fotografiji ni ničesar za spremeniti.';

  @override
  String get errBusy =>
      'Teče drugo upodabljanje. Dokler se ne konča, ne moreš zagnati novega in tudi animirati ne. Posnetek »lasje v vetru« lahko traja okoli 20 minut.';

  @override
  String get errOffline =>
      'Strežnik ni dosegljiv. Preveri povezavo in poskusi znova.';

  @override
  String get errAccessDenied =>
      'Strežnik je zavrnil dostop. Ta gradnja ima napačen žeton.';

  @override
  String get errNotFound =>
      'Strežnik tega upodabljanja ne pozna več. Zaženi ga znova.';

  @override
  String get errPlanRejected =>
      'Strežnik je plan zavrnil. Te fotografije ni mogoče poslati.';

  @override
  String errServer(int status) {
    return 'Strežnik je odpovedal ($status). Poskusi čez trenutek.';
  }

  @override
  String errGeneric(String error) {
    return 'Nekaj je šlo narobe: $error';
  }

  @override
  String get photoUnreadable =>
      'Fotografije ni bilo mogoče prebrati. Uporabi JPEG ali PNG.';

  @override
  String get stageWaitingServer => 'Čakam na strežnik…';

  @override
  String get stageBeard => 'Urejam brado…';

  @override
  String get stageGlasses => 'Nameščam očala…';

  @override
  String get stageHair => 'Striženje las…';

  @override
  String get stageQueue => 'Čakam v vrsti…';

  @override
  String stagePainting(int current, int total) {
    return 'Slikam $current/$total';
  }
}
