// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Dieser Build hat kein Server-Token (make run, .env.local). Die Analyse funktioniert, das Rendern nicht.';

  @override
  String get homeEmpty => 'Hier ist noch nichts. Fang mit einem Selfie an.';

  @override
  String get homeNew => 'Neue Fotobox';

  @override
  String get delete => 'Löschen';

  @override
  String get statusRunning => 'Läuft';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Bilder',
      one: '$n Bild',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Teilweise fehlgeschlagen';

  @override
  String get statusFailed => 'Fehlgeschlagen';

  @override
  String get statusRejected => 'Nicht gestartet';

  @override
  String get statusLost => 'Auf dem Server verloren';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Frontales Porträt einer Person, das Gesicht gut sichtbar.';

  @override
  String get selfieAnalysing => 'Ich sehe mir das Foto an…';

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get pickGallery => 'Aus der Galerie wählen';

  @override
  String get stepKeep => 'Beibehalten';

  @override
  String get stepNext => 'Weiter';

  @override
  String get hairTitle => 'Haare';

  @override
  String get beardTitle => 'Bart';

  @override
  String get glassesTitle => 'Brille';

  @override
  String get glassesFinish => 'Fassung';

  @override
  String get hairWomen => 'Frauen';

  @override
  String get hairMen => 'Männer';

  @override
  String get hairKeepCut => 'Frisur behalten, nur die Farbe ändern';

  @override
  String get hairColour => 'Farbe';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Farbe (auf dem Foto: $colour)';
  }

  @override
  String get hairNoChange => 'Keine Änderung';

  @override
  String get stylesTitle => 'Stile';

  @override
  String get frameCount => 'Wie viele Bilder';

  @override
  String get mixes => 'Fertige Mixe';

  @override
  String pickedOf(int picked, int count) {
    return 'Ausgewählt: $picked von $count';
  }

  @override
  String get mediumIllustration => 'Gemälde';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Stil suchen';

  @override
  String get pickSomething => 'Wähle mindestens eine Änderung oder einen Stil.';

  @override
  String get startBooth => 'Fotobox starten';

  @override
  String get mixGalerie => 'Galerie';

  @override
  String get mixKomiks => 'Pop und Comic';

  @override
  String get mixEpochy => 'Reise durch die Epochen';

  @override
  String get mixAsie => 'Asien';

  @override
  String get mixCesko => 'Tschechische Spur';

  @override
  String get boothTitle => 'Fotobox';

  @override
  String get boothSomeFailed =>
      'Einige Bilder sind fehlgeschlagen. Die Generierungen dafür wurden erstattet.';

  @override
  String get layoutGrid => 'Raster';

  @override
  String get layoutStrip => 'Streifen';

  @override
  String get saveToPhotos => 'In Fotos sichern';

  @override
  String get share => 'Teilen';

  @override
  String get stripSaved => 'Der Streifen ist in Fotos.';

  @override
  String get stripSaveFailed =>
      'Der Streifen konnte nicht in Fotos gesichert werden.';

  @override
  String get nothingReady => 'Noch ist kein Bild fertig.';

  @override
  String get rerun => 'Erneut starten';

  @override
  String rerunCost(int cost) {
    return 'Erneut starten ($cost)';
  }

  @override
  String get clipDefaultName => 'Clip';

  @override
  String get clipAnimating => 'Wird animiert…';

  @override
  String get clipDone => 'Fertig';

  @override
  String get clipFailed =>
      'Das hat nicht geklappt. Die Generierungen wurden erstattet.';

  @override
  String get playClip => 'Clip abspielen';

  @override
  String get clipSaved => 'Der Clip ist in Fotos.';

  @override
  String get clipSaveFailed =>
      'Der Clip konnte nicht in Fotos gesichert werden.';

  @override
  String get clipCantPlay => 'Der Clip lässt sich nicht abspielen.';

  @override
  String get animate => 'Animieren';

  @override
  String get motionFast => 'Schnell, in Sekunden';

  @override
  String get motionSlow => 'Langsam, zig Minuten';

  @override
  String get tileNewLook => 'Neuer Look';

  @override
  String get frameNotReady => 'Dieses Bild ist noch nicht fertig.';

  @override
  String get runNotStarted => 'Das Rendern konnte nicht gestartet werden.';

  @override
  String get runFailedRefunded =>
      'Das Rendern ist fehlgeschlagen. Die Generierungen wurden erstattet.';

  @override
  String get runLost =>
      'Der Server wurde inzwischen neu gestartet und hat das Rendern verloren.';

  @override
  String get errNoFace =>
      'Wir haben kein Gesicht gefunden. Nimm ein frontales Porträt einer Person.';

  @override
  String get errFaceTooSmall =>
      'Das Gesicht ist zu klein. Schneide das Foto näher an Kopf und Schultern zu.';

  @override
  String get errMaskTooSmallHair =>
      'Auf dem Foto sind nicht genug Haare, um sie umzustylen.';

  @override
  String get errMouthNotVisible =>
      'Der Mund muss sichtbar sein. Schau ins Objektiv, ohne Hand vor dem Gesicht.';

  @override
  String get errNoBeardToShave => 'Auf dem Foto ist kein Bart zum Rasieren.';

  @override
  String get errEyesNotVisible =>
      'Die Augen müssen sichtbar sein. Schau ins Objektiv, ohne Hand oder Haare vor den Augen.';

  @override
  String get errMaskTooLarge =>
      'Das Gesicht ist zu nah. Halte das Handy weiter weg.';

  @override
  String get errNoGlassesToRemove => 'Auf dem Foto ist keine Brille.';

  @override
  String get errNothingToChange => 'Auf diesem Foto gibt es nichts zu ändern.';

  @override
  String get errBusy =>
      'Es läuft noch ein anderes Rendern. Solange es nicht fertig ist, kannst du kein neues starten und auch nicht animieren. Der Clip „Haare im Wind“ kann etwa 20 Minuten dauern.';

  @override
  String get errOffline =>
      'Der Server ist nicht erreichbar. Prüfe deine Verbindung und versuche es erneut.';

  @override
  String get errAccessDenied =>
      'Der Server hat den Zugriff verweigert. Dieser Build hat das falsche Token.';

  @override
  String get errNotFound =>
      'Der Server kennt dieses Rendern nicht mehr. Starte es erneut.';

  @override
  String get errPlanRejected =>
      'Der Server hat den Plan abgelehnt. Dieses Foto kann nicht gesendet werden.';

  @override
  String errServer(int status) {
    return 'Der Server ist ausgefallen ($status). Versuche es gleich noch einmal.';
  }

  @override
  String errGeneric(String error) {
    return 'Etwas ist schiefgegangen: $error';
  }

  @override
  String get photoUnreadable =>
      'Das Foto konnte nicht gelesen werden. Nimm JPEG oder PNG.';

  @override
  String get stageWaitingServer => 'Warte auf den Server…';

  @override
  String get stageBeard => 'Bart wird bearbeitet…';

  @override
  String get stageGlasses => 'Brille wird aufgesetzt…';

  @override
  String get stageHair => 'Haare werden geschnitten…';

  @override
  String get stageQueue => 'Warte in der Warteschlange…';

  @override
  String stagePainting(int current, int total) {
    return 'Male $current/$total';
  }
}
