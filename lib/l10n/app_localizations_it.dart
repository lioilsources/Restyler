// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Questa build non ha il token del server (make run, .env.local). L’analisi funziona, il rendering no.';

  @override
  String get homeEmpty => 'Ancora niente qui. Inizia con un selfie.';

  @override
  String get homeNew => 'Nuova cabina fotografica';

  @override
  String get delete => 'Elimina';

  @override
  String get statusRunning => 'In corso';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n fotogrammi',
      one: '$n fotogramma',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Riuscito in parte';

  @override
  String get statusFailed => 'Non riuscito';

  @override
  String get statusRejected => 'Non avviato';

  @override
  String get statusLost => 'Perso sul server';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Ritratto frontale di una sola persona, viso ben visibile.';

  @override
  String get selfieAnalysing => 'Sto guardando la foto…';

  @override
  String get takePhoto => 'Scatta una foto';

  @override
  String get pickGallery => 'Scegli dalla galleria';

  @override
  String get stepKeep => 'Mantieni';

  @override
  String get stepNext => 'Avanti';

  @override
  String get hairTitle => 'Capelli';

  @override
  String get beardTitle => 'Barba';

  @override
  String get glassesTitle => 'Occhiali';

  @override
  String get glassesFinish => 'Montatura';

  @override
  String get hairWomen => 'Donne';

  @override
  String get hairMen => 'Uomini';

  @override
  String get hairKeepCut => 'Mantieni il taglio, cambia solo il colore';

  @override
  String get hairColour => 'Colore';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Colore (nella foto: $colour)';
  }

  @override
  String get hairNoChange => 'Nessuna modifica';

  @override
  String get stylesTitle => 'Stili';

  @override
  String get frameCount => 'Quanti fotogrammi';

  @override
  String get mixes => 'Mix pronti';

  @override
  String pickedOf(int picked, int count) {
    return 'Selezionati $picked su $count';
  }

  @override
  String get mediumIllustration => 'Dipinto';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Cerca uno stile';

  @override
  String get pickSomething => 'Scegli almeno una modifica o uno stile.';

  @override
  String get startBooth => 'Avvia la cabina fotografica';

  @override
  String get mixGalerie => 'Galleria';

  @override
  String get mixKomiks => 'Pop e fumetti';

  @override
  String get mixEpochy => 'Attraverso le epoche';

  @override
  String get mixAsie => 'Asia';

  @override
  String get mixCesko => 'Tracce ceche';

  @override
  String get boothTitle => 'Cabina fotografica';

  @override
  String get boothSomeFailed =>
      'Alcuni fotogrammi non sono riusciti. Le generazioni per questi sono state rimborsate.';

  @override
  String get layoutGrid => 'Griglia';

  @override
  String get layoutStrip => 'Striscia';

  @override
  String get saveToPhotos => 'Salva in Foto';

  @override
  String get share => 'Condividi';

  @override
  String get stripSaved => 'La striscia è in Foto.';

  @override
  String get stripSaveFailed => 'Impossibile salvare la striscia in Foto.';

  @override
  String get nothingReady => 'Nessun fotogramma è ancora pronto.';

  @override
  String get rerun => 'Riavvia';

  @override
  String rerunCost(int cost) {
    return 'Riavvia ($cost)';
  }

  @override
  String get clipDefaultName => 'Clip';

  @override
  String get clipAnimating => 'Animazione in corso…';

  @override
  String get clipDone => 'Fatto';

  @override
  String get clipFailed =>
      'Non è riuscito. Le generazioni sono state rimborsate.';

  @override
  String get playClip => 'Riproduci clip';

  @override
  String get clipSaved => 'La clip è in Foto.';

  @override
  String get clipSaveFailed => 'Impossibile salvare la clip in Foto.';

  @override
  String get clipCantPlay => 'Non è possibile riprodurre la clip.';

  @override
  String get animate => 'Anima';

  @override
  String get motionFast => 'Veloce, in pochi secondi';

  @override
  String get motionSlow => 'Lento, decine di minuti';

  @override
  String get tileNewLook => 'Nuovo look';

  @override
  String get frameNotReady => 'Questo fotogramma non è ancora pronto.';

  @override
  String get runNotStarted => 'Non è stato possibile avviare il rendering.';

  @override
  String get runFailedRefunded =>
      'Il rendering non è riuscito. Le generazioni sono state rimborsate.';

  @override
  String get runLost =>
      'Nel frattempo il server si è riavviato e ha perso il rendering.';

  @override
  String get errNoFace =>
      'Non abbiamo trovato un volto. Usa un ritratto frontale di una sola persona.';

  @override
  String get errFaceTooSmall =>
      'Il volto è troppo piccolo. Ritaglia la foto più vicino a testa e spalle.';

  @override
  String get errMaskTooSmallHair =>
      'Nella foto non ci sono abbastanza capelli da cambiare.';

  @override
  String get errMouthNotVisible =>
      'La bocca deve essere visibile. Guarda nell’obiettivo, senza la mano davanti al viso.';

  @override
  String get errNoBeardToShave => 'Nella foto non c’è nessuna barba da rasare.';

  @override
  String get errEyesNotVisible =>
      'Gli occhi devono essere visibili. Guarda nell’obiettivo, senza mano o capelli sugli occhi.';

  @override
  String get errMaskTooLarge =>
      'Il volto è troppo vicino. Tieni il telefono più lontano.';

  @override
  String get errNoGlassesToRemove => 'Nella foto non ci sono occhiali.';

  @override
  String get errNothingToChange => 'In questa foto non c’è niente da cambiare.';

  @override
  String get errBusy =>
      'È in corso un altro rendering. Finché non termina non puoi avviarne uno nuovo né animare. La clip «capelli al vento» può durare circa 20 minuti.';

  @override
  String get errOffline =>
      'Il server non è raggiungibile. Controlla la connessione e riprova.';

  @override
  String get errAccessDenied =>
      'Il server ha rifiutato l’accesso. Questa build ha il token sbagliato.';

  @override
  String get errNotFound =>
      'Il server non conosce più questo rendering. Riavvialo.';

  @override
  String get errPlanRejected =>
      'Il server ha rifiutato il piano. Questa foto non può essere inviata.';

  @override
  String errServer(int status) {
    return 'Il server ha avuto un errore ($status). Riprova tra poco.';
  }

  @override
  String errGeneric(String error) {
    return 'Qualcosa è andato storto: $error';
  }

  @override
  String get photoUnreadable => 'Impossibile leggere la foto. Usa JPEG o PNG.';

  @override
  String get stageWaitingServer => 'In attesa del server…';

  @override
  String get stageBeard => 'Modifica della barba…';

  @override
  String get stageGlasses => 'Metto gli occhiali…';

  @override
  String get stageHair => 'Taglio i capelli…';

  @override
  String get stageQueue => 'In coda…';

  @override
  String stagePainting(int current, int total) {
    return 'Dipingo $current/$total';
  }
}
