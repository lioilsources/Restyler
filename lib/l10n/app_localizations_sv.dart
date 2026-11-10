// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Den här builden saknar servertoken (make run, .env.local). Analysen fungerar, renderingen gör det inte.';

  @override
  String get homeEmpty => 'Här finns inget ännu. Börja med en selfie.';

  @override
  String get homeNew => 'Ny fotoautomat';

  @override
  String get delete => 'Ta bort';

  @override
  String get statusRunning => 'Pågår';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n bilder',
      one: '$n bild',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Delvis misslyckat';

  @override
  String get statusFailed => 'Misslyckades';

  @override
  String get statusRejected => 'Ej startad';

  @override
  String get statusLost => 'Förlorad på servern';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Porträtt av en person framifrån, ansiktet väl synligt.';

  @override
  String get selfieAnalysing => 'Tittar på fotot…';

  @override
  String get takePhoto => 'Ta ett foto';

  @override
  String get pickGallery => 'Välj från galleriet';

  @override
  String get stepKeep => 'Behåll';

  @override
  String get stepNext => 'Nästa';

  @override
  String get hairTitle => 'Hår';

  @override
  String get beardTitle => 'Skägg';

  @override
  String get glassesTitle => 'Glasögon';

  @override
  String get glassesFinish => 'Båge';

  @override
  String get hairWomen => 'Kvinnor';

  @override
  String get hairMen => 'Män';

  @override
  String get hairKeepCut => 'Behåll frisyren, ändra bara färgen';

  @override
  String get hairColour => 'Färg';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Färg (på fotot: $colour)';
  }

  @override
  String get hairNoChange => 'Ingen ändring';

  @override
  String get stylesTitle => 'Stilar';

  @override
  String get frameCount => 'Hur många bilder';

  @override
  String get mixes => 'Färdiga mixar';

  @override
  String pickedOf(int picked, int count) {
    return 'Valda $picked av $count';
  }

  @override
  String get mediumIllustration => 'Målning';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Sök stil';

  @override
  String get pickSomething => 'Välj minst en ändring eller stil.';

  @override
  String get startBooth => 'Starta fotoautomaten';

  @override
  String get mixGalerie => 'Galleri';

  @override
  String get mixKomiks => 'Pop och serier';

  @override
  String get mixEpochy => 'Genom epokerna';

  @override
  String get mixAsie => 'Asien';

  @override
  String get mixCesko => 'Tjeckiskt spår';

  @override
  String get boothTitle => 'Fotoautomat';

  @override
  String get boothSomeFailed =>
      'Vissa bilder misslyckades. Generationerna för dem har återbetalats.';

  @override
  String get layoutGrid => 'Rutnät';

  @override
  String get layoutStrip => 'Remsa';

  @override
  String get saveToPhotos => 'Spara i Foton';

  @override
  String get share => 'Dela';

  @override
  String get stripSaved => 'Remsan finns i Foton.';

  @override
  String get stripSaveFailed => 'Remsan kunde inte sparas i Foton.';

  @override
  String get nothingReady => 'Ingen bild är klar ännu.';

  @override
  String get rerun => 'Kör igen';

  @override
  String rerunCost(int cost) {
    return 'Kör igen ($cost)';
  }

  @override
  String get clipDefaultName => 'Klipp';

  @override
  String get clipAnimating => 'Animerar…';

  @override
  String get clipDone => 'Klart';

  @override
  String get clipFailed => 'Det misslyckades. Generationerna har återbetalats.';

  @override
  String get playClip => 'Spela upp klipp';

  @override
  String get clipSaved => 'Klippet finns i Foton.';

  @override
  String get clipSaveFailed => 'Klippet kunde inte sparas i Foton.';

  @override
  String get clipCantPlay => 'Klippet kan inte spelas upp.';

  @override
  String get animate => 'Animera';

  @override
  String get motionFast => 'Snabbt, på några sekunder';

  @override
  String get motionSlow => 'Långsamt, flera tiotal minuter';

  @override
  String get tileNewLook => 'Ny look';

  @override
  String get frameNotReady => 'Den här bilden är inte klar ännu.';

  @override
  String get runNotStarted => 'Renderingen kunde inte startas.';

  @override
  String get runFailedRefunded =>
      'Renderingen misslyckades. Generationerna har återbetalats.';

  @override
  String get runLost =>
      'Servern startades om under tiden och tappade renderingen.';

  @override
  String get errNoFace =>
      'Vi hittade inget ansikte. Använd ett porträtt av en person framifrån.';

  @override
  String get errFaceTooSmall =>
      'Ansiktet är för litet. Beskär fotot närmare huvud och axlar.';

  @override
  String get errMaskTooSmallHair =>
      'Det finns inte tillräckligt med hår på fotot för att ändra.';

  @override
  String get errMouthNotVisible =>
      'Munnen måste synas. Titta in i linsen, utan hand framför ansiktet.';

  @override
  String get errNoBeardToShave => 'Det finns inget skägg på fotot att raka.';

  @override
  String get errEyesNotVisible =>
      'Ögonen måste synas. Titta in i linsen, utan hand eller hår framför ögonen.';

  @override
  String get errMaskTooLarge =>
      'Ansiktet är för nära. Håll telefonen längre bort.';

  @override
  String get errNoGlassesToRemove => 'Det finns inga glasögon på fotot.';

  @override
  String get errNothingToChange =>
      'Det finns inget att ändra på det här fotot.';

  @override
  String get errBusy =>
      'En annan rendering pågår. Tills den är klar kan du inte starta en ny eller animera. Klippet ”hår i vinden” kan ta cirka 20 minuter.';

  @override
  String get errOffline =>
      'Servern går inte att nå. Kontrollera anslutningen och försök igen.';

  @override
  String get errAccessDenied =>
      'Servern nekade åtkomst. Den här builden har fel token.';

  @override
  String get errNotFound =>
      'Servern känner inte längre till den här renderingen. Starta den igen.';

  @override
  String get errPlanRejected =>
      'Servern avvisade planen. Det här fotot kan inte skickas.';

  @override
  String errServer(int status) {
    return 'Servern fick ett fel ($status). Försök igen om en stund.';
  }

  @override
  String errGeneric(String error) {
    return 'Något gick fel: $error';
  }

  @override
  String get photoUnreadable =>
      'Fotot gick inte att läsa. Använd JPEG eller PNG.';

  @override
  String get stageWaitingServer => 'Väntar på servern…';

  @override
  String get stageBeard => 'Justerar skägget…';

  @override
  String get stageGlasses => 'Sätter på glasögonen…';

  @override
  String get stageHair => 'Klipper håret…';

  @override
  String get stageQueue => 'Väntar i kön…';

  @override
  String stagePainting(int current, int total) {
    return 'Målar $current/$total';
  }
}
