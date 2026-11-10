// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Cette version n’a pas de jeton de serveur (make run, .env.local). L’analyse fonctionne, pas le rendu.';

  @override
  String get homeEmpty => 'Rien ici pour l’instant. Commence par un selfie.';

  @override
  String get homeNew => 'Nouvelle cabine photo';

  @override
  String get delete => 'Supprimer';

  @override
  String get statusRunning => 'En cours';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n images',
      one: '$n image',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Échec partiel';

  @override
  String get statusFailed => 'Échec';

  @override
  String get statusRejected => 'Non lancé';

  @override
  String get statusLost => 'Perdu sur le serveur';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Portrait de face d’une seule personne, visage bien visible.';

  @override
  String get selfieAnalysing => 'J’examine la photo…';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get pickGallery => 'Choisir dans la galerie';

  @override
  String get stepKeep => 'Garder';

  @override
  String get stepNext => 'Suivant';

  @override
  String get hairTitle => 'Cheveux';

  @override
  String get beardTitle => 'Barbe';

  @override
  String get glassesTitle => 'Lunettes';

  @override
  String get glassesFinish => 'Monture';

  @override
  String get hairWomen => 'Femmes';

  @override
  String get hairMen => 'Hommes';

  @override
  String get hairKeepCut => 'Garder la coupe, changer seulement la couleur';

  @override
  String get hairColour => 'Couleur';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Couleur (sur la photo : $colour)';
  }

  @override
  String get hairNoChange => 'Aucun changement';

  @override
  String get stylesTitle => 'Styles';

  @override
  String get frameCount => 'Combien d’images';

  @override
  String get mixes => 'Mix prêts à l’emploi';

  @override
  String pickedOf(int picked, int count) {
    return '$picked sélectionnés sur $count';
  }

  @override
  String get mediumIllustration => 'Peinture';

  @override
  String get mediumPhoto => 'Photo';

  @override
  String get searchStyle => 'Chercher un style';

  @override
  String get pickSomething => 'Choisis au moins une modification ou un style.';

  @override
  String get startBooth => 'Lancer la cabine photo';

  @override
  String get mixGalerie => 'Galerie';

  @override
  String get mixKomiks => 'Pop et BD';

  @override
  String get mixEpochy => 'À travers les époques';

  @override
  String get mixAsie => 'Asie';

  @override
  String get mixCesko => 'Piste tchèque';

  @override
  String get boothTitle => 'Cabine photo';

  @override
  String get boothSomeFailed =>
      'Certaines images ont échoué. Les générations correspondantes ont été remboursées.';

  @override
  String get layoutGrid => 'Grille';

  @override
  String get layoutStrip => 'Bande';

  @override
  String get saveToPhotos => 'Enregistrer dans Photos';

  @override
  String get share => 'Partager';

  @override
  String get stripSaved => 'La bande est dans Photos.';

  @override
  String get stripSaveFailed =>
      'Impossible d’enregistrer la bande dans Photos.';

  @override
  String get nothingReady => 'Aucune image n’est encore prête.';

  @override
  String get rerun => 'Relancer';

  @override
  String rerunCost(int cost) {
    return 'Relancer ($cost)';
  }

  @override
  String get clipDefaultName => 'Clip';

  @override
  String get clipAnimating => 'Animation en cours…';

  @override
  String get clipDone => 'Terminé';

  @override
  String get clipFailed => 'Échec. Les générations ont été remboursées.';

  @override
  String get playClip => 'Lire le clip';

  @override
  String get clipSaved => 'Le clip est dans Photos.';

  @override
  String get clipSaveFailed => 'Impossible d’enregistrer le clip dans Photos.';

  @override
  String get clipCantPlay => 'Le clip ne peut pas être lu.';

  @override
  String get animate => 'Animer';

  @override
  String get motionFast => 'Rapide, en quelques secondes';

  @override
  String get motionSlow => 'Lent, des dizaines de minutes';

  @override
  String get tileNewLook => 'Nouveau look';

  @override
  String get frameNotReady => 'Cette image n’est pas encore prête.';

  @override
  String get runNotStarted => 'Impossible de lancer le rendu.';

  @override
  String get runFailedRefunded =>
      'Le rendu a échoué. Les générations ont été remboursées.';

  @override
  String get runLost =>
      'Le serveur a redémarré entre-temps et a perdu le rendu.';

  @override
  String get errNoFace =>
      'Nous n’avons pas trouvé de visage. Utilise un portrait de face d’une seule personne.';

  @override
  String get errFaceTooSmall =>
      'Le visage est trop petit. Recadre la photo plus près de la tête et des épaules.';

  @override
  String get errMaskTooSmallHair =>
      'Il n’y a pas assez de cheveux sur la photo pour les restyler.';

  @override
  String get errMouthNotVisible =>
      'La bouche doit être visible. Regarde l’objectif, sans main devant le visage.';

  @override
  String get errNoBeardToShave => 'Il n’y a pas de barbe à raser sur la photo.';

  @override
  String get errEyesNotVisible =>
      'Les yeux doivent être visibles. Regarde l’objectif, sans main ni cheveux devant les yeux.';

  @override
  String get errMaskTooLarge =>
      'Le visage est trop proche. Tiens le téléphone plus loin.';

  @override
  String get errNoGlassesToRemove => 'Il n’y a pas de lunettes sur la photo.';

  @override
  String get errNothingToChange => 'Il n’y a rien à modifier sur cette photo.';

  @override
  String get errBusy =>
      'Un autre rendu est en cours. Tant qu’il n’est pas terminé, tu ne peux pas en lancer un nouveau ni animer. Le clip « cheveux au vent » peut durer environ 20 minutes.';

  @override
  String get errOffline =>
      'Le serveur est injoignable. Vérifie ta connexion et réessaie.';

  @override
  String get errAccessDenied =>
      'Le serveur a refusé l’accès. Cette version a un mauvais jeton.';

  @override
  String get errNotFound => 'Le serveur ne connaît plus ce rendu. Relance-le.';

  @override
  String get errPlanRejected =>
      'Le serveur a refusé le plan. Cette photo ne peut pas être envoyée.';

  @override
  String errServer(int status) {
    return 'Le serveur a échoué ($status). Réessaie dans un instant.';
  }

  @override
  String errGeneric(String error) {
    return 'Un problème est survenu : $error';
  }

  @override
  String get photoUnreadable =>
      'Impossible de lire la photo. Utilise un fichier JPEG ou PNG.';

  @override
  String get stageWaitingServer => 'En attente du serveur…';

  @override
  String get stageBeard => 'Modification de la barbe…';

  @override
  String get stageGlasses => 'Pose des lunettes…';

  @override
  String get stageHair => 'Coupe des cheveux…';

  @override
  String get stageQueue => 'En file d’attente…';

  @override
  String stagePainting(int current, int total) {
    return 'Peinture $current/$total';
  }
}
