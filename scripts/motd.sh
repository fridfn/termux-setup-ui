#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🌱 FARID FATHONI N — MOTD SETUP
# ═══════════════════════════════════════════════════════════════

set -e

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"

MOTD_PATH="$PREFIX/etc/motd"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BANNER="$SCRIPT_DIR/banner.sh"

UPDATE_SCRIPT="$HOME/update_motd.sh"


echo ""
echo "🌱 FARID FATHONI N — MOTD SETUP"
echo ""


# ───────────────────────────────────────────────────────────────
# CHECK BANNER
# ───────────────────────────────────────────────────────────────

if [ ! -f "$BANNER" ]; then

    echo "❌ banner.sh tidak ditemukan:"
    echo "   $BANNER"

    exit 1

fi


# ───────────────────────────────────────────────────────────────
# CREATE MOTD UPDATE SCRIPT
# ───────────────────────────────────────────────────────────────

cat > "$UPDATE_SCRIPT" <<EOF
#!/data/data/com.termux/files/usr/bin/bash

PREFIX="\${PREFIX:-/data/data/com.termux/files/usr}"

MOTD_PATH="\$PREFIX/etc/motd"

BANNER="$BANNER"

if [ -f "\$BANNER" ]; then
    bash "\$BANNER" > "\$MOTD_PATH"
fi
EOF

chmod +x "$UPDATE_SCRIPT"

echo "   ✅ Created ~/update_motd.sh"


# ───────────────────────────────────────────────────────────────
# GENERATE MOTD
# ───────────────────────────────────────────────────────────────

echo "   → Generating MOTD..."

if bash "$UPDATE_SCRIPT"; then
    echo "   ✅ MOTD generated successfully."
else
    echo "   ⚠️  Failed to generate MOTD."
fi


# ───────────────────────────────────────────────────────────────
# RESULT
# ───────────────────────────────────────────────────────────────

echo ""
echo "   MOTD      : $MOTD_PATH"
echo "   Generator : $UPDATE_SCRIPT"
echo ""