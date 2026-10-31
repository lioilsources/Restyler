.PHONY: run debug build-ios build-android analyze test

-include .env.local

DART_DEFINES = \
	--dart-define=CF_ACCESS_CLIENT_ID=$(CF_ACCESS_CLIENT_ID) \
	--dart-define=CF_ACCESS_CLIENT_SECRET=$(CF_ACCESS_CLIENT_SECRET) \
	--dart-define=RESTYLER_APP_TOKEN=$(RESTYLER_APP_TOKEN) \
	--dart-define=RESTYLER_USER=$(RESTYLER_USER)

run:
	flutter run --release $(DART_DEFINES)

# RESTYLER_API_URL only here: a LAN backend must not reach a release build.
debug:
	flutter run $(DART_DEFINES) \
		$(if $(RESTYLER_API_URL),--dart-define=RESTYLER_API_URL=$(RESTYLER_API_URL),)

build-ios:
	flutter build ipa --release \
		--export-options-plist=ios/ExportOptions.plist \
		$(DART_DEFINES)

build-android:
	flutter build apk --release \
		$(DART_DEFINES)

analyze:
	flutter analyze

test:
	flutter test
