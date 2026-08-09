#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🌱 AURIELLE — NODE.JS LTS
# ═══════════════════════════════════════════════════════════════

set -u

echo ""
echo "🟢 AURIELLE — NODE.JS LTS"
echo ""

if command -v node >/dev/null 2>&1; then

    echo "✅ Node.js sudah tersedia."
    echo "   Node : $(node -v)"

    if command -v npm >/dev/null 2>&1; then
        echo "   npm  : $(npm -v)"
    fi

    exit 0
fi


echo "📦 Node.js belum tersedia."
echo ""
echo "Installing nodejs-lts..."
echo ""

if pkg install -y nodejs-lts; then

    echo ""
    echo "✅ Node.js LTS installed."
    echo ""
    echo "Node : $(node -v)"
    echo "npm  : $(npm -v)"

else

    echo ""
    echo "❌ Failed to install Node.js LTS."
    exit 1

fi
