// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'This build has no server token (make run, .env.local). Analysis works, rendering does not.';

  @override
  String get homeEmpty => 'Nothing here yet. Start with a selfie.';

  @override
  String get homeNew => 'New photo booth';

  @override
  String get delete => 'Delete';

  @override
  String get statusRunning => 'In progress';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n frames',
      one: '$n frame',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Partly failed';

  @override
  String get statusFailed => 'Failed';

  @override
  String get statusRejected => 'Not started';

  @override
  String get statusLost => 'Lost on the server';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'A front-facing portrait of one person, face clearly visible.';

  @override
  String get selfieAnalysing => 'Looking at the photo…';

  @override
  String get takePhoto => 'Take a photo';

  @override
  String get pickGallery => 'Choose from gallery';

  @override
  String get stepKeep => 'Keep';

  @override
  String get stepNext => 'Next';

  @override
  String get hairTitle => 'Hair';

  @override
  String get beardTitle => 'Beard';

  @override
  String get glassesTitle => 'Glasses';

  @override
  String get glassesFinish => 'Finish';

  @override
  String get hairWomen => 'Women';

  @override
  String get hairMen => 'Men';

  @override
  String get hairKeepCut => 'Keep the cut, change only the colour';

  @override
  String get hairColour => 'Colour';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Colour (in the photo: $colour)';
  }

  @override
  String get hairNoChange => 'No change';

  @override
  String get stylesTitle => 'Styles';

  @override
  String get frameCount => 'How many frames';

  @override
  String get mixes => 'Ready-made mixes';

  @override
  String pickedOf(int picked, int count) {
    return 'Selected $picked of $count';
  }

  @override
  String get mediumIllustration => 'Painting';

  @override
  String get mediumPhoto => 'Photo';

  @override
  String get searchStyle => 'Search styles';

  @override
  String get pickSomething => 'Pick at least one edit or style.';

  @override
  String get startBooth => 'Start the photo booth';

  @override
  String get mixGalerie => 'Gallery';

  @override
  String get mixKomiks => 'Pop and comics';

  @override
  String get mixEpochy => 'Through the eras';

  @override
  String get mixAsie => 'Asia';

  @override
  String get mixCesko => 'Czech trail';

  @override
  String get boothTitle => 'Photo booth';

  @override
  String get boothSomeFailed =>
      'Some frames failed. The generations for them have been refunded.';

  @override
  String get layoutGrid => 'Grid';

  @override
  String get layoutStrip => 'Strip';

  @override
  String get saveToPhotos => 'Save to Photos';

  @override
  String get share => 'Share';

  @override
  String get stripSaved => 'The strip is in Photos.';

  @override
  String get stripSaveFailed => 'Could not save the strip to Photos.';

  @override
  String get nothingReady => 'No frame is ready yet.';

  @override
  String get rerun => 'Run again';

  @override
  String rerunCost(int cost) {
    return 'Run again ($cost)';
  }

  @override
  String get clipDefaultName => 'Clip';

  @override
  String get clipAnimating => 'Animating…';

  @override
  String get clipDone => 'Done';

  @override
  String get clipFailed => 'It failed. The generations have been refunded.';

  @override
  String get playClip => 'Play clip';

  @override
  String get clipSaved => 'The clip is in Photos.';

  @override
  String get clipSaveFailed => 'Could not save the clip to Photos.';

  @override
  String get clipCantPlay => 'The clip cannot be played.';

  @override
  String get animate => 'Animate';

  @override
  String get motionFast => 'Fast, within seconds';

  @override
  String get motionSlow => 'Slow, tens of minutes';

  @override
  String get tileNewLook => 'New look';

  @override
  String get frameNotReady => 'This frame is not ready yet.';

  @override
  String get runNotStarted => 'The render could not be started.';

  @override
  String get runFailedRefunded =>
      'The render failed. The generations have been refunded.';

  @override
  String get runLost =>
      'The server restarted in the meantime and lost the render.';

  @override
  String get errNoFace =>
      'We could not find a face. Use a front-facing portrait of one person.';

  @override
  String get errFaceTooSmall =>
      'The face is too small. Crop the photo closer to the head and shoulders.';

  @override
  String get errMaskTooSmallHair =>
      'There is not enough hair in the photo to restyle.';

  @override
  String get errMouthNotVisible =>
      'The mouth must be visible. Look into the lens, with no hand in front of your face.';

  @override
  String get errNoBeardToShave => 'There is no beard in the photo to shave.';

  @override
  String get errEyesNotVisible =>
      'The eyes must be visible. Look into the lens, with no hand or hair over your eyes.';

  @override
  String get errMaskTooLarge =>
      'The face is too close. Hold the phone farther away.';

  @override
  String get errNoGlassesToRemove => 'There are no glasses in the photo.';

  @override
  String get errNothingToChange => 'There is nothing to change in this photo.';

  @override
  String get errBusy =>
      'Another render is running. Until it finishes you cannot start a new one or animate. The “hair in the wind” clip can take around 20 minutes.';

  @override
  String get errOffline =>
      'The server is not reachable. Check your connection and try again.';

  @override
  String get errAccessDenied =>
      'The server refused access. This build has the wrong token.';

  @override
  String get errNotFound =>
      'The server no longer knows this render. Start it again.';

  @override
  String get errPlanRejected =>
      'The server rejected the plan. This photo cannot be sent.';

  @override
  String errServer(int status) {
    return 'The server failed ($status). Try again in a moment.';
  }

  @override
  String errGeneric(String error) {
    return 'Something went wrong: $error';
  }

  @override
  String get photoUnreadable =>
      'The photo could not be read. Use a JPEG or PNG.';

  @override
  String get stageWaitingServer => 'Waiting for the server…';

  @override
  String get stageBeard => 'Editing the beard…';

  @override
  String get stageGlasses => 'Putting on the glasses…';

  @override
  String get stageHair => 'Cutting hair…';

  @override
  String get stageQueue => 'Waiting in the queue…';

  @override
  String stagePainting(int current, int total) {
    return 'Painting $current/$total';
  }
}
