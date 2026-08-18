#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🌱 FARID FATHONI N — TERMUX STYLE SETUP
# ═══════════════════════════════════════════════════════════════

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

SOURCE="$REPO_DIR/.termux"
DEST="$HOME/.termux"

echo ""
echo "🌱 FARID FATHONI N — TERMUX STYLE"
echo ""

mkdir -p "$DEST"

# ───────────────────────────────────────────────────────────────
# COLORS
# ───────────────────────────────────────────────────────────────

if [ -f "$SOURCE/colors.properties" ]; then
    cp "$SOURCE/colors.properties" "$DEST/colors.properties"
    echo "   ✅ colors.properties installed."
else
    echo "   ⚠️  colors.properties tidak ditemukan."
fi

# ───────────────────────────────────────────────────────────────
# TERMUX PROPERTIES
# ───────────────────────────────────────────────────────────────

if [ -f "$SOURCE/termux.properties" ]; then
    cp "$SOURCE/termux.properties" "$DEST/termux.properties"
    echo "   ✅ termux.properties installed."
else
    echo "   ⚠️  termux.properties tidak ditemukan."
fi

# ───────────────────────────────────────────────────────────────
# FONT
# ───────────────────────────────────────────────────────────────

if [ -f "$SOURCE/font.ttf" ]; then
    cp "$SOURCE/font.ttf" "$DEST/font.ttf"
    echo "   ✅ font.ttf installed."
else
    echo "   ⚠️  font.ttf tidak ditemukan."
fi


if [[ -f "$HOME/.termux/colors.properties" ]]; then
    echo "   Colors       : ✅ Configured"
else
    echo "   Colors       : ❌ Missing"
fi

if [[ -f "$HOME/.termux/font.ttf" ]]; then
    echo "   Font         : ✅ Configured"
else
    echo "   Font         : ❌ Missing"
fi

if pm list packages 2>/dev/null | grep -q "com.termux.styling"; then
    echo "   Styling App  : ✅ Installed"
else
    echo "   Styling App  : ⚪ Optional"
fi

echo ""
echo "✅ Termux style setup selesai."
echo ""
echo "ℹ️  Tutup dan buka kembali Termux untuk menerapkan style."
echo ""
