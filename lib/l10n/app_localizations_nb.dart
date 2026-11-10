// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Denne builden har ikke servertoken (make run, .env.local). Analysen fungerer, renderingen gjør ikke det.';

  @override
  String get homeEmpty => 'Ingenting her ennå. Begynn med en selfie.';

  @override
  String get homeNew => 'Ny fotoboks';

  @override
  String get delete => 'Slett';

  @override
  String get statusRunning => 'Pågår';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n bilder',
      one: '$n bilde',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Delvis mislykket';

  @override
  String get statusFailed => 'Mislyktes';

  @override
  String get statusRejected => 'Ikke startet';

  @override
  String get statusLost => 'Mistet på serveren';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Portrett av én person forfra, ansiktet godt synlig.';

  @override
  String get selfieAnalysing => 'Ser på bildet…';

  @override
  String get takePhoto => 'Ta et bilde';

  @override
  String get pickGallery => 'Velg fra galleriet';

  @override
  String get stepKeep => 'Behold';

  @override
  String get stepNext => 'Neste';

  @override
  String get hairTitle => 'Hår';

  @override
  String get beardTitle => 'Skjegg';

  @override
  String get glassesTitle => 'Briller';

  @override
  String get glassesFinish => 'Innfatning';

  @override
  String get hairWomen => 'Kvinner';

  @override
  String get hairMen => 'Menn';

  @override
  String get hairKeepCut => 'Behold frisyren, bytt bare farge';

  @override
  String get hairColour => 'Farge';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Farge (på bildet: $colour)';
  }

  @override
  String get hairNoChange => 'Ingen endring';

  @override
  String get stylesTitle => 'Stiler';

  @override
  String get frameCount => 'Hvor mange bilder';

  @override
  String get mixes => 'Ferdige miks';

  @override
  String pickedOf(int picked, int count) {
    return 'Valgt $picked av $count';
  }

  @override
  String get mediumIllustration => 'Maleri';

  @override
  String get mediumPhoto => 'Foto';

  @override
  String get searchStyle => 'Søk etter stil';

  @override
  String get pickSomething => 'Velg minst én endring eller stil.';

  @override
  String get startBooth => 'Start fotoboksen';

  @override
  String get mixGalerie => 'Galleri';

  @override
  String get mixKomiks => 'Pop og tegneserie';

  @override
  String get mixEpochy => 'Gjennom epokene';

  @override
  String get mixAsie => 'Asia';

  @override
  String get mixCesko => 'Tsjekkisk spor';

  @override
  String get boothTitle => 'Fotoboks';

  @override
  String get boothSomeFailed =>
      'Noen bilder mislyktes. Generasjonene for dem er refundert.';

  @override
  String get layoutGrid => 'Rutenett';

  @override
  String get layoutStrip => 'Stripe';

  @override
  String get saveToPhotos => 'Lagre i Bilder';

  @override
  String get share => 'Del';

  @override
  String get stripSaved => 'Stripen er i Bilder.';

  @override
  String get stripSaveFailed => 'Stripen kunne ikke lagres i Bilder.';

  @override
  String get nothingReady => 'Ingen bilder er klare ennå.';

  @override
  String get rerun => 'Kjør på nytt';

  @override
  String rerunCost(int cost) {
    return 'Kjør på nytt ($cost)';
  }

  @override
  String get clipDefaultName => 'Klipp';

  @override
  String get clipAnimating => 'Animerer…';

  @override
  String get clipDone => 'Ferdig';

  @override
  String get clipFailed => 'Det mislyktes. Generasjonene er refundert.';

  @override
  String get playClip => 'Spill av klipp';

  @override
  String get clipSaved => 'Klippet er i Bilder.';

  @override
  String get clipSaveFailed => 'Klippet kunne ikke lagres i Bilder.';

  @override
  String get clipCantPlay => 'Klippet kan ikke spilles av.';

  @override
  String get animate => 'Animer';

  @override
  String get motionFast => 'Raskt, på noen sekunder';

  @override
  String get motionSlow => 'Sakte, flere titalls minutter';

  @override
  String get tileNewLook => 'Nytt utseende';

  @override
  String get frameNotReady => 'Dette bildet er ikke klart ennå.';

  @override
  String get runNotStarted => 'Renderingen kunne ikke startes.';

  @override
  String get runFailedRefunded =>
      'Renderingen mislyktes. Generasjonene er refundert.';

  @override
  String get runLost =>
      'Serveren startet på nytt i mellomtiden og mistet renderingen.';

  @override
  String get errNoFace =>
      'Vi fant ikke noe ansikt. Bruk et portrett av én person forfra.';

  @override
  String get errFaceTooSmall =>
      'Ansiktet er for lite. Beskjær bildet nærmere hode og skuldre.';

  @override
  String get errMaskTooSmallHair =>
      'Det er ikke nok hår på bildet til å endre.';

  @override
  String get errMouthNotVisible =>
      'Munnen må være synlig. Se inn i linsen, uten hånd foran ansiktet.';

  @override
  String get errNoBeardToShave => 'Det er ikke noe skjegg på bildet å barbere.';

  @override
  String get errEyesNotVisible =>
      'Øynene må være synlige. Se inn i linsen, uten hånd eller hår foran øynene.';

  @override
  String get errMaskTooLarge =>
      'Ansiktet er for nært. Hold telefonen lenger unna.';

  @override
  String get errNoGlassesToRemove => 'Det er ingen briller på bildet.';

  @override
  String get errNothingToChange => 'Det er ingenting å endre på dette bildet.';

  @override
  String get errBusy =>
      'En annen rendering pågår. Til den er ferdig kan du ikke starte en ny eller animere. Klippet «hår i vinden» kan ta rundt 20 minutter.';

  @override
  String get errOffline =>
      'Serveren er ikke tilgjengelig. Sjekk tilkoblingen og prøv igjen.';

  @override
  String get errAccessDenied =>
      'Serveren nektet tilgang. Denne builden har feil token.';

  @override
  String get errNotFound =>
      'Serveren kjenner ikke lenger denne renderingen. Start den på nytt.';

  @override
  String get errPlanRejected =>
      'Serveren avviste planen. Dette bildet kan ikke sendes.';

  @override
  String errServer(int status) {
    return 'Serveren feilet ($status). Prøv igjen om litt.';
  }

  @override
  String errGeneric(String error) {
    return 'Noe gikk galt: $error';
  }

  @override
  String get photoUnreadable => 'Bildet kunne ikke leses. Bruk JPEG eller PNG.';

  @override
  String get stageWaitingServer => 'Venter på serveren…';

  @override
  String get stageBeard => 'Justerer skjegget…';

  @override
  String get stageGlasses => 'Setter på brillene…';

  @override
  String get stageHair => 'Klipper håret…';

  @override
  String get stageQueue => 'Venter i køen…';

  @override
  String stagePainting(int current, int total) {
    return 'Maler $current/$total';
  }
}
