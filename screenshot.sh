#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

ADB="$(command -v adb || echo /Users/ali/Library/Android/sdk/platform-tools/adb)"

[ -f .env ] && source .env

DEVICE_ARGS=()
[ -n "${ADB_DEVICE_ID:-}" ] && DEVICE_ARGS=(-s "$ADB_DEVICE_ID")

OUT="${1:-screenshot-$(date +%Y%m%d-%H%M%S).png}"

"$ADB" "${DEVICE_ARGS[@]}" exec-out screencap -p > "$OUT"
echo "Saved $OUT"
