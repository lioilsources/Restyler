// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Αυτή η έκδοση δεν έχει διακριτικό διακομιστή (make run, .env.local). Η ανάλυση λειτουργεί, η απόδοση όχι.';

  @override
  String get homeEmpty => 'Δεν υπάρχει τίποτα εδώ ακόμη. Ξεκίνα με μια selfie.';

  @override
  String get homeNew => 'Νέος φωτογραφικός θάλαμος';

  @override
  String get delete => 'Διαγραφή';

  @override
  String get statusRunning => 'Σε εξέλιξη';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n καρέ',
      one: '$n καρέ',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Μέρος απέτυχε';

  @override
  String get statusFailed => 'Απέτυχε';

  @override
  String get statusRejected => 'Δεν ξεκίνησε';

  @override
  String get statusLost => 'Χάθηκε στον διακομιστή';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Πορτρέτο ενός ατόμου από μπροστά, με το πρόσωπο καθαρά ορατό.';

  @override
  String get selfieAnalysing => 'Κοιτάζω τη φωτογραφία…';

  @override
  String get takePhoto => 'Βγάλε φωτογραφία';

  @override
  String get pickGallery => 'Επιλογή από τη συλλογή';

  @override
  String get stepKeep => 'Άφησέ το';

  @override
  String get stepNext => 'Επόμενο';

  @override
  String get hairTitle => 'Μαλλιά';

  @override
  String get beardTitle => 'Γένια';

  @override
  String get glassesTitle => 'Γυαλιά';

  @override
  String get glassesFinish => 'Σκελετός';

  @override
  String get hairWomen => 'Γυναίκες';

  @override
  String get hairMen => 'Άνδρες';

  @override
  String get hairKeepCut => 'Κράτα το κούρεμα, άλλαξε μόνο το χρώμα';

  @override
  String get hairColour => 'Χρώμα';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Χρώμα (στη φωτογραφία: $colour)';
  }

  @override
  String get hairNoChange => 'Χωρίς αλλαγή';

  @override
  String get stylesTitle => 'Στιλ';

  @override
  String get frameCount => 'Πόσα καρέ';

  @override
  String get mixes => 'Έτοιμα μιξ';

  @override
  String pickedOf(int picked, int count) {
    return 'Επιλέχθηκαν $picked από $count';
  }

  @override
  String get mediumIllustration => 'Ζωγραφιά';

  @override
  String get mediumPhoto => 'Φωτογραφία';

  @override
  String get searchStyle => 'Αναζήτηση στιλ';

  @override
  String get pickSomething => 'Διάλεξε τουλάχιστον μία αλλαγή ή ένα στιλ.';

  @override
  String get startBooth => 'Εκκίνηση του φωτογραφικού θαλάμου';

  @override
  String get mixGalerie => 'Γκαλερί';

  @override
  String get mixKomiks => 'Ποπ και κόμικς';

  @override
  String get mixEpochy => 'Μέσα από τις εποχές';

  @override
  String get mixAsie => 'Ασία';

  @override
  String get mixCesko => 'Τσεχικό αποτύπωμα';

  @override
  String get boothTitle => 'Φωτογραφικός θάλαμος';

  @override
  String get boothSomeFailed =>
      'Μερικά καρέ απέτυχαν. Οι παραγωγές τους επιστράφηκαν.';

  @override
  String get layoutGrid => 'Πλέγμα';

  @override
  String get layoutStrip => 'Λωρίδα';

  @override
  String get saveToPhotos => 'Αποθήκευση στις Φωτογραφίες';

  @override
  String get share => 'Κοινοποίηση';

  @override
  String get stripSaved => 'Η λωρίδα είναι στις Φωτογραφίες.';

  @override
  String get stripSaveFailed => 'Η λωρίδα δεν αποθηκεύτηκε στις Φωτογραφίες.';

  @override
  String get nothingReady => 'Κανένα καρέ δεν είναι έτοιμο ακόμη.';

  @override
  String get rerun => 'Εκτέλεση ξανά';

  @override
  String rerunCost(int cost) {
    return 'Εκτέλεση ξανά ($cost)';
  }

  @override
  String get clipDefaultName => 'Κλιπ';

  @override
  String get clipAnimating => 'Δημιουργία κίνησης…';

  @override
  String get clipDone => 'Έτοιμο';

  @override
  String get clipFailed => 'Απέτυχε. Οι παραγωγές επιστράφηκαν.';

  @override
  String get playClip => 'Αναπαραγωγή κλιπ';

  @override
  String get clipSaved => 'Το κλιπ είναι στις Φωτογραφίες.';

  @override
  String get clipSaveFailed => 'Το κλιπ δεν αποθηκεύτηκε στις Φωτογραφίες.';

  @override
  String get clipCantPlay => 'Το κλιπ δεν μπορεί να αναπαραχθεί.';

  @override
  String get animate => 'Κίνηση';

  @override
  String get motionFast => 'Γρήγορα, σε δευτερόλεπτα';

  @override
  String get motionSlow => 'Αργά, δεκάδες λεπτά';

  @override
  String get tileNewLook => 'Νέα εμφάνιση';

  @override
  String get frameNotReady => 'Αυτό το καρέ δεν είναι έτοιμο ακόμη.';

  @override
  String get runNotStarted => 'Η απόδοση δεν μπόρεσε να ξεκινήσει.';

  @override
  String get runFailedRefunded =>
      'Η απόδοση απέτυχε. Οι παραγωγές επιστράφηκαν.';

  @override
  String get runLost =>
      'Ο διακομιστής επανεκκινήθηκε στο μεταξύ και έχασε την απόδοση.';

  @override
  String get errNoFace =>
      'Δεν βρήκαμε πρόσωπο. Χρησιμοποίησε πορτρέτο ενός ατόμου από μπροστά.';

  @override
  String get errFaceTooSmall =>
      'Το πρόσωπο είναι πολύ μικρό. Κόψε τη φωτογραφία πιο κοντά στο κεφάλι και τους ώμους.';

  @override
  String get errMaskTooSmallHair =>
      'Δεν υπάρχουν αρκετά μαλλιά στη φωτογραφία για να αλλάξουν.';

  @override
  String get errMouthNotVisible =>
      'Το στόμα πρέπει να φαίνεται. Κοίτα τον φακό, χωρίς χέρι μπροστά στο πρόσωπο.';

  @override
  String get errNoBeardToShave =>
      'Δεν υπάρχουν γένια στη φωτογραφία για ξύρισμα.';

  @override
  String get errEyesNotVisible =>
      'Τα μάτια πρέπει να φαίνονται. Κοίτα τον φακό, χωρίς χέρι ή μαλλιά πάνω από τα μάτια.';

  @override
  String get errMaskTooLarge =>
      'Το πρόσωπο είναι πολύ κοντά. Κράτα το τηλέφωνο πιο μακριά.';

  @override
  String get errNoGlassesToRemove => 'Δεν υπάρχουν γυαλιά στη φωτογραφία.';

  @override
  String get errNothingToChange =>
      'Δεν υπάρχει τίποτα να αλλάξει σε αυτή τη φωτογραφία.';

  @override
  String get errBusy =>
      'Τρέχει άλλη απόδοση. Μέχρι να τελειώσει δεν μπορείς να ξεκινήσεις νέα ούτε να δώσεις κίνηση. Το κλιπ «μαλλιά στον άνεμο» μπορεί να κρατήσει περίπου 20 λεπτά.';

  @override
  String get errOffline =>
      'Ο διακομιστής δεν είναι προσβάσιμος. Έλεγξε τη σύνδεσή σου και δοκίμασε ξανά.';

  @override
  String get errAccessDenied =>
      'Ο διακομιστής απέρριψε την πρόσβαση. Αυτή η έκδοση έχει λάθος διακριτικό.';

  @override
  String get errNotFound =>
      'Ο διακομιστής δεν γνωρίζει πια αυτή την απόδοση. Ξεκίνησέ την ξανά.';

  @override
  String get errPlanRejected =>
      'Ο διακομιστής απέρριψε το πλάνο. Αυτή η φωτογραφία δεν μπορεί να σταλεί.';

  @override
  String errServer(int status) {
    return 'Ο διακομιστής απέτυχε ($status). Δοκίμασε ξανά σε λίγο.';
  }

  @override
  String errGeneric(String error) {
    return 'Κάτι πήγε στραβά: $error';
  }

  @override
  String get photoUnreadable =>
      'Η φωτογραφία δεν μπόρεσε να διαβαστεί. Χρησιμοποίησε JPEG ή PNG.';

  @override
  String get stageWaitingServer => 'Αναμονή για τον διακομιστή…';

  @override
  String get stageBeard => 'Επεξεργασία των γενιών…';

  @override
  String get stageGlasses => 'Φοράω τα γυαλιά…';

  @override
  String get stageHair => 'Κόβω τα μαλλιά…';

  @override
  String get stageQueue => 'Αναμονή στην ουρά…';

  @override
  String stagePainting(int current, int total) {
    return 'Ζωγραφίζω $current/$total';
  }
}
