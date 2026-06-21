#!/usr/bin/env bash
# gutssnv
# drip it
# Usage: bash ~/patch/anu.sh

set -e

RAW_URL="https://raw.githubusercontent.com/gutssnv/patch_anim/main/AnimationUtils.java"
TARGET_REL="frameworks/base/core/java/android/view/animation/AnimationUtils.java"

TARGET="$ANDROID_ROOT/$TARGET_REL"

if [ ! -f "$TARGET" ]; then
    echo "[!] hey, missing your $TARGET is missing!"
    exit 1
fi

# Backup
echo "[*] Backup -> ${TARGET}.bak"
cp "$TARGET" "${TARGET}.bak"

# Replace
echo "[*] replace the target! ..."
curl -fsSL "$RAW_URL" -o "$TARGET"

echo "[+] Done!:"
echo "    $TARGET"
echo ""
echo "[i] revert?:"
echo "    cp \"${TARGET}.bak\" \"$TARGET\""