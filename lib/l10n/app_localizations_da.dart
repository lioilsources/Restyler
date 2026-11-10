// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Denne build har intet servertoken (make run, .env.local). Analysen virker, rendering gør ikke.';

  @override
  String get homeEmpty => 'Her er intet endnu. Start med en selfie.';

  @override
  String get homeNew => 'Ny fotoboks';

  @override
  String get delete => 'Slet';

  @override
  String get statusRunning => 'I gang';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n billeder',
      one: '$n billede',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Delvist fejlet';

  @override
  String get statusFailed => 'Mislykkedes';

  @override
  String get statusRejected => 'Ikke startet';

  @override
  String get statusLost => 'Mistet på serveren';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Portræt af én person forfra, ansigtet tydeligt synligt.';

  @override
  String get selfieAnalysing => 'Kigger på billedet…';

  @override
  String get takePhoto => 'Tag et billede';

  @override
  String get pickGallery => 'Vælg fra galleri';

  @override
  String get stepKeep => 'Behold';

  @override
  String get stepNext => 'Næste';

  @override
  String get hairTitle => 'Hår';

  @override
  String get beardTitle => 'Skæg';

  @override
  String get glassesTitle => 'Briller';

  @override
  String get glassesFinish => 'Stel';

  @override
  String get hairWomen => 'Kvinder';

  @override
  String get hairMen => 'Mænd';

  @override
  String get hairKeepCut => 'Behold frisuren, skift kun farve';

  @override
  String get hairColour => 'Farve';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Farve (på billedet: $colour)';
  }

  @override
  String get hairNoChange => 'Ingen ændring';

  @override
  String get stylesTitle => 'Stilarter';

  @override
  String get frameCount => 'Hvor mange billeder';

  @override
  String get mixes => 'Færdige mix';

  @override
  String pickedOf(int picked, int count) {
    return 'Valgt $picked af $count';
  }

  @override
  String get mediumIllustration => 'Maleri';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Søg efter stil';

  @override
  String get pickSomething => 'Vælg mindst én ændring eller stil.';

  @override
  String get startBooth => 'Start fotoboksen';

  @override
  String get mixGalerie => 'Galleri';

  @override
  String get mixKomiks => 'Pop og tegneserie';

  @override
  String get mixEpochy => 'Gennem epokerne';

  @override
  String get mixAsie => 'Asien';

  @override
  String get mixCesko => 'Tjekkisk spor';

  @override
  String get boothTitle => 'Fotoboks';

  @override
  String get boothSomeFailed =>
      'Nogle billeder mislykkedes. Generationerne til dem er refunderet.';

  @override
  String get layoutGrid => 'Gitter';

  @override
  String get layoutStrip => 'Strimmel';

  @override
  String get saveToPhotos => 'Gem i Fotos';

  @override
  String get share => 'Del';

  @override
  String get stripSaved => 'Strimlen er i Fotos.';

  @override
  String get stripSaveFailed => 'Strimlen kunne ikke gemmes i Fotos.';

  @override
  String get nothingReady => 'Intet billede er klar endnu.';

  @override
  String get rerun => 'Kør igen';

  @override
  String rerunCost(int cost) {
    return 'Kør igen ($cost)';
  }

  @override
  String get clipDefaultName => 'Klip';

  @override
  String get clipAnimating => 'Animerer…';

  @override
  String get clipDone => 'Færdig';

  @override
  String get clipFailed => 'Det mislykkedes. Generationerne er refunderet.';

  @override
  String get playClip => 'Afspil klip';

  @override
  String get clipSaved => 'Klippet er i Fotos.';

  @override
  String get clipSaveFailed => 'Klippet kunne ikke gemmes i Fotos.';

  @override
  String get clipCantPlay => 'Klippet kan ikke afspilles.';

  @override
  String get animate => 'Animer';

  @override
  String get motionFast => 'Hurtigt, på få sekunder';

  @override
  String get motionSlow => 'Langsomt, mange minutter';

  @override
  String get tileNewLook => 'Nyt look';

  @override
  String get frameNotReady => 'Dette billede er ikke klar endnu.';

  @override
  String get runNotStarted => 'Renderingen kunne ikke startes.';

  @override
  String get runFailedRefunded =>
      'Renderingen mislykkedes. Generationerne er refunderet.';

  @override
  String get runLost =>
      'Serveren er i mellemtiden genstartet og har mistet renderingen.';

  @override
  String get errNoFace =>
      'Vi fandt ikke noget ansigt. Brug et portræt af én person forfra.';

  @override
  String get errFaceTooSmall =>
      'Ansigtet er for lille. Beskær billedet tættere på hoved og skuldre.';

  @override
  String get errMaskTooSmallHair =>
      'Der er ikke nok hår på billedet til at ændre.';

  @override
  String get errMouthNotVisible =>
      'Munden skal være synlig. Se ind i linsen, uden hånd foran ansigtet.';

  @override
  String get errNoBeardToShave => 'Der er intet skæg på billedet at barbere.';

  @override
  String get errEyesNotVisible =>
      'Øjnene skal være synlige. Se ind i linsen, uden hånd eller hår foran øjnene.';

  @override
  String get errMaskTooLarge =>
      'Ansigtet er for tæt på. Hold telefonen længere væk.';

  @override
  String get errNoGlassesToRemove => 'Der er ingen briller på billedet.';

  @override
  String get errNothingToChange => 'Der er intet at ændre på dette billede.';

  @override
  String get errBusy =>
      'En anden rendering kører. Indtil den er færdig kan du ikke starte en ny eller animere. Klippet “hår i vinden” kan tage omkring 20 minutter.';

  @override
  String get errOffline =>
      'Serveren kan ikke nås. Tjek din forbindelse og prøv igen.';

  @override
  String get errAccessDenied =>
      'Serveren nægtede adgang. Denne build har det forkerte token.';

  @override
  String get errNotFound =>
      'Serveren kender ikke længere denne rendering. Start den igen.';

  @override
  String get errPlanRejected =>
      'Serveren afviste planen. Dette billede kan ikke sendes.';

  @override
  String errServer(int status) {
    return 'Serveren fejlede ($status). Prøv igen om et øjeblik.';
  }

  @override
  String errGeneric(String error) {
    return 'Noget gik galt: $error';
  }

  @override
  String get photoUnreadable =>
      'Billedet kunne ikke læses. Brug JPEG eller PNG.';

  @override
  String get stageWaitingServer => 'Venter på serveren…';

  @override
  String get stageBeard => 'Retter skægget…';

  @override
  String get stageGlasses => 'Sætter brillerne på…';

  @override
  String get stageHair => 'Klipper håret…';

  @override
  String get stageQueue => 'Venter i køen…';

  @override
  String stagePainting(int current, int total) {
    return 'Maler $current/$total';
  }
}
