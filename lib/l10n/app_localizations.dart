import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_en.dart';

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
    Locale('cs'),
    Locale('en'),
  ];

  /// No description provided for @styleAnime.
  ///
  /// In cs, this message translates to:
  /// **'Anime'**
  String get styleAnime;

  /// No description provided for @styleComic.
  ///
  /// In cs, this message translates to:
  /// **'Komiks'**
  String get styleComic;

  /// No description provided for @styleWatercolor.
  ///
  /// In cs, this message translates to:
  /// **'Akvarel'**
  String get styleWatercolor;

  /// No description provided for @styleOilportrait.
  ///
  /// In cs, this message translates to:
  /// **'Olejomalba'**
  String get styleOilportrait;

  /// No description provided for @stylePencil.
  ///
  /// In cs, this message translates to:
  /// **'Skica tužkou'**
  String get stylePencil;

  /// No description provided for @stylePopart.
  ///
  /// In cs, this message translates to:
  /// **'Pop art'**
  String get stylePopart;

  /// No description provided for @styleCyberpunk.
  ///
  /// In cs, this message translates to:
  /// **'Cyberpunk'**
  String get styleCyberpunk;

  /// No description provided for @styleNoir.
  ///
  /// In cs, this message translates to:
  /// **'Film noir'**
  String get styleNoir;

  /// No description provided for @styleBotticelli.
  ///
  /// In cs, this message translates to:
  /// **'Botticelli'**
  String get styleBotticelli;

  /// No description provided for @styleDavinci.
  ///
  /// In cs, this message translates to:
  /// **'Da Vinci (sfumato)'**
  String get styleDavinci;

  /// No description provided for @styleDavinciChalk.
  ///
  /// In cs, this message translates to:
  /// **'Da Vinci (studie rudkou)'**
  String get styleDavinciChalk;

  /// No description provided for @styleElgreco.
  ///
  /// In cs, this message translates to:
  /// **'El Greco'**
  String get styleElgreco;

  /// No description provided for @styleVermeer.
  ///
  /// In cs, this message translates to:
  /// **'Vermeer'**
  String get styleVermeer;

  /// No description provided for @styleGoyaCaprichos.
  ///
  /// In cs, this message translates to:
  /// **'Goya (Caprichos, lept)'**
  String get styleGoyaCaprichos;

  /// No description provided for @styleGoyaBlack.
  ///
  /// In cs, this message translates to:
  /// **'Goya (Černé malby)'**
  String get styleGoyaBlack;

  /// No description provided for @styleMonet.
  ///
  /// In cs, this message translates to:
  /// **'Monet'**
  String get styleMonet;

  /// No description provided for @styleSeurat.
  ///
  /// In cs, this message translates to:
  /// **'Seurat (pointilismus)'**
  String get styleSeurat;

  /// No description provided for @styleCezanne.
  ///
  /// In cs, this message translates to:
  /// **'Cézanne'**
  String get styleCezanne;

  /// No description provided for @styleVangoghArles.
  ///
  /// In cs, this message translates to:
  /// **'Van Gogh (Arles)'**
  String get styleVangoghArles;

  /// No description provided for @styleVangoghSaintremy.
  ///
  /// In cs, this message translates to:
  /// **'Van Gogh (Saint-Rémy)'**
  String get styleVangoghSaintremy;

  /// No description provided for @styleGauguin.
  ///
  /// In cs, this message translates to:
  /// **'Gauguin (Tahiti)'**
  String get styleGauguin;

  /// No description provided for @styleLautrecCabaret.
  ///
  /// In cs, this message translates to:
  /// **'Toulouse-Lautrec (kabaret)'**
  String get styleLautrecCabaret;

  /// No description provided for @styleLautrecPoster.
  ///
  /// In cs, this message translates to:
  /// **'Toulouse-Lautrec (plakát)'**
  String get styleLautrecPoster;

  /// No description provided for @styleBeardsley.
  ///
  /// In cs, this message translates to:
  /// **'Beardsley (perokresba)'**
  String get styleBeardsley;

  /// No description provided for @styleMunch.
  ///
  /// In cs, this message translates to:
  /// **'Munch'**
  String get styleMunch;

  /// No description provided for @styleKlimtGolden.
  ///
  /// In cs, this message translates to:
  /// **'Klimt (zlaté období)'**
  String get styleKlimtGolden;

  /// No description provided for @stylePicassoBlue.
  ///
  /// In cs, this message translates to:
  /// **'Picasso (modré období)'**
  String get stylePicassoBlue;

  /// No description provided for @stylePicassoRose.
  ///
  /// In cs, this message translates to:
  /// **'Picasso (růžové období)'**
  String get stylePicassoRose;

  /// No description provided for @styleKandinskyEarly.
  ///
  /// In cs, this message translates to:
  /// **'Kandinskij (raná tempera)'**
  String get styleKandinskyEarly;

  /// No description provided for @styleMatisseFauve.
  ///
  /// In cs, this message translates to:
  /// **'Matisse (fauvismus)'**
  String get styleMatisseFauve;

  /// No description provided for @styleSchiele.
  ///
  /// In cs, this message translates to:
  /// **'Schiele'**
  String get styleSchiele;

  /// No description provided for @styleKubista.
  ///
  /// In cs, this message translates to:
  /// **'Kubišta (kubo-expresionismus)'**
  String get styleKubista;

  /// No description provided for @styleMuchaSlavEpic.
  ///
  /// In cs, this message translates to:
  /// **'Mucha (Slovanská epopej)'**
  String get styleMuchaSlavEpic;

  /// No description provided for @styleChagall.
  ///
  /// In cs, this message translates to:
  /// **'Chagall'**
  String get styleChagall;

  /// No description provided for @styleJosefCapek.
  ///
  /// In cs, this message translates to:
  /// **'Josef Čapek (naivní kubismus)'**
  String get styleJosefCapek;

  /// No description provided for @styleRivera.
  ///
  /// In cs, this message translates to:
  /// **'Diego Rivera (nástěnná malba)'**
  String get styleRivera;

  /// No description provided for @styleLempicka.
  ///
  /// In cs, this message translates to:
  /// **'Lempicka (art deco)'**
  String get styleLempicka;

  /// No description provided for @styleMagritte.
  ///
  /// In cs, this message translates to:
  /// **'Magritte'**
  String get styleMagritte;

  /// No description provided for @styleHopper.
  ///
  /// In cs, this message translates to:
  /// **'Hopper'**
  String get styleHopper;

  /// No description provided for @styleDali.
  ///
  /// In cs, this message translates to:
  /// **'Dalí (surrealismus)'**
  String get styleDali;

  /// No description provided for @styleKahlo.
  ///
  /// In cs, this message translates to:
  /// **'Frida Kahlo'**
  String get styleKahlo;

  /// No description provided for @stylePicassoCubist.
  ///
  /// In cs, this message translates to:
  /// **'Picasso (kubistický portrét)'**
  String get stylePicassoCubist;

  /// No description provided for @styleLada.
  ///
  /// In cs, this message translates to:
  /// **'Josef Lada'**
  String get styleLada;

  /// No description provided for @styleMatisseCutout.
  ///
  /// In cs, this message translates to:
  /// **'Matisse (výstřižky)'**
  String get styleMatisseCutout;

  /// No description provided for @styleBacon.
  ///
  /// In cs, this message translates to:
  /// **'Francis Bacon'**
  String get styleBacon;

  /// No description provided for @styleWarhol.
  ///
  /// In cs, this message translates to:
  /// **'Warhol (sítotisk)'**
  String get styleWarhol;

  /// No description provided for @styleLichtenstein.
  ///
  /// In cs, this message translates to:
  /// **'Lichtenstein (komiksový rastr)'**
  String get styleLichtenstein;

  /// No description provided for @styleHockneyPool.
  ///
  /// In cs, this message translates to:
  /// **'Hockney (bazén)'**
  String get styleHockneyPool;

  /// No description provided for @styleBasquiat.
  ///
  /// In cs, this message translates to:
  /// **'Basquiat'**
  String get styleBasquiat;

  /// No description provided for @styleHaring.
  ///
  /// In cs, this message translates to:
  /// **'Keith Haring'**
  String get styleHaring;

  /// No description provided for @styleUkiyoe.
  ///
  /// In cs, this message translates to:
  /// **'Ukiyo-e dřevořez'**
  String get styleUkiyoe;

  /// No description provided for @styleChineseink.
  ///
  /// In cs, this message translates to:
  /// **'Čínská tušová malba'**
  String get styleChineseink;

  /// No description provided for @stylePersian.
  ///
  /// In cs, this message translates to:
  /// **'Perská miniatura'**
  String get stylePersian;

  /// No description provided for @styleIndian.
  ///
  /// In cs, this message translates to:
  /// **'Indická miniatura'**
  String get styleIndian;

  /// No description provided for @styleBurmese.
  ///
  /// In cs, this message translates to:
  /// **'Barmská chrámová malba'**
  String get styleBurmese;

  /// No description provided for @styleThangka.
  ///
  /// In cs, this message translates to:
  /// **'Tibetská thangka'**
  String get styleThangka;

  /// No description provided for @styleRinpa.
  ///
  /// In cs, this message translates to:
  /// **'Rinpa (zlatý paraván)'**
  String get styleRinpa;

  /// No description provided for @styleDunhuang.
  ///
  /// In cs, this message translates to:
  /// **'Tun-chuang (jeskynní malby)'**
  String get styleDunhuang;

  /// No description provided for @styleMinhwa.
  ///
  /// In cs, this message translates to:
  /// **'Korejská minhwa'**
  String get styleMinhwa;

  /// No description provided for @stylePapercut.
  ///
  /// In cs, this message translates to:
  /// **'Vystřihovánka'**
  String get stylePapercut;

  /// No description provided for @styleFilipino.
  ///
  /// In cs, this message translates to:
  /// **'Tradiční filipínský styl'**
  String get styleFilipino;

  /// No description provided for @styleRomanfresco.
  ///
  /// In cs, this message translates to:
  /// **'Římská freska'**
  String get styleRomanfresco;

  /// No description provided for @styleGreek.
  ///
  /// In cs, this message translates to:
  /// **'Klasické Řecko'**
  String get styleGreek;

  /// No description provided for @styleMinoan.
  ///
  /// In cs, this message translates to:
  /// **'Mínojská freska'**
  String get styleMinoan;

  /// No description provided for @styleByzantine.
  ///
  /// In cs, this message translates to:
  /// **'Byzantská ikona'**
  String get styleByzantine;

  /// No description provided for @styleIllumination.
  ///
  /// In cs, this message translates to:
  /// **'Iluminovaný rukopis'**
  String get styleIllumination;

  /// No description provided for @styleStainedglass.
  ///
  /// In cs, this message translates to:
  /// **'Vitráž'**
  String get styleStainedglass;

  /// No description provided for @styleBaroque.
  ///
  /// In cs, this message translates to:
  /// **'Dramatické baroko'**
  String get styleBaroque;

  /// No description provided for @styleImpressionist.
  ///
  /// In cs, this message translates to:
  /// **'Impresionismus'**
  String get styleImpressionist;

  /// No description provided for @styleArtnouveau.
  ///
  /// In cs, this message translates to:
  /// **'Secese'**
  String get styleArtnouveau;

  /// No description provided for @styleSecession.
  ///
  /// In cs, this message translates to:
  /// **'Vídeňská secese'**
  String get styleSecession;

  /// No description provided for @styleArtdeco.
  ///
  /// In cs, this message translates to:
  /// **'Art deco plakát'**
  String get styleArtdeco;

  /// No description provided for @styleConstructivist.
  ///
  /// In cs, this message translates to:
  /// **'Konstruktivistický plakát'**
  String get styleConstructivist;

  /// No description provided for @styleWoodcut.
  ///
  /// In cs, this message translates to:
  /// **'Expresionistický dřevoryt'**
  String get styleWoodcut;

  /// No description provided for @styleMaya.
  ///
  /// In cs, this message translates to:
  /// **'Mayská nástěnná malba'**
  String get styleMaya;

  /// No description provided for @styleAztec.
  ///
  /// In cs, this message translates to:
  /// **'Aztécký kodex'**
  String get styleAztec;

  /// No description provided for @styleInca.
  ///
  /// In cs, this message translates to:
  /// **'Incké textilie a zlato'**
  String get styleInca;

  /// No description provided for @styleLedger.
  ///
  /// In cs, this message translates to:
  /// **'Ledger art (Velké pláně)'**
  String get styleLedger;

  /// No description provided for @styleHuichol.
  ///
  /// In cs, this message translates to:
  /// **'Huičolské obrazy z příze'**
  String get styleHuichol;

  /// No description provided for @styleAboriginal.
  ///
  /// In cs, this message translates to:
  /// **'Domorodá tečková malba'**
  String get styleAboriginal;

  /// No description provided for @stylePolynesian.
  ///
  /// In cs, this message translates to:
  /// **'Tradiční Polynésie'**
  String get stylePolynesian;

  /// No description provided for @styleEgyptian.
  ///
  /// In cs, this message translates to:
  /// **'Starověký Egypt'**
  String get styleEgyptian;

  /// No description provided for @styleAshanti.
  ///
  /// In cs, this message translates to:
  /// **'Ašantové (Ghana)'**
  String get styleAshanti;

  /// No description provided for @styleDogon.
  ///
  /// In cs, this message translates to:
  /// **'Dogonové (Mali)'**
  String get styleDogon;

  /// No description provided for @styleHimba.
  ///
  /// In cs, this message translates to:
  /// **'Himbové (Namibie)'**
  String get styleHimba;

  /// No description provided for @styleMaasai.
  ///
  /// In cs, this message translates to:
  /// **'Masajové'**
  String get styleMaasai;

  /// No description provided for @styleAssyrian.
  ///
  /// In cs, this message translates to:
  /// **'Asyrský palácový reliéf'**
  String get styleAssyrian;

  /// No description provided for @styleMesopotamian.
  ///
  /// In cs, this message translates to:
  /// **'Mezopotámský reliéf'**
  String get styleMesopotamian;

  /// No description provided for @styleArabian.
  ///
  /// In cs, this message translates to:
  /// **'Předislámská Arábie'**
  String get styleArabian;

  /// No description provided for @styleHebrew.
  ///
  /// In cs, this message translates to:
  /// **'Starověcí Hebrejci'**
  String get styleHebrew;

  /// No description provided for @styleTangSancai.
  ///
  /// In cs, this message translates to:
  /// **'Tang sancai'**
  String get styleTangSancai;

  /// No description provided for @styleYamatoE.
  ///
  /// In cs, this message translates to:
  /// **'Yamato-e (emaki)'**
  String get styleYamatoE;

  /// No description provided for @stylePattachitra.
  ///
  /// In cs, this message translates to:
  /// **'Pattachitra (Urísa)'**
  String get stylePattachitra;

  /// No description provided for @styleKanoScreen.
  ///
  /// In cs, this message translates to:
  /// **'Kanó paraván'**
  String get styleKanoScreen;

  /// No description provided for @styleNianhua.
  ///
  /// In cs, this message translates to:
  /// **'Nianhua (novoroční tisk)'**
  String get styleNianhua;

  /// No description provided for @styleKamasanBali.
  ///
  /// In cs, this message translates to:
  /// **'Kamasan (Bali)'**
  String get styleKamasanBali;

  /// No description provided for @styleEnsoZen.
  ///
  /// In cs, this message translates to:
  /// **'Ensō (zen)'**
  String get styleEnsoZen;

  /// No description provided for @styleMadhubani.
  ///
  /// In cs, this message translates to:
  /// **'Madhubani (Mithila)'**
  String get styleMadhubani;

  /// No description provided for @stylePekingOperaMask.
  ///
  /// In cs, this message translates to:
  /// **'Pekingská opera (lianpu)'**
  String get stylePekingOperaMask;

  /// No description provided for @styleNihonga.
  ///
  /// In cs, this message translates to:
  /// **'Nihonga'**
  String get styleNihonga;

  /// No description provided for @styleWarli.
  ///
  /// In cs, this message translates to:
  /// **'Warli'**
  String get styleWarli;

  /// No description provided for @styleCavePainting.
  ///
  /// In cs, this message translates to:
  /// **'Jeskynní malba (Lascaux)'**
  String get styleCavePainting;

  /// No description provided for @styleCycladic.
  ///
  /// In cs, this message translates to:
  /// **'Kykladská idolka'**
  String get styleCycladic;

  /// No description provided for @styleGreekVaseBlack.
  ///
  /// In cs, this message translates to:
  /// **'Černofigurová váza'**
  String get styleGreekVaseBlack;

  /// No description provided for @styleGreekVaseRed.
  ///
  /// In cs, this message translates to:
  /// **'Červenofigurová váza'**
  String get styleGreekVaseRed;

  /// No description provided for @styleEtruscanTomb.
  ///
  /// In cs, this message translates to:
  /// **'Etruská hrobka (Tarquinia)'**
  String get styleEtruscanTomb;

  /// No description provided for @styleScythianGold.
  ///
  /// In cs, this message translates to:
  /// **'Skythské zlato'**
  String get styleScythianGold;

  /// No description provided for @styleRomanMosaic.
  ///
  /// In cs, this message translates to:
  /// **'Římská mozaika'**
  String get styleRomanMosaic;

  /// No description provided for @styleKells.
  ///
  /// In cs, this message translates to:
  /// **'Kniha z Kellsu'**
  String get styleKells;

  /// No description provided for @styleUrnesViking.
  ///
  /// In cs, this message translates to:
  /// **'Urnes (vikinský)'**
  String get styleUrnesViking;

  /// No description provided for @styleBayeux.
  ///
  /// In cs, this message translates to:
  /// **'Bayeuxská výšivka'**
  String get styleBayeux;

  /// No description provided for @styleRomanesqueFresco.
  ///
  /// In cs, this message translates to:
  /// **'Románská freska (Katalánsko)'**
  String get styleRomanesqueFresco;

  /// No description provided for @styleGothicAltarpiece.
  ///
  /// In cs, this message translates to:
  /// **'Gotický oltář'**
  String get styleGothicAltarpiece;

  /// No description provided for @stylePskovIcon.
  ///
  /// In cs, this message translates to:
  /// **'Pskovská ikona'**
  String get stylePskovIcon;

  /// No description provided for @styleDanseMacabre.
  ///
  /// In cs, this message translates to:
  /// **'Danse macabre'**
  String get styleDanseMacabre;

  /// No description provided for @styleFlemishStillLife.
  ///
  /// In cs, this message translates to:
  /// **'Vlámské zátiší (vanitas)'**
  String get styleFlemishStillLife;

  /// No description provided for @styleRococo.
  ///
  /// In cs, this message translates to:
  /// **'Rokoko'**
  String get styleRococo;

  /// No description provided for @styleNeoclassicism.
  ///
  /// In cs, this message translates to:
  /// **'Neoklasicismus'**
  String get styleNeoclassicism;

  /// No description provided for @styleRomanticismStorm.
  ///
  /// In cs, this message translates to:
  /// **'Romantická bouře'**
  String get styleRomanticismStorm;

  /// No description provided for @styleOrientalism.
  ///
  /// In cs, this message translates to:
  /// **'Orientalismus (19. stol.)'**
  String get styleOrientalism;

  /// No description provided for @styleVictorianFairy.
  ///
  /// In cs, this message translates to:
  /// **'Viktoriánské víly'**
  String get styleVictorianFairy;

  /// No description provided for @stylePrerafael.
  ///
  /// In cs, this message translates to:
  /// **'Prerafaelité'**
  String get stylePrerafael;

  /// No description provided for @styleArtsAndCrafts.
  ///
  /// In cs, this message translates to:
  /// **'Arts and Crafts (Morris)'**
  String get styleArtsAndCrafts;

  /// No description provided for @styleSymbolism.
  ///
  /// In cs, this message translates to:
  /// **'Symbolismus'**
  String get styleSymbolism;

  /// No description provided for @styleNabis.
  ///
  /// In cs, this message translates to:
  /// **'Nabis'**
  String get styleNabis;

  /// No description provided for @styleExpressionismPainting.
  ///
  /// In cs, this message translates to:
  /// **'Expresionismus (malba)'**
  String get styleExpressionismPainting;

  /// No description provided for @styleDadaCollage.
  ///
  /// In cs, this message translates to:
  /// **'Dada koláž'**
  String get styleDadaCollage;

  /// No description provided for @styleDeStijl.
  ///
  /// In cs, this message translates to:
  /// **'De Stijl'**
  String get styleDeStijl;

  /// No description provided for @styleBauhausPoster.
  ///
  /// In cs, this message translates to:
  /// **'Bauhaus plakát'**
  String get styleBauhausPoster;

  /// No description provided for @styleSocialistRealism.
  ///
  /// In cs, this message translates to:
  /// **'Socialistický realismus'**
  String get styleSocialistRealism;

  /// No description provided for @stylePolishPoster.
  ///
  /// In cs, this message translates to:
  /// **'Polská plakátová škola'**
  String get stylePolishPoster;

  /// No description provided for @styleMemphis80s.
  ///
  /// In cs, this message translates to:
  /// **'Memphis'**
  String get styleMemphis80s;

  /// No description provided for @styleNazca.
  ///
  /// In cs, this message translates to:
  /// **'Nazcká polychromie'**
  String get styleNazca;

  /// No description provided for @styleMoche.
  ///
  /// In cs, this message translates to:
  /// **'Mochická keramika'**
  String get styleMoche;

  /// No description provided for @styleHaidaFormline.
  ///
  /// In cs, this message translates to:
  /// **'Haida formline'**
  String get styleHaidaFormline;

  /// No description provided for @styleHudsonRiver.
  ///
  /// In cs, this message translates to:
  /// **'Hudson River'**
  String get styleHudsonRiver;

  /// No description provided for @styleNavajoSand.
  ///
  /// In cs, this message translates to:
  /// **'Navajo sandpainting'**
  String get styleNavajoSand;

  /// No description provided for @stylePrecisionism.
  ///
  /// In cs, this message translates to:
  /// **'Precisionismus'**
  String get stylePrecisionism;

  /// No description provided for @stylePinUp50s.
  ///
  /// In cs, this message translates to:
  /// **'Pin-up 50. let'**
  String get stylePinUp50s;

  /// No description provided for @styleInuitPrintmaking.
  ///
  /// In cs, this message translates to:
  /// **'Inuitský kamenotisk (Kinngait)'**
  String get styleInuitPrintmaking;

  /// No description provided for @stylePsychedelicPoster.
  ///
  /// In cs, this message translates to:
  /// **'Psychedelický plakát'**
  String get stylePsychedelicPoster;

  /// No description provided for @styleSanRockArt.
  ///
  /// In cs, this message translates to:
  /// **'Sanské skalní malby'**
  String get styleSanRockArt;

  /// No description provided for @styleArmenianManuscript.
  ///
  /// In cs, this message translates to:
  /// **'Arménský rukopis (Kilikie)'**
  String get styleArmenianManuscript;

  /// No description provided for @styleBeninBronze.
  ///
  /// In cs, this message translates to:
  /// **'Beninská plaketa'**
  String get styleBeninBronze;

  /// No description provided for @styleKubaCloth.
  ///
  /// In cs, this message translates to:
  /// **'Kuba (rafie)'**
  String get styleKubaCloth;

  /// No description provided for @styleNdebele.
  ///
  /// In cs, this message translates to:
  /// **'Ndebele (fasády)'**
  String get styleNdebele;

  /// No description provided for @styleTingatinga.
  ///
  /// In cs, this message translates to:
  /// **'Tingatinga'**
  String get styleTingatinga;

  /// No description provided for @styleVanEyck.
  ///
  /// In cs, this message translates to:
  /// **'Van Eyck — lazurový olej'**
  String get styleVanEyck;

  /// No description provided for @styleBosch.
  ///
  /// In cs, this message translates to:
  /// **'Bosch — panoramatická alegorie'**
  String get styleBosch;

  /// No description provided for @styleDurerEngraving.
  ///
  /// In cs, this message translates to:
  /// **'Dürer — mědiryty'**
  String get styleDurerEngraving;

  /// No description provided for @styleTitian.
  ///
  /// In cs, this message translates to:
  /// **'Tizian — benátský kolorit'**
  String get styleTitian;

  /// No description provided for @styleBruegel.
  ///
  /// In cs, this message translates to:
  /// **'Bruegel — vesnice z nadhledu'**
  String get styleBruegel;

  /// No description provided for @styleCaravaggio.
  ///
  /// In cs, this message translates to:
  /// **'Caravaggio — modely ze tmy'**
  String get styleCaravaggio;

  /// No description provided for @styleRubens.
  ///
  /// In cs, this message translates to:
  /// **'Rubens — vířivá kompozice'**
  String get styleRubens;

  /// No description provided for @styleVelazquez.
  ///
  /// In cs, this message translates to:
  /// **'Velázquez — stříbřitá paleta'**
  String get styleVelazquez;

  /// No description provided for @styleFragonard.
  ///
  /// In cs, this message translates to:
  /// **'Fragonard — hravý štětec'**
  String get styleFragonard;

  /// No description provided for @styleDavidNeoclassical.
  ///
  /// In cs, this message translates to:
  /// **'David — neoklasicismus'**
  String get styleDavidNeoclassical;

  /// No description provided for @styleBlake.
  ///
  /// In cs, this message translates to:
  /// **'Blake — barevné tisky'**
  String get styleBlake;

  /// No description provided for @styleHokusai.
  ///
  /// In cs, this message translates to:
  /// **'Hokusai — manga skici'**
  String get styleHokusai;

  /// No description provided for @styleFriedrich.
  ///
  /// In cs, this message translates to:
  /// **'Friedrich — mlžná krajina'**
  String get styleFriedrich;

  /// No description provided for @styleTurner.
  ///
  /// In cs, this message translates to:
  /// **'Turner — rozpuštěné světlo'**
  String get styleTurner;

  /// No description provided for @styleIngres.
  ///
  /// In cs, this message translates to:
  /// **'Ingres — porcelánová pleť'**
  String get styleIngres;

  /// No description provided for @styleHiroshige.
  ///
  /// In cs, this message translates to:
  /// **'Hirošige — bokashi'**
  String get styleHiroshige;

  /// No description provided for @styleKuniyoshi.
  ///
  /// In cs, this message translates to:
  /// **'Kunijoši — hrdinské listy'**
  String get styleKuniyoshi;

  /// No description provided for @styleManet.
  ///
  /// In cs, this message translates to:
  /// **'Manet — černá jako barva'**
  String get styleManet;

  /// No description provided for @styleDore.
  ///
  /// In cs, this message translates to:
  /// **'Doré — xylografie'**
  String get styleDore;

  /// No description provided for @styleWhistler.
  ///
  /// In cs, this message translates to:
  /// **'Whistler — nokturno'**
  String get styleWhistler;

  /// No description provided for @styleYoshitoshi.
  ///
  /// In cs, this message translates to:
  /// **'Jošitoši — poslední ukiyo-e'**
  String get styleYoshitoshi;

  /// No description provided for @styleRenoir.
  ///
  /// In cs, this message translates to:
  /// **'Renoir — skvrny světla'**
  String get styleRenoir;

  /// No description provided for @styleCassatt.
  ///
  /// In cs, this message translates to:
  /// **'Cassattová — pastel a japonský výřez'**
  String get styleCassatt;

  /// No description provided for @styleRepin.
  ///
  /// In cs, this message translates to:
  /// **'Repin — ruský realismus'**
  String get styleRepin;

  /// No description provided for @styleRousseau.
  ///
  /// In cs, this message translates to:
  /// **'Rousseau — naivní džungle'**
  String get styleRousseau;

  /// No description provided for @styleAles.
  ///
  /// In cs, this message translates to:
  /// **'Aleš — národní kresba'**
  String get styleAles;

  /// No description provided for @styleLarsson.
  ///
  /// In cs, this message translates to:
  /// **'Larsson — švédský domov'**
  String get styleLarsson;

  /// No description provided for @styleMalczewski.
  ///
  /// In cs, this message translates to:
  /// **'Malczewski — polský symbolismus'**
  String get styleMalczewski;

  /// No description provided for @styleSargent.
  ///
  /// In cs, this message translates to:
  /// **'Sargent — bravurní tah'**
  String get styleSargent;

  /// No description provided for @styleVrubel.
  ///
  /// In cs, this message translates to:
  /// **'Vrubel — krystalické fasety'**
  String get styleVrubel;

  /// No description provided for @styleZorn.
  ///
  /// In cs, this message translates to:
  /// **'Zorn — čtyřbarevná paleta'**
  String get styleZorn;

  /// No description provided for @styleEnsor.
  ///
  /// In cs, this message translates to:
  /// **'Ensor — masky'**
  String get styleEnsor;

  /// No description provided for @styleSorolla.
  ///
  /// In cs, this message translates to:
  /// **'Sorolla — středomořské slunce'**
  String get styleSorolla;

  /// No description provided for @styleHammershoi.
  ///
  /// In cs, this message translates to:
  /// **'Hammershøi — šedé ticho'**
  String get styleHammershoi;

  /// No description provided for @styleRackham.
  ///
  /// In cs, this message translates to:
  /// **'Rackham — sépiové pohádky'**
  String get styleRackham;

  /// No description provided for @styleWyspianski.
  ///
  /// In cs, this message translates to:
  /// **'Wyspiański — pastelová secese'**
  String get styleWyspianski;

  /// No description provided for @styleKupkaEarly.
  ///
  /// In cs, this message translates to:
  /// **'Kupka — spektrum'**
  String get styleKupkaEarly;

  /// No description provided for @stylePreisler.
  ///
  /// In cs, this message translates to:
  /// **'Preisler — secesní symbolismus'**
  String get stylePreisler;

  /// No description provided for @styleBilibin.
  ///
  /// In cs, this message translates to:
  /// **'Bilibin — ruské pohádky'**
  String get styleBilibin;

  /// No description provided for @styleKlee.
  ///
  /// In cs, this message translates to:
  /// **'Klee — mřížky barev'**
  String get styleKlee;

  /// No description provided for @styleKirchner.
  ///
  /// In cs, this message translates to:
  /// **'Kirchner — Die Brücke'**
  String get styleKirchner;

  /// No description provided for @styleMarc.
  ///
  /// In cs, this message translates to:
  /// **'Marc — barevné prizmy'**
  String get styleMarc;

  /// No description provided for @styleLeger.
  ///
  /// In cs, this message translates to:
  /// **'Léger — trubkové postavy'**
  String get styleLeger;

  /// No description provided for @styleDeChirico.
  ///
  /// In cs, this message translates to:
  /// **'De Chirico — metafyzické náměstí'**
  String get styleDeChirico;

  /// No description provided for @styleGrantWood.
  ///
  /// In cs, this message translates to:
  /// **'Grant Wood — regionalismus'**
  String get styleGrantWood;

  /// No description provided for @styleMiro.
  ///
  /// In cs, this message translates to:
  /// **'Miró — biomorfní znaky'**
  String get styleMiro;

  /// No description provided for @styleToyen.
  ///
  /// In cs, this message translates to:
  /// **'Toyen — surrealismus'**
  String get styleToyen;

  /// No description provided for @styleBurian.
  ///
  /// In cs, this message translates to:
  /// **'Burian — teplý realismus'**
  String get styleBurian;

  /// No description provided for @styleBearden.
  ///
  /// In cs, this message translates to:
  /// **'Bearden — koláž'**
  String get styleBearden;

  /// No description provided for @styleTrnka.
  ///
  /// In cs, this message translates to:
  /// **'Trnka — loutkové pohádky'**
  String get styleTrnka;

  /// No description provided for @styleWyeth.
  ///
  /// In cs, this message translates to:
  /// **'Wyeth — tempera'**
  String get styleWyeth;

  /// No description provided for @styleJacobLawrence.
  ///
  /// In cs, this message translates to:
  /// **'Lawrence — ploché tempery'**
  String get styleJacobLawrence;

  /// No description provided for @styleFrazetta.
  ///
  /// In cs, this message translates to:
  /// **'Frazetta — olejová fantasy'**
  String get styleFrazetta;

  /// No description provided for @styleBeksinski.
  ///
  /// In cs, this message translates to:
  /// **'Beksiński — dystopie'**
  String get styleBeksinski;

  /// No description provided for @styleKusama.
  ///
  /// In cs, this message translates to:
  /// **'Kusama — puntíky'**
  String get styleKusama;

  /// No description provided for @styleBorn.
  ///
  /// In cs, this message translates to:
  /// **'Born — karikatura'**
  String get styleBorn;

  /// No description provided for @styleMoebius.
  ///
  /// In cs, this message translates to:
  /// **'Moebius — jemná linka'**
  String get styleMoebius;

  /// No description provided for @styleGiger.
  ///
  /// In cs, this message translates to:
  /// **'Giger — biomechanika'**
  String get styleGiger;

  /// No description provided for @styleSorayama.
  ///
  /// In cs, this message translates to:
  /// **'Sorayama — chrom'**
  String get styleSorayama;

  /// No description provided for @styleMurakami.
  ///
  /// In cs, this message translates to:
  /// **'Murakami — superflat'**
  String get styleMurakami;

  /// No description provided for @styleKehindeWiley.
  ///
  /// In cs, this message translates to:
  /// **'Wiley — florální pozadí'**
  String get styleKehindeWiley;

  /// No description provided for @styleAirbrush.
  ///
  /// In cs, this message translates to:
  /// **'Airbrush'**
  String get styleAirbrush;

  /// No description provided for @styleAcrylicPour.
  ///
  /// In cs, this message translates to:
  /// **'Akryl — lití (fluid art)'**
  String get styleAcrylicPour;

  /// No description provided for @styleAcrylicFlat.
  ///
  /// In cs, this message translates to:
  /// **'Akryl — ploché plochy'**
  String get styleAcrylicFlat;

  /// No description provided for @styleWatercolorInkLine.
  ///
  /// In cs, this message translates to:
  /// **'Akvarel s perokresbou'**
  String get styleWatercolorInkLine;

  /// No description provided for @styleWatercolorWet.
  ///
  /// In cs, this message translates to:
  /// **'Akvarel — mokré do mokrého'**
  String get styleWatercolorWet;

  /// No description provided for @styleWatercolorDry.
  ///
  /// In cs, this message translates to:
  /// **'Akvarel — suchý štětec'**
  String get styleWatercolorDry;

  /// No description provided for @styleCalligraphyArabic.
  ///
  /// In cs, this message translates to:
  /// **'Arabská kaligrafie (thuluth)'**
  String get styleCalligraphyArabic;

  /// No description provided for @styleAsciiArt.
  ///
  /// In cs, this message translates to:
  /// **'ASCII art'**
  String get styleAsciiArt;

  /// No description provided for @styleBatik.
  ///
  /// In cs, this message translates to:
  /// **'Batika'**
  String get styleBatik;

  /// No description provided for @styleTieDye.
  ///
  /// In cs, this message translates to:
  /// **'Batika vázaná'**
  String get styleTieDye;

  /// No description provided for @styleStainedConcrete.
  ///
  /// In cs, this message translates to:
  /// **'Beton'**
  String get styleStainedConcrete;

  /// No description provided for @styleBlueprint.
  ///
  /// In cs, this message translates to:
  /// **'Blueprint'**
  String get styleBlueprint;

  /// No description provided for @styleBronze.
  ///
  /// In cs, this message translates to:
  /// **'Bronz'**
  String get styleBronze;

  /// No description provided for @styleBrushLettering.
  ///
  /// In cs, this message translates to:
  /// **'Brush lettering'**
  String get styleBrushLettering;

  /// No description provided for @styleCelShaded.
  ///
  /// In cs, this message translates to:
  /// **'Cel shading'**
  String get styleCelShaded;

  /// No description provided for @styleCalligraphyChinese.
  ///
  /// In cs, this message translates to:
  /// **'Čínská kaligrafie (kchaj-šu)'**
  String get styleCalligraphyChinese;

  /// No description provided for @styleConte.
  ///
  /// In cs, this message translates to:
  /// **'Conté / křída na tónovaném papíru'**
  String get styleConte;

  /// No description provided for @styleCopperplate.
  ///
  /// In cs, this message translates to:
  /// **'Copperplate / anglická kurzíva'**
  String get styleCopperplate;

  /// No description provided for @styleDaguerreotype.
  ///
  /// In cs, this message translates to:
  /// **'Daguerrotypie'**
  String get styleDaguerreotype;

  /// No description provided for @stylePinhole.
  ///
  /// In cs, this message translates to:
  /// **'Dírková komora'**
  String get stylePinhole;

  /// No description provided for @styleCalligraphyCursive.
  ///
  /// In cs, this message translates to:
  /// **'Divoká kurzíva (cchao-šu)'**
  String get styleCalligraphyCursive;

  /// No description provided for @styleWireSculpture.
  ///
  /// In cs, this message translates to:
  /// **'Drátěná socha'**
  String get styleWireSculpture;

  /// No description provided for @styleBlockPrintTextile.
  ///
  /// In cs, this message translates to:
  /// **'Dřevěný razítkový tisk na látku'**
  String get styleBlockPrintTextile;

  /// No description provided for @styleDoubleExposure.
  ///
  /// In cs, this message translates to:
  /// **'Dvojexpozice'**
  String get styleDoubleExposure;

  /// No description provided for @styleCloisonne.
  ///
  /// In cs, this message translates to:
  /// **'Email cloisonné'**
  String get styleCloisonne;

  /// No description provided for @styleEncaustic.
  ///
  /// In cs, this message translates to:
  /// **'Enkaustika (vosk)'**
  String get styleEncaustic;

  /// No description provided for @styleTintype.
  ///
  /// In cs, this message translates to:
  /// **'Ferotypie'**
  String get styleTintype;

  /// No description provided for @styleFineliner.
  ///
  /// In cs, this message translates to:
  /// **'Fineliner — perokresba'**
  String get styleFineliner;

  /// No description provided for @stylePhotogram.
  ///
  /// In cs, this message translates to:
  /// **'Fotogram'**
  String get stylePhotogram;

  /// No description provided for @styleGlassBlown.
  ///
  /// In cs, this message translates to:
  /// **'Foukané sklo'**
  String get styleGlassBlown;

  /// No description provided for @styleFrescoBuon.
  ///
  /// In cs, this message translates to:
  /// **'Freska'**
  String get styleFrescoBuon;

  /// No description provided for @styleTapestryWeave.
  ///
  /// In cs, this message translates to:
  /// **'Gobelín'**
  String get styleTapestryWeave;

  /// No description provided for @styleBlackletter.
  ///
  /// In cs, this message translates to:
  /// **'Gotická textura (blackletter)'**
  String get styleBlackletter;

  /// No description provided for @styleGraffitiWildstyle.
  ///
  /// In cs, this message translates to:
  /// **'Graffiti wildstyle'**
  String get styleGraffitiWildstyle;

  /// No description provided for @styleGyotaku.
  ///
  /// In cs, this message translates to:
  /// **'Gyotaku (otisk ryby)'**
  String get styleGyotaku;

  /// No description provided for @styleInfraredFilm.
  ///
  /// In cs, this message translates to:
  /// **'Infračervený film'**
  String get styleInfraredFilm;

  /// No description provided for @styleMarquetry.
  ///
  /// In cs, this message translates to:
  /// **'Intarzie'**
  String get styleMarquetry;

  /// No description provided for @styleCasein.
  ///
  /// In cs, this message translates to:
  /// **'Kaseinová tempera'**
  String get styleCasein;

  /// No description provided for @styleKirigami.
  ///
  /// In cs, this message translates to:
  /// **'Kirigami'**
  String get styleKirigami;

  /// No description provided for @styleLetterpress.
  ///
  /// In cs, this message translates to:
  /// **'Knihtisk'**
  String get styleLetterpress;

  /// No description provided for @styleBeadworkLoom.
  ///
  /// In cs, this message translates to:
  /// **'Korálková výšivka'**
  String get styleBeadworkLoom;

  /// No description provided for @styleHangulCalligraphy.
  ///
  /// In cs, this message translates to:
  /// **'Korejská kaligrafie'**
  String get styleHangulCalligraphy;

  /// No description provided for @styleLace.
  ///
  /// In cs, this message translates to:
  /// **'Krajka'**
  String get styleLace;

  /// No description provided for @styleChalkboard.
  ///
  /// In cs, this message translates to:
  /// **'Křída na tabuli'**
  String get styleChalkboard;

  /// No description provided for @styleCrossStitch.
  ///
  /// In cs, this message translates to:
  /// **'Křížková výšivka'**
  String get styleCrossStitch;

  /// No description provided for @styleGouache.
  ///
  /// In cs, this message translates to:
  /// **'Kvaš'**
  String get styleGouache;

  /// No description provided for @styleCyanotype.
  ///
  /// In cs, this message translates to:
  /// **'Kyanotypie'**
  String get styleCyanotype;

  /// No description provided for @styleIceSculpture.
  ///
  /// In cs, this message translates to:
  /// **'Ledová socha'**
  String get styleIceSculpture;

  /// No description provided for @styleCardboard.
  ///
  /// In cs, this message translates to:
  /// **'Lepenka'**
  String get styleCardboard;

  /// No description provided for @styleEtching.
  ///
  /// In cs, this message translates to:
  /// **'Lept'**
  String get styleEtching;

  /// No description provided for @styleMarker.
  ///
  /// In cs, this message translates to:
  /// **'Lihové fixy (Copic)'**
  String get styleMarker;

  /// No description provided for @styleLinocut.
  ///
  /// In cs, this message translates to:
  /// **'Linoryt'**
  String get styleLinocut;

  /// No description provided for @stylePressedFlowers.
  ///
  /// In cs, this message translates to:
  /// **'Lisované květiny'**
  String get stylePressedFlowers;

  /// No description provided for @styleLithograph.
  ///
  /// In cs, this message translates to:
  /// **'Litografie'**
  String get styleLithograph;

  /// No description provided for @styleLomography.
  ///
  /// In cs, this message translates to:
  /// **'Lomo / cross process'**
  String get styleLomography;

  /// No description provided for @styleLowPoly.
  ///
  /// In cs, this message translates to:
  /// **'Low poly'**
  String get styleLowPoly;

  /// No description provided for @styleSandPainting.
  ///
  /// In cs, this message translates to:
  /// **'Malba pískem'**
  String get styleSandPainting;

  /// No description provided for @styleFingerPaint.
  ///
  /// In cs, this message translates to:
  /// **'Malba prsty'**
  String get styleFingerPaint;

  /// No description provided for @styleSoapstone.
  ///
  /// In cs, this message translates to:
  /// **'Mastek / hladký kámen'**
  String get styleSoapstone;

  /// No description provided for @styleMiniatureGouache.
  ///
  /// In cs, this message translates to:
  /// **'Miniatura na slonovině'**
  String get styleMiniatureGouache;

  /// No description provided for @styleBlueWhitePorcelain.
  ///
  /// In cs, this message translates to:
  /// **'Modrobílý porcelán'**
  String get styleBlueWhitePorcelain;

  /// No description provided for @styleMonotype.
  ///
  /// In cs, this message translates to:
  /// **'Monotyp'**
  String get styleMonotype;

  /// No description provided for @styleMosaicTesserae.
  ///
  /// In cs, this message translates to:
  /// **'Mozaika'**
  String get styleMosaicTesserae;

  /// No description provided for @styleMarble.
  ///
  /// In cs, this message translates to:
  /// **'Mramorová socha'**
  String get styleMarble;

  /// No description provided for @styleNeonSign.
  ///
  /// In cs, this message translates to:
  /// **'Neonová reklama'**
  String get styleNeonSign;

  /// No description provided for @styleHalftoneNewsprint.
  ///
  /// In cs, this message translates to:
  /// **'Novinový rastr'**
  String get styleHalftoneNewsprint;

  /// No description provided for @styleOilAllaPrima.
  ///
  /// In cs, this message translates to:
  /// **'Olej — alla prima'**
  String get styleOilAllaPrima;

  /// No description provided for @styleOilImpasto.
  ///
  /// In cs, this message translates to:
  /// **'Olej — impasto'**
  String get styleOilImpasto;

  /// No description provided for @styleOilGlazing.
  ///
  /// In cs, this message translates to:
  /// **'Olej — lazury (staří mistři)'**
  String get styleOilGlazing;

  /// No description provided for @styleOilPastel.
  ///
  /// In cs, this message translates to:
  /// **'Olejový pastel'**
  String get styleOilPastel;

  /// No description provided for @styleOrigami.
  ///
  /// In cs, this message translates to:
  /// **'Origami'**
  String get styleOrigami;

  /// No description provided for @styleQuilt.
  ///
  /// In cs, this message translates to:
  /// **'Patchwork / quilt'**
  String get styleQuilt;

  /// No description provided for @styleGingerbread.
  ///
  /// In cs, this message translates to:
  /// **'Perník'**
  String get styleGingerbread;

  /// No description provided for @styleSandSculpture.
  ///
  /// In cs, this message translates to:
  /// **'Pískový reliéf'**
  String get styleSandSculpture;

  /// No description provided for @styleClaymation.
  ///
  /// In cs, this message translates to:
  /// **'Plastelína (claymation)'**
  String get styleClaymation;

  /// No description provided for @styleKnitted.
  ///
  /// In cs, this message translates to:
  /// **'Pletené'**
  String get styleKnitted;

  /// No description provided for @styleFelt.
  ///
  /// In cs, this message translates to:
  /// **'Plstění'**
  String get styleFelt;

  /// No description provided for @stylePolaroid.
  ///
  /// In cs, this message translates to:
  /// **'Polaroid'**
  String get stylePolaroid;

  /// No description provided for @stylePorcelainFigurine.
  ///
  /// In cs, this message translates to:
  /// **'Porcelánová figurka'**
  String get stylePorcelainFigurine;

  /// No description provided for @styleBallpoint.
  ///
  /// In cs, this message translates to:
  /// **'Propiska'**
  String get styleBallpoint;

  /// No description provided for @styleQuilling.
  ///
  /// In cs, this message translates to:
  /// **'Quilling'**
  String get styleQuilling;

  /// No description provided for @styleCeramicRaku.
  ///
  /// In cs, this message translates to:
  /// **'Raku keramika'**
  String get styleCeramicRaku;

  /// No description provided for @styleNibInk.
  ///
  /// In cs, this message translates to:
  /// **'Redispero a tuš'**
  String get styleNibInk;

  /// No description provided for @styleXray.
  ///
  /// In cs, this message translates to:
  /// **'Rentgen'**
  String get styleXray;

  /// No description provided for @styleRustPatina.
  ///
  /// In cs, this message translates to:
  /// **'Rez a patina'**
  String get styleRustPatina;

  /// No description provided for @styleWoodCarving.
  ///
  /// In cs, this message translates to:
  /// **'Řezba ve dřevě'**
  String get styleWoodCarving;

  /// No description provided for @styleEngravingBanknote.
  ///
  /// In cs, this message translates to:
  /// **'Rytina (bankovka)'**
  String get styleEngravingBanknote;

  /// No description provided for @styleStickerCollage.
  ///
  /// In cs, this message translates to:
  /// **'Samolepková koláž'**
  String get styleStickerCollage;

  /// No description provided for @styleScratchboard.
  ///
  /// In cs, this message translates to:
  /// **'Škrabaná technika'**
  String get styleScratchboard;

  /// No description provided for @stylePaletteKnife.
  ///
  /// In cs, this message translates to:
  /// **'Špachtle'**
  String get stylePaletteKnife;

  /// No description provided for @styleSprayStencil.
  ///
  /// In cs, this message translates to:
  /// **'Sprej přes šablonu'**
  String get styleSprayStencil;

  /// No description provided for @styleBrushInk.
  ///
  /// In cs, this message translates to:
  /// **'Štětec a tuš (ne sumi-e)'**
  String get styleBrushInk;

  /// No description provided for @styleSilverpoint.
  ///
  /// In cs, this message translates to:
  /// **'Stříbrná tužka'**
  String get styleSilverpoint;

  /// No description provided for @styleDrypoint.
  ///
  /// In cs, this message translates to:
  /// **'Suchá jehla'**
  String get styleDrypoint;

  /// No description provided for @styleSoftPastel.
  ///
  /// In cs, this message translates to:
  /// **'Suchý pastel'**
  String get styleSoftPastel;

  /// No description provided for @styleTattooFlash.
  ///
  /// In cs, this message translates to:
  /// **'Tattoo flash (old school)'**
  String get styleTattooFlash;

  /// No description provided for @styleRepousseMetal.
  ///
  /// In cs, this message translates to:
  /// **'Tepaný kov (repoussé)'**
  String get styleRepousseMetal;

  /// No description provided for @styleTerracotta.
  ///
  /// In cs, this message translates to:
  /// **'Terakota'**
  String get styleTerracotta;

  /// No description provided for @styleThermal.
  ///
  /// In cs, this message translates to:
  /// **'Termokamera'**
  String get styleThermal;

  /// No description provided for @styleGraphite.
  ///
  /// In cs, this message translates to:
  /// **'Tužka'**
  String get styleGraphite;

  /// No description provided for @styleGraphiteHard.
  ///
  /// In cs, this message translates to:
  /// **'Tvrdá tužka — technická'**
  String get styleGraphiteHard;

  /// No description provided for @styleCharcoal.
  ///
  /// In cs, this message translates to:
  /// **'Uhel'**
  String get styleCharcoal;

  /// No description provided for @styleEggTempera.
  ///
  /// In cs, this message translates to:
  /// **'Vaječná tempera'**
  String get styleEggTempera;

  /// No description provided for @styleVectorFlat.
  ///
  /// In cs, this message translates to:
  /// **'Vektor — flat design'**
  String get styleVectorFlat;

  /// No description provided for @styleWaxFigure.
  ///
  /// In cs, this message translates to:
  /// **'Vosková figura'**
  String get styleWaxFigure;

  /// No description provided for @styleCrayon.
  ///
  /// In cs, this message translates to:
  /// **'Voskovky'**
  String get styleCrayon;

  /// No description provided for @stylePaperSculptureLayered.
  ///
  /// In cs, this message translates to:
  /// **'Vrstvený papír (paper cut light box)'**
  String get stylePaperSculptureLayered;

  /// No description provided for @stylePyrography.
  ///
  /// In cs, this message translates to:
  /// **'Vypalování do dřeva'**
  String get stylePyrography;

  /// No description provided for @styleEmbroidery.
  ///
  /// In cs, this message translates to:
  /// **'Výšivka'**
  String get styleEmbroidery;

  /// No description provided for @stylePopUpBook.
  ///
  /// In cs, this message translates to:
  /// **'Vystřelovací kniha'**
  String get stylePopUpBook;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['cs', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return AppLocalizationsCs();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
