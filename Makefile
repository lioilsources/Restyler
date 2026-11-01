SHELL := /bin/bash

.PHONY: models run debug device-gate build-ios build-android analyze test

-include .env.local

DART_DEFINES = \
	--dart-define=CF_ACCESS_CLIENT_ID=$(CF_ACCESS_CLIENT_ID) \
	--dart-define=CF_ACCESS_CLIENT_SECRET=$(CF_ACCESS_CLIENT_SECRET) \
	--dart-define=RESTYLER_APP_TOKEN=$(RESTYLER_APP_TOKEN) \
	--dart-define=RESTYLER_USER=$(RESTYLER_USER)

# Parser weights are not in git: the repo is public and they are too large.
# A build without them would fail on the first selfie, so every build checks
# them and a clean clone fetches them from SPARK. The export is reproducible
# (MangaPrompts/tools/ondevice with its pinned versions gives the same bytes).
MODELS_REMOTE ?= sync-spark-99bb:deploy/restyler-models
MODEL_FILES = face_b5.fp16.46e77905.onnx clothes_b2.fp16.bd5f9568.onnx

models:
	@for f in $(MODEL_FILES); do \
		[ -f assets/models/$$f ] || rsync -a --progress $(MODELS_REMOTE)/$$f assets/models/ || exit 1; \
	done
	@cd assets/models && shasum -a 256 -c --quiet - <<< "$$(printf '%s  %s\n' \
		46e77905e5914992243628132ec12635bfc224bcd903a0de3fa122f0e0e5c4d9 face_b5.fp16.46e77905.onnx \
		bd5f9568081ef0d297e4bbc15106e8a8d6130bebbc87b9a496d256417c6a2e55 clothes_b2.fp16.bd5f9568.onnx)"

run: models
	flutter run --release $(DART_DEFINES)

# RESTYLER_API_URL only here: a LAN backend must not reach a release build.
debug: models
	flutter run $(DART_DEFINES) \
		$(if $(RESTYLER_API_URL),--dart-define=RESTYLER_API_URL=$(RESTYLER_API_URL),)

# Parser on a real phone, no server needed: `make device-gate DEVICE=i13mini`.
device-gate: models
	tools/device_gate/run.sh "$(DEVICE)"

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
