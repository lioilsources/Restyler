#!/usr/bin/env bash
# Downloads the parser weights into assets/models for a clean clone (CI).
# They are not in git: the repo is public and the files are 265 MB. The
# backend serves them behind the app token; `make models` then checks sha256.
#
#   RESTYLER_APP_TOKEN=… tools/fetch_models.sh
set -euo pipefail

API="${RESTYLER_API_URL:-https://restyler-api.ol1n.com}"
: "${RESTYLER_APP_TOKEN:?RESTYLER_APP_TOKEN is not set}"
cd "$(dirname "$0")/../assets/models"

# Names come from the Makefile, so a new export changes them in one place.
for name in $(grep -oE '[a-z0-9_]+\.fp16\.[0-9a-f]{8}\.onnx' ../../Makefile | sort -u); do
  if [[ -f "$name" ]]; then
    echo "have $name"
    continue
  fi
  echo "fetch $name"
  curl -fsS --retry 3 --retry-all-errors -o "$name.part" \
    -H "Authorization: app $RESTYLER_APP_TOKEN" -H "X-User: ci" \
    "$API/api/models/$name"
  mv "$name.part" "$name"
done
