import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('kn'),
    Locale('ko'),
    Locale('ml'),
    Locale('mr'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('or'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sv'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In cs, this message translates to:
  /// **'Restyler'**
  String get appTitle;

  /// No description provided for @homeNoToken.
  ///
  /// In cs, this message translates to:
  /// **'Tenhle build nemá token serveru (make run, .env.local). Analýza funguje, render ne.'**
  String get homeNoToken;

  /// No description provided for @homeEmpty.
  ///
  /// In cs, this message translates to:
  /// **'Zatím tu nic není. Začni selfie.'**
  String get homeEmpty;

  /// No description provided for @homeNew.
  ///
  /// In cs, this message translates to:
  /// **'Nová fotobuňka'**
  String get homeNew;

  /// No description provided for @delete.
  ///
  /// In cs, this message translates to:
  /// **'Smazat'**
  String get delete;

  /// No description provided for @statusRunning.
  ///
  /// In cs, this message translates to:
  /// **'Probíhá'**
  String get statusRunning;

  /// No description provided for @statusDone.
  ///
  /// In cs, this message translates to:
  /// **'{n, plural, one{{n} rámeček} few{{n} rámečky} other{{n} rámečků}}'**
  String statusDone(int n);

  /// No description provided for @statusPartial.
  ///
  /// In cs, this message translates to:
  /// **'Část se nepovedla'**
  String get statusPartial;

  /// No description provided for @statusFailed.
  ///
  /// In cs, this message translates to:
  /// **'Nepovedlo se'**
  String get statusFailed;

  /// No description provided for @statusRejected.
  ///
  /// In cs, this message translates to:
  /// **'Nespuštěno'**
  String get statusRejected;

  /// No description provided for @statusLost.
  ///
  /// In cs, this message translates to:
  /// **'Ztraceno na serveru'**
  String get statusLost;

  /// No description provided for @selfieTitle.
  ///
  /// In cs, this message translates to:
  /// **'Selfie'**
  String get selfieTitle;

  /// No description provided for @selfieHint.
  ///
  /// In cs, this message translates to:
  /// **'Čelní portrét jednoho člověka, obličej dobře vidět.'**
  String get selfieHint;

  /// No description provided for @selfieAnalysing.
  ///
  /// In cs, this message translates to:
  /// **'Prohlížím fotku…'**
  String get selfieAnalysing;

  /// No description provided for @takePhoto.
  ///
  /// In cs, this message translates to:
  /// **'Vyfotit se'**
  String get takePhoto;

  /// No description provided for @pickGallery.
  ///
  /// In cs, this message translates to:
  /// **'Vybrat z galerie'**
  String get pickGallery;

  /// No description provided for @stepKeep.
  ///
  /// In cs, this message translates to:
  /// **'Nechat'**
  String get stepKeep;

  /// No description provided for @stepNext.
  ///
  /// In cs, this message translates to:
  /// **'Další'**
  String get stepNext;

  /// No description provided for @hairTitle.
  ///
  /// In cs, this message translates to:
  /// **'Vlasy'**
  String get hairTitle;

  /// No description provided for @beardTitle.
  ///
  /// In cs, this message translates to:
  /// **'Vousy'**
  String get beardTitle;

  /// No description provided for @glassesTitle.
  ///
  /// In cs, this message translates to:
  /// **'Brýle'**
  String get glassesTitle;

  /// No description provided for @glassesFinish.
  ///
  /// In cs, this message translates to:
  /// **'Provedení'**
  String get glassesFinish;

  /// No description provided for @hairWomen.
  ///
  /// In cs, this message translates to:
  /// **'Ženy'**
  String get hairWomen;

  /// No description provided for @hairMen.
  ///
  /// In cs, this message translates to:
  /// **'Muži'**
  String get hairMen;

  /// No description provided for @hairKeepCut.
  ///
  /// In cs, this message translates to:
  /// **'Nechat účes, změnit jen barvu'**
  String get hairKeepCut;

  /// No description provided for @hairColour.
  ///
  /// In cs, this message translates to:
  /// **'Barva'**
  String get hairColour;

  /// No description provided for @hairColourOnPhoto.
  ///
  /// In cs, this message translates to:
  /// **'Barva (na fotce {colour})'**
  String hairColourOnPhoto(String colour);

  /// No description provided for @hairNoChange.
  ///
  /// In cs, this message translates to:
  /// **'Beze změny'**
  String get hairNoChange;

  /// No description provided for @stylesTitle.
  ///
  /// In cs, this message translates to:
  /// **'Styly'**
  String get stylesTitle;

  /// No description provided for @frameCount.
  ///
  /// In cs, this message translates to:
  /// **'Kolik rámečků'**
  String get frameCount;

  /// No description provided for @mixes.
  ///
  /// In cs, this message translates to:
  /// **'Hotové mixy'**
  String get mixes;

  /// No description provided for @pickedOf.
  ///
  /// In cs, this message translates to:
  /// **'Vybráno {picked} z {count}'**
  String pickedOf(int picked, int count);

  /// No description provided for @mediumIllustration.
  ///
  /// In cs, this message translates to:
  /// **'Malba'**
  String get mediumIllustration;

  /// No description provided for @mediumPhoto.
  ///
  /// In cs, this message translates to:
  /// **'Fotka'**
  String get mediumPhoto;

  /// No description provided for @searchStyle.
  ///
  /// In cs, this message translates to:
  /// **'Hledat styl'**
  String get searchStyle;

  /// No description provided for @pickSomething.
  ///
  /// In cs, this message translates to:
  /// **'Vyber aspoň jednu úpravu nebo styl.'**
  String get pickSomething;

  /// No description provided for @startBooth.
  ///
  /// In cs, this message translates to:
  /// **'Spustit fotobuňku'**
  String get startBooth;

  /// No description provided for @mixGalerie.
  ///
  /// In cs, this message translates to:
  /// **'Galerie'**
  String get mixGalerie;

  /// No description provided for @mixKomiks.
  ///
  /// In cs, this message translates to:
  /// **'Pop a komiks'**
  String get mixKomiks;

  /// No description provided for @mixEpochy.
  ///
  /// In cs, this message translates to:
  /// **'Cesta epochami'**
  String get mixEpochy;

  /// No description provided for @mixAsie.
  ///
  /// In cs, this message translates to:
  /// **'Asie'**
  String get mixAsie;

  /// No description provided for @mixCesko.
  ///
  /// In cs, this message translates to:
  /// **'Česká stopa'**
  String get mixCesko;

  /// No description provided for @boothTitle.
  ///
  /// In cs, this message translates to:
  /// **'Fotobuňka'**
  String get boothTitle;

  /// No description provided for @boothSomeFailed.
  ///
  /// In cs, this message translates to:
  /// **'Některé rámečky se nepovedly. Generace za ně jsou vrácené.'**
  String get boothSomeFailed;

  /// No description provided for @layoutGrid.
  ///
  /// In cs, this message translates to:
  /// **'Mřížka'**
  String get layoutGrid;

  /// No description provided for @layoutStrip.
  ///
  /// In cs, this message translates to:
  /// **'Pás'**
  String get layoutStrip;

  /// No description provided for @saveToPhotos.
  ///
  /// In cs, this message translates to:
  /// **'Uložit do Fotek'**
  String get saveToPhotos;

  /// No description provided for @share.
  ///
  /// In cs, this message translates to:
  /// **'Sdílet'**
  String get share;

  /// No description provided for @stripSaved.
  ///
  /// In cs, this message translates to:
  /// **'Pás je ve Fotkách.'**
  String get stripSaved;

  /// No description provided for @stripSaveFailed.
  ///
  /// In cs, this message translates to:
  /// **'Pás se nepodařilo uložit do Fotek.'**
  String get stripSaveFailed;

  /// No description provided for @nothingReady.
  ///
  /// In cs, this message translates to:
  /// **'Zatím není hotový žádný rámeček.'**
  String get nothingReady;

  /// No description provided for @rerun.
  ///
  /// In cs, this message translates to:
  /// **'Spustit znovu'**
  String get rerun;

  /// No description provided for @rerunCost.
  ///
  /// In cs, this message translates to:
  /// **'Spustit znovu ({cost})'**
  String rerunCost(int cost);

  /// No description provided for @clipDefaultName.
  ///
  /// In cs, this message translates to:
  /// **'Klip'**
  String get clipDefaultName;

  /// No description provided for @clipAnimating.
  ///
  /// In cs, this message translates to:
  /// **'Oživuji…'**
  String get clipAnimating;

  /// No description provided for @clipDone.
  ///
  /// In cs, this message translates to:
  /// **'Hotovo'**
  String get clipDone;

  /// No description provided for @clipFailed.
  ///
  /// In cs, this message translates to:
  /// **'Nepovedlo se. Generace jsou vrácené.'**
  String get clipFailed;

  /// No description provided for @playClip.
  ///
  /// In cs, this message translates to:
  /// **'Přehrát klip'**
  String get playClip;

  /// No description provided for @clipSaved.
  ///
  /// In cs, this message translates to:
  /// **'Klip je ve Fotkách.'**
  String get clipSaved;

  /// No description provided for @clipSaveFailed.
  ///
  /// In cs, this message translates to:
  /// **'Klip se nepodařilo uložit do Fotek.'**
  String get clipSaveFailed;

  /// No description provided for @clipCantPlay.
  ///
  /// In cs, this message translates to:
  /// **'Klip se nedá přehrát.'**
  String get clipCantPlay;

  /// No description provided for @animate.
  ///
  /// In cs, this message translates to:
  /// **'Oživit'**
  String get animate;

  /// No description provided for @motionFast.
  ///
  /// In cs, this message translates to:
  /// **'Rychlé, během sekund'**
  String get motionFast;

  /// No description provided for @motionSlow.
  ///
  /// In cs, this message translates to:
  /// **'Pomalé, desítky minut'**
  String get motionSlow;

  /// No description provided for @tileNewLook.
  ///
  /// In cs, this message translates to:
  /// **'Nový vzhled'**
  String get tileNewLook;

  /// No description provided for @frameNotReady.
  ///
  /// In cs, this message translates to:
  /// **'Tenhle rámeček ještě není hotový.'**
  String get frameNotReady;

  /// No description provided for @runNotStarted.
  ///
  /// In cs, this message translates to:
  /// **'Render se nepodařilo spustit.'**
  String get runNotStarted;

  /// No description provided for @runFailedRefunded.
  ///
  /// In cs, this message translates to:
  /// **'Render se nepovedl. Generace jsou vrácené.'**
  String get runFailedRefunded;

  /// No description provided for @runLost.
  ///
  /// In cs, this message translates to:
  /// **'Server se mezitím restartoval a render ztratil.'**
  String get runLost;

  /// No description provided for @errNoFace.
  ///
  /// In cs, this message translates to:
  /// **'Tvář jsme nenašli. Použij čelní portrét jednoho člověka.'**
  String get errNoFace;

  /// No description provided for @errFaceTooSmall.
  ///
  /// In cs, this message translates to:
  /// **'Tvář je moc malá. Ořízni fotku blíž k hlavě a ramenům.'**
  String get errFaceTooSmall;

  /// No description provided for @errMaskTooSmallHair.
  ///
  /// In cs, this message translates to:
  /// **'Na fotce není dost vlasů, které by šlo přestříhat.'**
  String get errMaskTooSmallHair;

  /// No description provided for @errMouthNotVisible.
  ///
  /// In cs, this message translates to:
  /// **'Ústa musí být vidět. Dívej se do objektivu, bez ruky před tváří.'**
  String get errMouthNotVisible;

  /// No description provided for @errNoBeardToShave.
  ///
  /// In cs, this message translates to:
  /// **'Na fotce nejsou vousy k oholení.'**
  String get errNoBeardToShave;

  /// No description provided for @errEyesNotVisible.
  ///
  /// In cs, this message translates to:
  /// **'Oči musí být vidět. Dívej se do objektivu, bez ruky a vlasů přes oči.'**
  String get errEyesNotVisible;

  /// No description provided for @errMaskTooLarge.
  ///
  /// In cs, this message translates to:
  /// **'Tvář je moc blízko. Drž telefon dál.'**
  String get errMaskTooLarge;

  /// No description provided for @errNoGlassesToRemove.
  ///
  /// In cs, this message translates to:
  /// **'Na fotce nejsou brýle.'**
  String get errNoGlassesToRemove;

  /// No description provided for @errNothingToChange.
  ///
  /// In cs, this message translates to:
  /// **'Na téhle fotce není co změnit.'**
  String get errNothingToChange;

  /// No description provided for @errBusy.
  ///
  /// In cs, this message translates to:
  /// **'Běží ti jiný render. Dokud nedoběhne, nový nespustíš a nejde ani Oživit. Klip „vlasy ve větru“ může trvat kolem 20 minut.'**
  String get errBusy;

  /// No description provided for @errOffline.
  ///
  /// In cs, this message translates to:
  /// **'Server není dostupný. Zkontroluj připojení a zkus to znovu.'**
  String get errOffline;

  /// No description provided for @errAccessDenied.
  ///
  /// In cs, this message translates to:
  /// **'Server odmítl přístup. Tenhle build má špatný token.'**
  String get errAccessDenied;

  /// No description provided for @errNotFound.
  ///
  /// In cs, this message translates to:
  /// **'Server o tomhle renderu už neví. Spusť ho znovu.'**
  String get errNotFound;

  /// No description provided for @errPlanRejected.
  ///
  /// In cs, this message translates to:
  /// **'Server plán odmítl. Tahle fotka se nedá poslat.'**
  String get errPlanRejected;

  /// No description provided for @errServer.
  ///
  /// In cs, this message translates to:
  /// **'Server selhal ({status}). Zkus to za chvíli.'**
  String errServer(int status);

  /// No description provided for @errGeneric.
  ///
  /// In cs, this message translates to:
  /// **'Něco se nepovedlo: {error}'**
  String errGeneric(String error);

  /// No description provided for @photoUnreadable.
  ///
  /// In cs, this message translates to:
  /// **'Fotku se nepodařilo přečíst. Použij JPEG nebo PNG.'**
  String get photoUnreadable;

  /// No description provided for @stageWaitingServer.
  ///
  /// In cs, this message translates to:
  /// **'Čekám na server…'**
  String get stageWaitingServer;

  /// No description provided for @stageBeard.
  ///
  /// In cs, this message translates to:
  /// **'Upravuji vousy…'**
  String get stageBeard;

  /// No description provided for @stageGlasses.
  ///
  /// In cs, this message translates to:
  /// **'Nasazuji brýle…'**
  String get stageGlasses;

  /// No description provided for @stageHair.
  ///
  /// In cs, this message translates to:
  /// **'Stříhám…'**
  String get stageHair;

  /// No description provided for @stageQueue.
  ///
  /// In cs, this message translates to:
  /// **'Čekám ve frontě…'**
  String get stageQueue;

  /// No description provided for @stagePainting.
  ///
  /// In cs, this message translates to:
  /// **'Maluji {current}/{total}'**
  String stagePainting(int current, int total);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fi',
    'fr',
    'gu',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'kn',
    'ko',
    'ml',
    'mr',
    'ms',
    'nb',
    'nl',
    'or',
    'pa',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sl',
    'sv',
    'ta',
    'te',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppLocalizationsZhHans();
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'or':
      return AppLocalizationsOr();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sv':
      return AppLocalizationsSv();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
