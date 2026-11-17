# Release Restyleru

Tag `vX.Y.Z` na `main` spustí:

- `release-ios.yml`: build s ručním podpisem a nahrání do TestFlightu.
- `release-android.yml`: podepsané APK do Firebase App Distribution (skupina Alfa)
  a jako `restyler-vX.Y.Z.apk` na GitHub Release, kam vede tlačítko na olin.now.
  APK nese app token a je veřejné, vlastník to tak chtěl (11/2026). IPA na
  release nejde.

Verze se bere z tagu, build number z čísla běhu. `pubspec.yaml` se nemění.
`ci.yml` dělá jen analyze a testy.

## Rozdíly proti šablonám z `Distribution/workflows`

- **Modely** stahuje `tools/fetch_models.sh` z `GET /api/models/<jméno>` na backendu
  (stejný app token), pak `make models` ověří sha256. Na JODA leží v
  `~/restyler-api/tgbot/models-restyler/`; nový export tam patří taky
  (víc v [models.md](models.md)).
- **GitHub Release jen s APK** (`restyler-<tag>.apk`), viz výše.
- **iOS manual signing** dopisuje CI do Release konfigurace Runneru až při buildu,
  v repu zůstává Automatic, aby fungoval `make run`. Android podepisuje `key.properties`,
  bez něj debug klíčem.

## Identita

- Bundle id / applicationId: `com.ol1n.restyler`, bez App Group a bez extensions.
- Modely ONNX nejsou v gitu: CI je stahuje `tools/fetch_models.sh` z backendu,
  `make models` ověří sha256. Nový export patří na SPARK i na JODU (viz CLAUDE.md).

## Ruční kroky v účtech

1. Apple: App ID `com.ol1n.restyler`, distribuční profil App Store a appka
   v App Store Connect. Profil uložit do složky appky, kterou čte
   `Distribution/scripts/setup-gh-secrets.sh`.
2. Firebase: Android appka `com.ol1n.restyler`, skupina testerů Alfa.
3. Secrets: `Distribution/scripts/setup-gh-secrets.sh --repo lioilsources/Restyler
   --app Restyler --bundle-id com.ol1n.restyler`. K tomu ručně `RESTYLER_APP_TOKEN`,
   `RESTYLER_USER` a `APPSTORE_ISSUER_ID` (v Bitwardenu je prázdný).
4. App Store Connect a Google Play:
   - Privacy Policy URL: `https://lioilsources.github.io/Restyler/privacy.html`
   - Support URL: `https://lioilsources.github.io/Restyler/support.html`
   - Marketing URL: `https://olin.now/restyler`

## Po releasu

Store olin.now (repo `ol1n.now`): `make fetch`, `make build`, `make deploy`.
Deploy jen spouští CI, na větev `gh-pages` se nepushuje.

## Stránky

`docs/index.html`, `privacy.html`, `support.html` a `icon.png` jdou přes GitHub
Pages z `main /docs`. Zásady popisují, co build opravdu posílá. Při změně toho,
co jde na server, nebo jak dlouho tam data zůstávají, je uprav taky.
