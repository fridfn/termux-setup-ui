#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🌱 AURIELLE — ZSH SETUP
# ═══════════════════════════════════════════════════════════════

set -e

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"

ZSH="$HOME/.oh-my-zsh"
CUSTOM="$ZSH/custom"

echo ""
echo "🌱 AURIELLE — ZSH"
echo ""


# ───────────────────────────────────────────────────────────────
# INSTALL ZSH
# ───────────────────────────────────────────────────────────────

if ! command -v zsh >/dev/null 2>&1; then
    echo "→ Installing Zsh..."
    pkg install -y zsh
else
    echo "✅ Zsh sudah tersedia."
fi


# ───────────────────────────────────────────────────────────────
# OH MY ZSH
# ───────────────────────────────────────────────────────────────

if [ ! -d "$ZSH" ]; then

    echo "→ Installing Oh My Zsh..."

    RUNZSH=no
    CHSH=no

    export RUNZSH
    export CHSH

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

else

    echo "✅ Oh My Zsh sudah tersedia."

fi


# ───────────────────────────────────────────────────────────────
# CUSTOM DIRECTORIES
# ───────────────────────────────────────────────────────────────

mkdir -p "$CUSTOM/plugins"
mkdir -p "$CUSTOM/themes"


# ───────────────────────────────────────────────────────────────
# ZSH AUTOSUGGESTIONS
# ───────────────────────────────────────────────────────────────

AUTOSUGGESTIONS="$CUSTOM/plugins/zsh-autosuggestions"

if [ ! -f "$AUTOSUGGESTIONS/zsh-autosuggestions.zsh" ]; then

    echo "→ Installing zsh-autosuggestions..."

    rm -rf "$AUTOSUGGESTIONS"

    git clone \
        https://github.com/zsh-users/zsh-autosuggestions \
        "$AUTOSUGGESTIONS"

else

    echo "✅ zsh-autosuggestions sudah tersedia."

fi

# ───────────────────────────────────────────────────────────────
# ZSH SYNTAX HIGHLIGHTING
# ───────────────────────────────────────────────────────────────

SYNTAX_HIGHLIGHTING="$CUSTOM/plugins/zsh-syntax-highlighting"

if [ ! -f "$SYNTAX_HIGHLIGHTING/zsh-syntax-highlighting.zsh" ]; then

    echo "→ Installing zsh-syntax-highlighting..."

    rm -rf "$SYNTAX_HIGHLIGHTING"

    git clone \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$SYNTAX_HIGHLIGHTING"

else

    echo "✅ zsh-syntax-highlighting sudah tersedia."

fi


# ───────────────────────────────────────────────────────────────
# COPY CUSTOM THEME
# ───────────────────────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

THEME_SOURCE="$REPO_DIR/oh-my-zsh-custom/themes/exfavorite.zsh-theme"
THEME_DEST="$CUSTOM/themes/exfavorite.zsh-theme"

if [ -f "$THEME_SOURCE" ]; then

    mkdir -p "$CUSTOM/themes"

    cp "$THEME_SOURCE" "$THEME_DEST"

    echo "✅ ExFavorite theme installed."

else

    echo "⚠️  ExFavorite theme tidak ditemukan:"
    echo "   $THEME_SOURCE"

fi

# ───────────────────────────────────────────────────────────────
# COPY ZSH CONFIGURATION
# ───────────────────────────────────────────────────────────────

ZSHRC_SOURCE="$REPO_DIR/.zshrc"
ZSHRC_DEST="$HOME/.zshrc"

if [ -f "$ZSHRC_SOURCE" ]; then

    cp "$ZSHRC_SOURCE" "$ZSHRC_DEST"

    echo "✅ .zshrc installed."

else

    echo "⚠️  .zshrc tidak ditemukan:"
    echo "   $ZSHRC_SOURCE"

fi

# ───────────────────────────────────────────────────────────────
# AURIELLE CLEAR HOOK
# ───────────────────────────────────────────────────────────────

BANNER="$REPO_DIR/scripts/banner.sh"
ZSHRC="$HOME/.zshrc"

if [ -f "$BANNER" ]; then

    # Hapus hook lama jika ada
    sed -i '/# AURIELLE_CLEAR_HOOK_START/,/# AURIELLE_CLEAR_HOOK_END/d' "$ZSHRC"

    cat >> "$ZSHRC" <<EOF

# ───────────────────────────────────────────────────────────────
# 🌱 AURIELLE CLEAR HOOK
# ───────────────────────────────────────────────────────────────
# AURIELLE_CLEAR_HOOK_START

function clear() {
    command clear
    bash "$BANNER"
}

# AURIELLE_CLEAR_HOOK_END
EOF

    echo "✅ Aurielle clear hook installed."

else

    echo "⚠️  banner.sh tidak ditemukan:"
    echo "   $BANNER"

fi

# ───────────────────────────────────────────────────────────────
# SET DEFAULT SHELL
# ───────────────────────────────────────────────────────────────

if command -v zsh >/dev/null 2>&1; then
    if command -v chsh >/dev/null 2>&1; then
        echo "→ Setting Zsh sebagai default shell..."
        chsh -s zsh 2>/dev/null || true
    fi
fi


echo ""
echo "✅ Zsh setup selesai."
echo ""