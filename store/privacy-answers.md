# Restyler: odpovědi do App Privacy a Data safety

Připravené odpovědi pro App Store Connect (App Privacy) a Google Play Console
(Data safety). Vycházejí z `docs/privacy.html`, `docs/telemetry.md`
a `ios/Runner/PrivacyInfo.xcprivacy`; když se změní jedno, musí se změnit
všechno. Před vyplněním ověř aktuální znění formulářů. Vyplňuje Olin.

Pořadí zapnutí měření: zveřejnit politiku (merge `docs/privacy-telemetry`),
vyplnit oba formuláře, nastavit `TELEMETRY_KEY` a `TELEMETRY_HOST`, vydat.

Appka posílá dvě věci:

1. **Render**: jednu fotku (zmenšenou, bez metadat), masky a popis kroků na
   vlastní render server. Server je ukládá, zatím bez automatického mazání.
   Všechny kopie appky se hlásí stejným tokenem, uživatele server nerozlišuje.
2. **Anonymní statistiky** (`docs/telemetry.md`): události používání, časy
   analýzy a čekání na render, země odvozená z připojení na straně příjemce.
   Bez identifikátoru, vypínatelné v appce, uchování 12 měsíců.

## App Store Connect: App Privacy

Data used to track you: **No**. Žádný typ dat se nepoužívá ke sledování.

| Typ dat | Collected | Linked to user | Tracking | Účel |
|---|---|---|---|---|
| User Content → **Photos or Videos** | Yes | No | No | App Functionality |
| Usage Data → **Product Interaction** | Yes | No | No | Analytics |
| Diagnostics → **Performance Data** | Yes | No | No | Analytics |
| Location → **Coarse Location** | Yes | No | No | Analytics |

Poznámky:

- Coarse Location: appka polohu nečte. Příjemce statistik ukládá zemi
  odvozenou z IP adresy (IP neukládá). Apple to bere jako hrubou polohu.
- Performance Data: čas analýzy selfie v telefonu (`analyse_end.secs`)
  a čekání na render (`restyle_end.secs`, `wait_secs`).
- Nic dalšího se nesbírá: žádný kontakt, identifikátor, nákup, crash log
  ani obsah mimo vybranou fotku.

## Google Play: Data safety

- Does your app collect or share any of the required user data types? **Yes**
- Is all of the user data collected by your app encrypted in transit? **Yes** (HTTPS)
- Do you provide a way for users to request that their data is deleted?
  **Yes**: e-mailem na adresu z politiky (fotky na serveru). Statistiky
  nejsou spojené s osobou, mažou se po 12 měsících a vypnutí smaže frontu
  v telefonu.

| Kategorie → typ | Collected | Shared | Ephemeral | Required / optional | Účel |
|---|---|---|---|---|---|
| Photos and videos → **Photos** | Yes | No | No | Required (bez fotky render nejde) | App functionality |
| App activity → **App interactions** | Yes | No | No | Optional (vypínač v appce) | Analytics |
| App info and performance → **Diagnostics** | Yes | No | No | Optional | Analytics |
| Location → **Approximate location** | Yes | No | No | Optional | Analytics |

Poznámky:

- Shared = No: render server i příjemce statistik provozuje vývojář sám.
  Cloudflare je jen přenos (service provider), Google to za sdílení nepovažuje.
- Approximate location: jen země odvozená příjemcem, appka polohu nečte.

## Mimo repo, co se musí změnit

- App Store Connect → App Privacy (tabulka výše).
- Google Play Console → Data safety (tabulka výše).
- Stránka appky na olin.now (`olin.now/restyler`, repo `ol1n.now`,
  `apps/restyler/`): k 14. 11. 2026 netvrdí, že appka nic neposílá nebo
  nesbírá analytiku, takže přepis není potřeba. Při každé úpravě textů
  ověřit znovu; „bez reklam, bez účtu, bez analytiky třetích stran“ zůstává
  pravda.
