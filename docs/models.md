# Modely (on-device parsing)

SegFormer ve fp16, nikdy int8 (pod CoreML EP dává špatný výstup):

| soubor | velikost | výstup |
|---|---|---|
| `face_b5.fp16.<sha8>.onnx` | 170.5 MB | `logits` 1×19×128×128 |
| `clothes_b2.fp16.<sha8>.onnx` | 95.2 MB | `logits` 1×18×128×128 |

Zdroj a export: `MangaPrompts/tools/ondevice/`; export s jeho připnutými verzemi je
reprodukovatelný na bajt. Váhy jsou assety v `assets/models/`, do gitu nepatří
(`.gitignore`, repo je veřejné a licence vah není jasná). CI je bere z backendu
(`tools/fetch_models.sh`, viz [release.md](release.md)), lokální `make models` chybějící soubory
stáhne rsyncem ze SPARKu (`~/deploy/restyler-models/`, `MODELS_REMOTE`), ověří sha256
a každý build přes Makefile ho volá. Při běhu je plugin
(`createSessionFromAsset`) přes `rootBundle` rozbalí do tmp a po vymazání je rozbalí
znovu, takže na disku jsou dvakrát. Nový export znamená nový otisk i jméno
v `lib/services/onnx_face_parser.dart`, v `Makefile` a nový soubor na SPARKu i na JODĚ.

Runtime `flutter_onnxruntime` 1.9.0 si vynucuje iOS 16, statické pody
(`use_frameworks! :linkage => :static`) a `enable-swift-package-manager: false`.
