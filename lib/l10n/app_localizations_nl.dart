// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Deze build heeft geen servertoken (make run, .env.local). De analyse werkt, het renderen niet.';

  @override
  String get homeEmpty => 'Hier is nog niets. Begin met een selfie.';

  @override
  String get homeNew => 'Nieuw fotohokje';

  @override
  String get delete => 'Verwijderen';

  @override
  String get statusRunning => 'Bezig';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n beelden',
      one: '$n beeld',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Deels mislukt';

  @override
  String get statusFailed => 'Mislukt';

  @override
  String get statusRejected => 'Niet gestart';

  @override
  String get statusLost => 'Kwijt op de server';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Portret van één persoon van voren, gezicht goed zichtbaar.';

  @override
  String get selfieAnalysing => 'Ik bekijk de foto…';

  @override
  String get takePhoto => 'Foto maken';

  @override
  String get pickGallery => 'Kies uit galerij';

  @override
  String get stepKeep => 'Behouden';

  @override
  String get stepNext => 'Volgende';

  @override
  String get hairTitle => 'Haar';

  @override
  String get beardTitle => 'Baard';

  @override
  String get glassesTitle => 'Bril';

  @override
  String get glassesFinish => 'Montuur';

  @override
  String get hairWomen => 'Vrouwen';

  @override
  String get hairMen => 'Mannen';

  @override
  String get hairKeepCut => 'Kapsel houden, alleen de kleur veranderen';

  @override
  String get hairColour => 'Kleur';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Kleur (op de foto: $colour)';
  }

  @override
  String get hairNoChange => 'Geen wijziging';

  @override
  String get stylesTitle => 'Stijlen';

  @override
  String get frameCount => 'Hoeveel beelden';

  @override
  String get mixes => 'Kant-en-klare mixen';

  @override
  String pickedOf(int picked, int count) {
    return '$picked van $count gekozen';
  }

  @override
  String get mediumIllustration => 'Schilderij';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Stijl zoeken';

  @override
  String get pickSomething => 'Kies minstens één aanpassing of stijl.';

  @override
  String get startBooth => 'Fotohokje starten';

  @override
  String get mixGalerie => 'Galerij';

  @override
  String get mixKomiks => 'Pop en strips';

  @override
  String get mixEpochy => 'Door de tijdperken';

  @override
  String get mixAsie => 'Azië';

  @override
  String get mixCesko => 'Tsjechisch spoor';

  @override
  String get boothTitle => 'Fotohokje';

  @override
  String get boothSomeFailed =>
      'Sommige beelden zijn mislukt. De generaties ervoor zijn teruggegeven.';

  @override
  String get layoutGrid => 'Raster';

  @override
  String get layoutStrip => 'Strip';

  @override
  String get saveToPhotos => 'Bewaar in Foto’s';

  @override
  String get share => 'Delen';

  @override
  String get stripSaved => 'De strip staat in Foto’s.';

  @override
  String get stripSaveFailed => 'De strip kon niet in Foto’s worden bewaard.';

  @override
  String get nothingReady => 'Nog geen enkel beeld is klaar.';

  @override
  String get rerun => 'Opnieuw starten';

  @override
  String rerunCost(int cost) {
    return 'Opnieuw starten ($cost)';
  }

  @override
  String get clipDefaultName => 'Clip';

  @override
  String get clipAnimating => 'Animeren…';

  @override
  String get clipDone => 'Klaar';

  @override
  String get clipFailed => 'Mislukt. De generaties zijn teruggegeven.';

  @override
  String get playClip => 'Clip afspelen';

  @override
  String get clipSaved => 'De clip staat in Foto’s.';

  @override
  String get clipSaveFailed => 'De clip kon niet in Foto’s worden bewaard.';

  @override
  String get clipCantPlay => 'De clip kan niet worden afgespeeld.';

  @override
  String get animate => 'Animeren';

  @override
  String get motionFast => 'Snel, binnen seconden';

  @override
  String get motionSlow => 'Langzaam, tientallen minuten';

  @override
  String get tileNewLook => 'Nieuwe look';

  @override
  String get frameNotReady => 'Dit beeld is nog niet klaar.';

  @override
  String get runNotStarted => 'Het renderen kon niet worden gestart.';

  @override
  String get runFailedRefunded =>
      'Het renderen is mislukt. De generaties zijn teruggegeven.';

  @override
  String get runLost =>
      'De server is ondertussen herstart en is het renderen kwijtgeraakt.';

  @override
  String get errNoFace =>
      'We vonden geen gezicht. Gebruik een portret van één persoon van voren.';

  @override
  String get errFaceTooSmall =>
      'Het gezicht is te klein. Snijd de foto bij, dichter bij hoofd en schouders.';

  @override
  String get errMaskTooSmallHair =>
      'Er is niet genoeg haar op de foto om te veranderen.';

  @override
  String get errMouthNotVisible =>
      'De mond moet zichtbaar zijn. Kijk in de lens, zonder hand voor je gezicht.';

  @override
  String get errNoBeardToShave => 'Er is geen baard op de foto om te scheren.';

  @override
  String get errEyesNotVisible =>
      'De ogen moeten zichtbaar zijn. Kijk in de lens, zonder hand of haar voor je ogen.';

  @override
  String get errMaskTooLarge =>
      'Het gezicht is te dichtbij. Houd je telefoon verder weg.';

  @override
  String get errNoGlassesToRemove => 'Er is geen bril op de foto.';

  @override
  String get errNothingToChange => 'Er valt niets te veranderen op deze foto.';

  @override
  String get errBusy =>
      'Er loopt nog een andere render. Totdat die klaar is, kun je geen nieuwe starten en ook niet animeren. De clip “haar in de wind” kan zo’n 20 minuten duren.';

  @override
  String get errOffline =>
      'De server is niet bereikbaar. Controleer je verbinding en probeer het opnieuw.';

  @override
  String get errAccessDenied =>
      'De server weigerde toegang. Deze build heeft het verkeerde token.';

  @override
  String get errNotFound =>
      'De server kent deze render niet meer. Start hem opnieuw.';

  @override
  String get errPlanRejected =>
      'De server weigerde het plan. Deze foto kan niet worden verstuurd.';

  @override
  String errServer(int status) {
    return 'De server is uitgevallen ($status). Probeer het zo meteen opnieuw.';
  }

  @override
  String errGeneric(String error) {
    return 'Er ging iets mis: $error';
  }

  @override
  String get photoUnreadable =>
      'De foto kon niet worden gelezen. Gebruik JPEG of PNG.';

  @override
  String get stageWaitingServer => 'Wachten op de server…';

  @override
  String get stageBeard => 'Baard bewerken…';

  @override
  String get stageGlasses => 'Bril opzetten…';

  @override
  String get stageHair => 'Haar knippen…';

  @override
  String get stageQueue => 'Wachten in de wachtrij…';

  @override
  String stagePainting(int current, int total) {
    return 'Schilderen $current/$total';
  }
}
