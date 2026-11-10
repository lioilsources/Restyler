// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Aquesta versió no té token del servidor (make run, .env.local). L’anàlisi funciona, el renderitzat no.';

  @override
  String get homeEmpty => 'Encara no hi ha res. Comença amb una selfie.';

  @override
  String get homeNew => 'Nou fotomaton';

  @override
  String get delete => 'Elimina';

  @override
  String get statusRunning => 'En curs';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n fotogrames',
      one: '$n fotograma',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Fallada parcial';

  @override
  String get statusFailed => 'Ha fallat';

  @override
  String get statusRejected => 'No iniciat';

  @override
  String get statusLost => 'Perdut al servidor';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Retrat frontal d’una sola persona, amb la cara ben visible.';

  @override
  String get selfieAnalysing => 'Mirant la foto…';

  @override
  String get takePhoto => 'Fes una foto';

  @override
  String get pickGallery => 'Tria de la galeria';

  @override
  String get stepKeep => 'Deixa-ho';

  @override
  String get stepNext => 'Següent';

  @override
  String get hairTitle => 'Cabell';

  @override
  String get beardTitle => 'Barba';

  @override
  String get glassesTitle => 'Ulleres';

  @override
  String get glassesFinish => 'Muntura';

  @override
  String get hairWomen => 'Dones';

  @override
  String get hairMen => 'Homes';

  @override
  String get hairKeepCut => 'Mantén el pentinat, canvia només el color';

  @override
  String get hairColour => 'Color';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Color (a la foto: $colour)';
  }

  @override
  String get hairNoChange => 'Sense canvis';

  @override
  String get stylesTitle => 'Estils';

  @override
  String get frameCount => 'Quants fotogrames';

  @override
  String get mixes => 'Mescles fetes';

  @override
  String pickedOf(int picked, int count) {
    return 'Seleccionats $picked de $count';
  }

  @override
  String get mediumIllustration => 'Pintura';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Cerca un estil';

  @override
  String get pickSomething => 'Tria com a mínim un canvi o un estil.';

  @override
  String get startBooth => 'Inicia el fotomaton';

  @override
  String get mixGalerie => 'Galeria';

  @override
  String get mixKomiks => 'Pop i còmic';

  @override
  String get mixEpochy => 'A través de les èpoques';

  @override
  String get mixAsie => 'Àsia';

  @override
  String get mixCesko => 'Petjada txeca';

  @override
  String get boothTitle => 'Fotomaton';

  @override
  String get boothSomeFailed =>
      'Alguns fotogrames han fallat. Les generacions d’aquests s’han retornat.';

  @override
  String get layoutGrid => 'Quadrícula';

  @override
  String get layoutStrip => 'Tira';

  @override
  String get saveToPhotos => 'Desa a Fotos';

  @override
  String get share => 'Comparteix';

  @override
  String get stripSaved => 'La tira és a Fotos.';

  @override
  String get stripSaveFailed => 'No s’ha pogut desar la tira a Fotos.';

  @override
  String get nothingReady => 'Encara no hi ha cap fotograma a punt.';

  @override
  String get rerun => 'Torna a executar';

  @override
  String rerunCost(int cost) {
    return 'Torna a executar ($cost)';
  }

  @override
  String get clipDefaultName => 'Clip';

  @override
  String get clipAnimating => 'Animant…';

  @override
  String get clipDone => 'Fet';

  @override
  String get clipFailed => 'Ha fallat. Les generacions s’han retornat.';

  @override
  String get playClip => 'Reprodueix el clip';

  @override
  String get clipSaved => 'El clip és a Fotos.';

  @override
  String get clipSaveFailed => 'No s’ha pogut desar el clip a Fotos.';

  @override
  String get clipCantPlay => 'No es pot reproduir el clip.';

  @override
  String get animate => 'Anima';

  @override
  String get motionFast => 'Ràpid, en pocs segons';

  @override
  String get motionSlow => 'Lent, desenes de minuts';

  @override
  String get tileNewLook => 'Nou aspecte';

  @override
  String get frameNotReady => 'Aquest fotograma encara no està a punt.';

  @override
  String get runNotStarted => 'No s’ha pogut iniciar el renderitzat.';

  @override
  String get runFailedRefunded =>
      'El renderitzat ha fallat. Les generacions s’han retornat.';

  @override
  String get runLost =>
      'Mentrestant el servidor s’ha reiniciat i ha perdut el renderitzat.';

  @override
  String get errNoFace =>
      'No hem trobat cap cara. Fes servir un retrat frontal d’una sola persona.';

  @override
  String get errFaceTooSmall =>
      'La cara és massa petita. Retalla la foto més a prop del cap i les espatlles.';

  @override
  String get errMaskTooSmallHair =>
      'A la foto no hi ha prou cabell per canviar-lo.';

  @override
  String get errMouthNotVisible =>
      'La boca ha de ser visible. Mira l’objectiu, sense la mà davant de la cara.';

  @override
  String get errNoBeardToShave => 'A la foto no hi ha cap barba per afaitar.';

  @override
  String get errEyesNotVisible =>
      'Els ulls han de ser visibles. Mira l’objectiu, sense mà ni cabell sobre els ulls.';

  @override
  String get errMaskTooLarge =>
      'La cara és massa a prop. Aguanta el telèfon més lluny.';

  @override
  String get errNoGlassesToRemove => 'A la foto no hi ha ulleres.';

  @override
  String get errNothingToChange => 'En aquesta foto no hi ha res per canviar.';

  @override
  String get errBusy =>
      'Hi ha un altre renderitzat en curs. Fins que no acabi, no en pots iniciar un de nou ni animar. El clip «cabells al vent» pot trigar uns 20 minuts.';

  @override
  String get errOffline =>
      'No es pot accedir al servidor. Comprova la connexió i torna-ho a provar.';

  @override
  String get errAccessDenied =>
      'El servidor ha rebutjat l’accés. Aquesta versió té un token incorrecte.';

  @override
  String get errNotFound =>
      'El servidor ja no coneix aquest renderitzat. Torna a iniciar-lo.';

  @override
  String get errPlanRejected =>
      'El servidor ha rebutjat el pla. Aquesta foto no es pot enviar.';

  @override
  String errServer(int status) {
    return 'El servidor ha fallat ($status). Torna-ho a provar d’aquí a una estona.';
  }

  @override
  String errGeneric(String error) {
    return 'Ha anat malament alguna cosa: $error';
  }

  @override
  String get photoUnreadable =>
      'No s’ha pogut llegir la foto. Fes servir JPEG o PNG.';

  @override
  String get stageWaitingServer => 'Esperant el servidor…';

  @override
  String get stageBeard => 'Retocant la barba…';

  @override
  String get stageGlasses => 'Posant les ulleres…';

  @override
  String get stageHair => 'Tallant els cabells…';

  @override
  String get stageQueue => 'Esperant a la cua…';

  @override
  String stagePainting(int current, int total) {
    return 'Pintant $current/$total';
  }
}
