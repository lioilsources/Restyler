SHELL := /bin/bash

.PHONY: models run debug build-ios build-android analyze test

-include .env.local

DART_DEFINES = \
	--dart-define=CF_ACCESS_CLIENT_ID=$(CF_ACCESS_CLIENT_ID) \
	--dart-define=CF_ACCESS_CLIENT_SECRET=$(CF_ACCESS_CLIENT_SECRET) \
	--dart-define=RESTYLER_APP_TOKEN=$(RESTYLER_APP_TOKEN) \
	--dart-define=RESTYLER_USER=$(RESTYLER_USER)

# Parser weights are not in git: export them (MangaPrompts/tools/ondevice) and
# put them in assets/models under these names. A build without them would fail
# on the first selfie, so every build checks them first.
models:
	@cd assets/models && shasum -a 256 -c --quiet - <<< "$$(printf '%s  %s\n' \
		46e77905e5914992243628132ec12635bfc224bcd903a0de3fa122f0e0e5c4d9 face_b5.fp16.46e77905.onnx \
		bd5f9568081ef0d297e4bbc15106e8a8d6130bebbc87b9a496d256417c6a2e55 clothes_b2.fp16.bd5f9568.onnx)"

run: models
	flutter run --release $(DART_DEFINES)

# RESTYLER_API_URL only here: a LAN backend must not reach a release build.
debug: models
	flutter run $(DART_DEFINES) \
		$(if $(RESTYLER_API_URL),--dart-define=RESTYLER_API_URL=$(RESTYLER_API_URL),)

build-ios: models
	flutter build ipa --release \
		--export-options-plist=ios/ExportOptions.plist \
		$(DART_DEFINES)

build-android: models
	flutter build apk --release \
		$(DART_DEFINES)

analyze:
	flutter analyze

test:
	flutter test
