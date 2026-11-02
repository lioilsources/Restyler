# Restyler

Flutter appka pro iOS a Android: selfie → vousy → brýle → vlasy → styly → fotobuňka,
z rámečků navíc krátké klipy („Oživit“). Plány: `Prompts/00-PLAN-restyler.md`,
`Prompts/03-PLAN-zivy-portret.md`. Žádný web build, žádné účty, žádné platby.

## Offline-first

V telefonu běží všechno kromě renderu: parsing tváře (ONNX), masky, barva vlasů,
detekce vousů, prompty, plán kroků, projekty, skládání pásu. Na server jde jediná
fotka a masky. Výstupy se stáhnou do souboru hned, jak krok doběhne, a dál žijí
offline.

Jediný endpoint je `POST /api/render` (`tsumiki_shared`: `BackendClient`), kolem něj
poll, stažení kroku a `/api/me`. Modely jsou zapečené v appce, ze serveru se nestahují.

## Pravidla, která se nesmí obejít

- **`status` rozhoduje o konci jobu**, ne `done`/`total`: se skipy `done` na `total`
  nedosáhne nikdy. Job je `done`, když vznikl aspoň jeden výstup.
- **Všechny masky z originálu.** Pořadí vousy → brýle → vlasy → styly; `input` jde
  řetězem jen přes zařazené kroky (`assemblePlan`).
- **Parser, masky i server čtou tytéž bajty** (`normalisePhoto`: EXIF narovnat,
  ≤ 1536, bez metadat). Server odmítne masku jiného rozměru než zdroj.
- **Parser vrací `FaceParse` v rozměru fotky.** Upsamplují se logity, až pak argmax.
  `FaceParse.resized` ani `copyResize` na cestě k parseru nepoužívat: měřené IoU očí
  padá na 0.81–0.95. Čísla: `MangaPrompts/docs/ondevice-parity.md`.
- **Cena je vždy `RenderPlan.cost` / `RenderJob.cost`**, nikdy počet na obrazovce.
- **Cesty v Hive jsou relativní**: iOS při aktualizaci přesouvá kontejner.
- Co jde do `Worker` (isolate), staví top-level funkce; closure nesmí vidět notifier.
- Prázdné `kBeards`/`kGlasses` schovají svůj krok, prázdné `kMotions` schová Oživit
  (`BoothCatalog`, `wizardSteps`). Katalogy plní bench gate v MangaPrompts, ne tohle repo.

## Modely

SegFormer ve fp16, nikdy int8 (pod CoreML EP dává špatný výstup):

| soubor | velikost | výstup |
|---|---|---|
| `face_b5.fp16.<sha8>.onnx` | 170.5 MB | `logits` 1×19×128×128 |
| `clothes_b2.fp16.<sha8>.onnx` | 95.2 MB | `logits` 1×18×128×128 |

Zdroj a export: `MangaPrompts/tools/ondevice/`; export s jeho připnutými verzemi je
reprodukovatelný na bajt. Váhy jsou assety v `assets/models/`, do gitu nepatří
(`.gitignore`, repo je veřejné a licence vah není jasná). CI je bere z backendu
(`tools/fetch_models.sh`, viz Release), lokální `make models` chybějící soubory
stáhne rsyncem ze SPARKu (`~/deploy/restyler-models/`, `MODELS_REMOTE`), ověří sha256
a každý build přes Makefile ho volá. Při běhu je plugin
(`createSessionFromAsset`) přes `rootBundle` rozbalí do tmp a po vymazání je rozbalí
znovu, takže na disku jsou dvakrát. Nový export znamená nový otisk i jméno
v `lib/services/onnx_face_parser.dart`, v `Makefile` a nový soubor na SPARKu i na JODĚ.

Runtime `flutter_onnxruntime` 1.9.0 si vynucuje iOS 16, statické pody
(`use_frameworks! :linkage => :static`) a `enable-swift-package-manager: false`.

## Sdílený balíček

`packages/tsumiki_shared` je vlastní kopie tohoto repa, Restyler na MangaPrompts
nezávisí. Vznikla z MangaPrompts, tag `shared-v1`, a dál se vyvíjí zvlášť. Fixtury
jsou v `packages/tsumiki_shared/test/fixtures`; změna masek nebo promptů na serveru
se sem musí přenést ručně i s novými fixturami.

## Příkazy

```sh
cp .env.local.example .env.local   # CF_ACCESS_*, RESTYLER_APP_TOKEN, RESTYLER_USER
make device-gate DEVICE=<id>   # parser na telefonu, bez serveru (čas, paměť, shoda)
make run            # release; make debug vezme i RESTYLER_API_URL pro LAN
make build-ios      # ios/ExportOptions.plist doplnit o team a profil
make build-android
make analyze
make test
```

## Release (GitHub Actions)

Tag `v*` spustí `release-ios.yml` (TestFlight) a `release-android.yml` (Firebase App
Distribution, skupina Alfa); `ci.yml` jen analyze a testy. Workflow vznikly ze šablon
v `Distribution/workflows`, ale se třemi rozdíly:

- **Modely** stahuje `tools/fetch_models.sh` z `GET /api/models/<jméno>` na backendu
  (stejný app token), pak `make models` ověří sha256. Na JODA leží v
  `~/restyler-api/tgbot/models-restyler/`; nový export tam patří taky.
- **Žádný GitHub Release:** repo je public a IPA/APK nese app token.
- **iOS manual signing** dopisuje CI do Release konfigurace Runneru až při buildu,
  v repu zůstává Automatic, aby fungoval `make run`. Android podepisuje `key.properties`,
  bez něj debug klíčem.

Secrets: ty z `Distribution/scripts/setup-gh-secrets.sh --repo lioilsources/Restyler
--app Restyler --bundle-id com.ol1n.restyler`, plus `RESTYLER_APP_TOKEN`, `RESTYLER_USER`
a ručně `APPSTORE_ISSUER_ID` (Bitwarden má prázdný).

Pás fotobuňky kreslí `package:image` bitmapovým fontem `assets/fonts/strip_font.zip`
(Roboto, Apache 2.0, generuje `tools/make_strip_font.py`), protože vestavěné fonty
nemají českou diakritiku.
