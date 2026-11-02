# Test na reálném telefonu

## 1. Parser, bez serveru: hotovo na iPhonu 12 mini

```sh
make device-gate DEVICE=<udid>   # telefon odemčený, displej rozsvícený
```

Přehraje appku na telefonu měřicí verzí (stejné bundle id), `make run` ji vrátí.

Měřeno 2026-11-01, iPhone 12 mini (4 GB), iOS 27.0.1, profile build, 832×1216:

| provider | parse, medián | první běh s rozbalením | shoda face / clothes s PyTorchem | špička RSS |
|---|---|---|---|---|
| CPU | 5.5 s | 6.2 s | 0.99996 / 0.99997 | 1195 MB |
| CoreML + CPU | 5.7 s | 5.8 s | 0.99996 / 0.99997 | 1195 MB |

- Dvě session držené naráz a ORT aréna: Jetsam na limitu 2200 MB. Proto parser
  načítá modely po jednom, bez arény, a po běhu je zavírá.
- CoreML nezrychlil a mapy jsou shodné do posledního pixelu. Nejspíš běží na CPU;
  rozdělení grafu nikdo neověřil. Zůstává CPU.
- Strop plánu 3 s neprošel. Menší model B0 neprošel paritou
  (`MangaPrompts/docs/ondevice-parity.md`), takže brána je teď 8 s: parse běží
  jednou na selfie.
Pixel 8a, Android 16 (CP3A.261005.005), profile build, 2026-11-02:

| provider | parse, medián | první běh s rozbalením | shoda face / clothes s PyTorchem | špička RSS |
|---|---|---|---|---|
| CPU | 7.9 s | 9.7 s | 0.99965 / 0.99970 | 1130 MB |
| NNAPI + CPU | 8.7 s | 8.6 s | 0.99965 / 0.99970 | 1130 MB |

- Android ORT 1.28 fúzuje erf GELU do `com.microsoft.Gelu`, který na CPU umí jen
  float: s fp16 se session nenačte (ORT_NOT_IMPLEMENTED). Na Androidu jsou fúze
  GELU vypnuté (`optimization.disable_specified_optimizers`).
- Release build: R8 přejmenoval `ai.onnxruntime` a první chyba ORT shodila appku
  přes JNI (`java_class == null`). Keep pravidla v `android/app/proguard-rules.pro`.
- 7.9 s je těsně pod branou 8 s. Nezměřeno: 13 mini, rozdělení času mezi načtení a běh.

## 2. Selfie v appce, bez serveru

`make run` (stačí prázdné `.env.local`, render bez backendu skončí chybou).

- [ ] selfie z přední kamery: maska a odhad barvy vlasů odpovídají
- [ ] fotka z galerie na šířku, otočená EXIFem: tvář je rovně
- [ ] HEIC z galerie: projde, nebo srozumitelná chyba
- [ ] při parsování je vidět průběh a appka nezamrzne
- [ ] druhé selfie hned po prvním: bez pádu
- [ ] vymazání cache: modely se rozbalí znovu

## 3. Celá cesta, po nasazení serveru

Předpoklad: `curl https://restyler-api.ol1n.com/healthz` projde přes Access a
`.env.local` je vyplněné.

- [ ] vlasy + 1 styl: poll, stažení, rámečky v pásu
- [ ] zamknout telefon během renderu: po návratu pokračuje
- [ ] režim letadlo po doběhnutí: projekt, pás i sdílení fungují
- [ ] `RenderJob.cost` sedí s poklesem v `/api/me`
- [ ] skip jednoho kroku: job skončí podle `status`
