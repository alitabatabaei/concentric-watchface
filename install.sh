#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

ADB="$(command -v adb || echo /Users/ali/Library/Android/sdk/platform-tools/adb)"

[ -f .env ] && source .env

DEVICE_ARGS=()
[ -n "${ADB_DEVICE_ID:-}" ] && DEVICE_ARGS=(-s "$ADB_DEVICE_ID")

./gradlew assembleDebug
"$ADB" "${DEVICE_ARGS[@]}" install -r app/build/outputs/apk/debug/app-debug.apk
