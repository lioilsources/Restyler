#!/usr/bin/env bash
# Builds the gate in profile and reads its results from the phone. iOS goes
# through devicectl: over Wi-Fi `flutter run` often never finds the VM service,
# and the app writes Documents/device_gate.jsonl either way. No end within the
# timeout means the phone killed the app, which is a failed gate.
# Installing replaces the real app under the same bundle id; `make run` restores it.
set -uo pipefail
device=${1:?usage: run.sh <iOS udid or name | Android serial>}
timeout=${GATE_TIMEOUT:-420}
bundle=com.ol1n.restyler
out="build/device_gate/${device// /_}.$(date +%Y%m%d-%H%M%S).jsonl"
mkdir -p "$(dirname "$out")"

finish() {
  cat "$out"
  echo "results: $out"
  if grep -q '"any_pass":true' "$out"; then echo 'GATE PASS'; exit 0; fi
  echo 'GATE FAIL (or the app died)'; exit 1
}

adb=${ANDROID_HOME:-$HOME/Library/Android/sdk}/platform-tools/adb
if "$adb" devices 2>/dev/null | grep -q "^$device[[:space:]]"; then
  flutter build apk --profile -t tools/device_gate/main.dart || exit 1
  "$adb" -s "$device" install -r build/app/outputs/flutter-apk/app-profile.apk || exit 1
  "$adb" -s "$device" logcat -c
  "$adb" -s "$device" shell am start -S -n "$bundle/.MainActivity" >/dev/null
  deadline=$((SECONDS + timeout))
  while [ $SECONDS -lt $deadline ]; do
    "$adb" -s "$device" logcat -d -s flutter:I | sed -n 's/.*GATE //p' >"$out"
    grep -q '"done":true' "$out" && break
    sleep 5
  done
  finish
fi

flutter build ios --profile -t tools/device_gate/main.dart || exit 1
xcrun devicectl device install app --device "$device" build/ios/iphoneos/Runner.app >/dev/null || exit 1
xcrun devicectl device process launch --terminate-existing --device "$device" "$bundle" >/dev/null || exit 1
deadline=$((SECONDS + timeout))
while [ $SECONDS -lt $deadline ]; do
  sleep 10
  xcrun devicectl device copy from --device "$device" \
    --domain-type appDataContainer --domain-identifier "$bundle" \
    --source Documents/device_gate.jsonl --destination "$out" >/dev/null 2>&1
  [ -f "$out" ] && grep -q '"done":true' "$out" && break
done
touch "$out"
finish
