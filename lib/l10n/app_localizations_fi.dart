// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Restyler';

  @override
  String get homeNoToken =>
      'Tässä versiossa ei ole palvelimen tunnusta (make run, .env.local). Analyysi toimii, renderöinti ei.';

  @override
  String get homeEmpty => 'Täällä ei ole vielä mitään. Aloita selfiellä.';

  @override
  String get homeNew => 'Uusi kuvakoppi';

  @override
  String get delete => 'Poista';

  @override
  String get statusRunning => 'Käynnissä';

  @override
  String statusDone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kuvaa',
      one: '$n kuva',
    );
    return '$_temp0';
  }

  @override
  String get statusPartial => 'Osittain epäonnistui';

  @override
  String get statusFailed => 'Epäonnistui';

  @override
  String get statusRejected => 'Ei käynnistetty';

  @override
  String get statusLost => 'Hävisi palvelimelta';

  @override
  String get selfieTitle => 'Selfie';

  @override
  String get selfieHint =>
      'Yhden ihmisen kasvokuva edestä, kasvot selvästi näkyvissä.';

  @override
  String get selfieAnalysing => 'Katson kuvaa…';

  @override
  String get takePhoto => 'Ota kuva';

  @override
  String get pickGallery => 'Valitse galleriasta';

  @override
  String get stepKeep => 'Säilytä';

  @override
  String get stepNext => 'Seuraava';

  @override
  String get hairTitle => 'Hiukset';

  @override
  String get beardTitle => 'Parta';

  @override
  String get glassesTitle => 'Silmälasit';

  @override
  String get glassesFinish => 'Kehykset';

  @override
  String get hairWomen => 'Naiset';

  @override
  String get hairMen => 'Miehet';

  @override
  String get hairKeepCut => 'Säilytä kampaus, vaihda vain väri';

  @override
  String get hairColour => 'Väri';

  @override
  String hairColourOnPhoto(String colour) {
    return 'Väri (kuvassa: $colour)';
  }

  @override
  String get hairNoChange => 'Ei muutosta';

  @override
  String get stylesTitle => 'Tyylit';

  @override
  String get frameCount => 'Kuinka monta kuvaa';

  @override
  String get mixes => 'Valmiit miksit';

  @override
  String pickedOf(int picked, int count) {
    return 'Valittu $picked / $count';
  }

  @override
  String get mediumIllustration => 'Maalaus';

  @override
  String get mediumPhoto => 'Valokuva';

  @override
  String get searchStyle => 'Hae tyyliä';

  @override
  String get pickSomething => 'Valitse vähintään yksi muutos tai tyyli.';

  @override
  String get startBooth => 'Käynnistä kuvakoppi';

  @override
  String get mixGalerie => 'Galleria';

  @override
  String get mixKomiks => 'Pop ja sarjakuva';

  @override
  String get mixEpochy => 'Halki aikakausien';

  @override
  String get mixAsie => 'Aasia';

  @override
  String get mixCesko => 'Tšekkiläinen jälki';

  @override
  String get boothTitle => 'Kuvakoppi';

  @override
  String get boothSomeFailed =>
      'Osa kuvista epäonnistui. Niiden generoinnit on palautettu.';

  @override
  String get layoutGrid => 'Ruudukko';

  @override
  String get layoutStrip => 'Nauha';

  @override
  String get saveToPhotos => 'Tallenna Kuviin';

  @override
  String get share => 'Jaa';

  @override
  String get stripSaved => 'Nauha on Kuvissa.';

  @override
  String get stripSaveFailed => 'Nauhaa ei voitu tallentaa Kuviin.';

  @override
  String get nothingReady => 'Yksikään kuva ei ole vielä valmis.';

  @override
  String get rerun => 'Aja uudelleen';

  @override
  String rerunCost(int cost) {
    return 'Aja uudelleen ($cost)';
  }

  @override
  String get clipDefaultName => 'Klippi';

  @override
  String get clipAnimating => 'Animoidaan…';

  @override
  String get clipDone => 'Valmis';

  @override
  String get clipFailed => 'Epäonnistui. Generoinnit on palautettu.';

  @override
  String get playClip => 'Toista klippi';

  @override
  String get clipSaved => 'Klippi on Kuvissa.';

  @override
  String get clipSaveFailed => 'Klippiä ei voitu tallentaa Kuviin.';

  @override
  String get clipCantPlay => 'Klippiä ei voi toistaa.';

  @override
  String get animate => 'Animoi';

  @override
  String get motionFast => 'Nopea, sekunneissa';

  @override
  String get motionSlow => 'Hidas, kymmeniä minuutteja';

  @override
  String get tileNewLook => 'Uusi ilme';

  @override
  String get frameNotReady => 'Tämä kuva ei ole vielä valmis.';

  @override
  String get runNotStarted => 'Renderöintiä ei voitu käynnistää.';

  @override
  String get runFailedRefunded =>
      'Renderöinti epäonnistui. Generoinnit on palautettu.';

  @override
  String get runLost =>
      'Palvelin käynnistyi välissä uudelleen ja menetti renderöinnin.';

  @override
  String get errNoFace =>
      'Kasvoja ei löytynyt. Käytä yhden ihmisen kasvokuvaa edestä.';

  @override
  String get errFaceTooSmall =>
      'Kasvot ovat liian pienet. Rajaa kuva lähemmäs päätä ja hartioita.';

  @override
  String get errMaskTooSmallHair =>
      'Kuvassa ei ole tarpeeksi hiuksia muutettavaksi.';

  @override
  String get errMouthNotVisible =>
      'Suun täytyy näkyä. Katso linssiin ilman kättä kasvojen edessä.';

  @override
  String get errNoBeardToShave => 'Kuvassa ei ole partaa ajettavaksi.';

  @override
  String get errEyesNotVisible =>
      'Silmien täytyy näkyä. Katso linssiin ilman kättä tai hiuksia silmien edessä.';

  @override
  String get errMaskTooLarge =>
      'Kasvot ovat liian lähellä. Pidä puhelinta kauempana.';

  @override
  String get errNoGlassesToRemove => 'Kuvassa ei ole silmälaseja.';

  @override
  String get errNothingToChange => 'Tässä kuvassa ei ole mitään muutettavaa.';

  @override
  String get errBusy =>
      'Toinen renderöinti on käynnissä. Ennen kuin se valmistuu, et voi aloittaa uutta etkä animoida. Klippi “hiukset tuulessa” voi kestää noin 20 minuuttia.';

  @override
  String get errOffline =>
      'Palvelinta ei tavoiteta. Tarkista yhteys ja yritä uudelleen.';

  @override
  String get errAccessDenied =>
      'Palvelin kielsi pääsyn. Tässä versiossa on väärä tunnus.';

  @override
  String get errNotFound =>
      'Palvelin ei enää tunne tätä renderöintiä. Käynnistä se uudelleen.';

  @override
  String get errPlanRejected =>
      'Palvelin hylkäsi suunnitelman. Tätä kuvaa ei voi lähettää.';

  @override
  String errServer(int status) {
    return 'Palvelin kaatui ($status). Yritä hetken päästä uudelleen.';
  }

  @override
  String errGeneric(String error) {
    return 'Jokin meni pieleen: $error';
  }

  @override
  String get photoUnreadable =>
      'Kuvaa ei voitu lukea. Käytä JPEG- tai PNG-kuvaa.';

  @override
  String get stageWaitingServer => 'Odotetaan palvelinta…';

  @override
  String get stageBeard => 'Muokataan partaa…';

  @override
  String get stageGlasses => 'Puetaan silmälasit…';

  @override
  String get stageHair => 'Leikataan hiuksia…';

  @override
  String get stageQueue => 'Odotetaan jonossa…';

  @override
  String stagePainting(int current, int total) {
    return 'Maalataan $current/$total';
  }
}
