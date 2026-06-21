#!/usr/bin/env bash
# brought to you by gutssnv
# unemployed final boss
# Usage: bash ~/patch/anu.sh

set -e

RAW_URL="https://raw.githubusercontent.com/gutssnv/patch_anim/main/AnimationUtils.java"
TARGET_REL="frameworks/base/core/java/android/view/animation/AnimationUtils.java"

TARGET="$ANDROID_BUILD_TOP/$TARGET_REL"
BACKUP="$HOME/patch/AnimationUtils.java.bak"

if [ ! -f "$TARGET" ]; then
    echo "[!] hey bastard, your $TARGET is missing!"
    exit 1
fi

# Backup
echo "[*] Backup -> $BACKUP"
cp "$TARGET" "$BACKUP"

# Replace
echo "[*] replace the target! ..."
curl -fsSL "$RAW_URL" -o "$TARGET"

echo "[+] Done!:"
echo "    $TARGET"
echo ""
echo "[i] revert?:"
echo "    cp \"$BACKUP\" \"$TARGET\""
