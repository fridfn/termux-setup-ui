#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🌱 FARID FATHONI N — GIT SETUP
# ═══════════════════════════════════════════════════════════════

set -e

echo ""
echo "🔧 FARID FATHONI N — GIT SETUP"
echo ""

# ───────────────────────────────────────────────────────────────
# CHECK GIT
# ───────────────────────────────────────────────────────────────

if ! command -v git >/dev/null 2>&1; then
    echo "→ Installing Git..."
    pkg install -y git
fi

echo "✅ $(git --version)"
echo ""

# ───────────────────────────────────────────────────────────────
# READ CURRENT IDENTITY
# ───────────────────────────────────────────────────────────────

GIT_NAME="$(git config --global user.name 2>/dev/null || true)"
GIT_EMAIL="$(git config --global user.email 2>/dev/null || true)"

echo "Current Git identity:"
echo ""
echo "  Name  : ${GIT_NAME:-<not configured>}"
echo "  Email : ${GIT_EMAIL:-<not configured>}"
echo ""

# ───────────────────────────────────────────────────────────────
# VALIDATE IDENTITY
# ───────────────────────────────────────────────────────────────

if [ -n "$GIT_NAME" ] && [ -n "$GIT_EMAIL" ]; then

    echo "✅ Git identity sudah dikonfigurasi."
    echo "   → Name  : $GIT_NAME"
    echo "   → Email : $GIT_EMAIL"
    echo ""
    echo "⏩ Git configuration dilewati."

    exit 0
fi

# ───────────────────────────────────────────────────────────────
# CONFIGURE IDENTITY
# ───────────────────────────────────────────────────────────────

echo "⚙️  Git identity belum lengkap."
echo ""

read -p "❓ Mau mengatur Git identity sekarang? (y/n): " choice

if [[ "$choice" =~ ^[Yy]$ ]]; then

    echo ""

    read -p "Git name  : " GIT_NAME
    read -p "Git email : " GIT_EMAIL

    if [ -z "$GIT_NAME" ] || [ -z "$GIT_EMAIL" ]; then
        echo ""
        echo "❌ Name dan email tidak boleh kosong."
        exit 1
    fi

    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"

    echo ""
    echo "✅ Git identity berhasil dikonfigurasi."
    echo ""
    echo "  Name  : $(git config --global user.name)"
    echo "  Email : $(git config --global user.email)"

else

    echo ""
    echo "⏩ Git identity dilewati."

fi

echo ""