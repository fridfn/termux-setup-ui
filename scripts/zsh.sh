#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🌱 FARID FATHONI N — ZSH SETUP
# ═══════════════════════════════════════════════════════════════

set -e

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"

ZSH="$HOME/.oh-my-zsh"
CUSTOM="$ZSH/custom"

echo ""
echo "🌱 FARID FATHONI N — ZSH"
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
# FARID FATHONI N CLEAR HOOK
# ───────────────────────────────────────────────────────────────

BANNER="$REPO_DIR/scripts/banner.sh"
ZSHRC="$HOME/.zshrc"

if [ -f "$BANNER" ]; then

    # Hapus hook lama jika ada
    sed -i '/# FARID FATHONI N_CLEAR_HOOK_START/,/# FARID FATHONI N_CLEAR_HOOK_END/d' "$ZSHRC"

    cat >> "$ZSHRC" <<EOF

# ───────────────────────────────────────────────────────────────
# 🌱 FARID FATHONI N CLEAR HOOK
# ───────────────────────────────────────────────────────────────
# FARID FATHONI N_CLEAR_HOOK_START

function clear() {
    command clear
    bash "$BANNER"
}

# FARID FATHONI N_CLEAR_HOOK_END
EOF

    echo "✅ FARID FATHONI N clear hook installed."

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

# ═══════════════════════════════════════════════════════════
# FARID FATHONI N ZSH CONFIG
# ═══════════════════════════════════════════════════════════

ZSH_CONFIG_SOURCE="$REPO_DIR/config/zsh"
ZSH_CONFIG_DEST="$HOME/.config/zsh"

echo "⚙️  Installing FARID FATHONI N Zsh configuration..."

# Validate source directory
if [[ ! -d "$ZSH_CONFIG_SOURCE" ]]; then
    echo "❌ Zsh config directory tidak ditemukan:"
    echo "   $ZSH_CONFIG_SOURCE"
    exit 1
fi

# Create destination directory
mkdir -p "$ZSH_CONFIG_DEST"

# Required configuration files
for file in aliases.zsh functions.zsh environment.zsh; do
    if [[ ! -f "$ZSH_CONFIG_SOURCE/$file" ]]; then
        echo "❌ Missing Zsh configuration:"
        echo "   $ZSH_CONFIG_SOURCE/$file"
        exit 1
    fi

    cp "$ZSH_CONFIG_SOURCE/$file" "$ZSH_CONFIG_DEST/$file"
done

echo "✅ FARID FATHONI N Zsh configuration installed."
echo "   📁 $ZSH_CONFIG_DEST"
echo "      ├── aliases.zsh"
echo "      ├── functions.zsh"
echo "      └── environment.zsh"


# ═══════════════════════════════════════════════════════════
# ZSH LOADER
# ═══════════════════════════════════════════════════════════

install_zsh_loader() {
    local loader='# FARID FATHONI N ZSH CONFIG'

    if ! grep -q "$loader" "$ZSHRC" 2>/dev/null; then

        cat >> "$ZSHRC" <<'EOF'

# ═══════════════════════════════════════════════════════════
# FARID FATHONI N ZSH CONFIG
# ═══════════════════════════════════════════════════════════

[[ -f ~/.config/zsh/environment.zsh ]] && source ~/.config/zsh/environment.zsh
[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh

EOF

        echo "   ✅ Zsh loader configured"

    else

        echo "   ℹ️  Zsh loader already configured"

    fi
}

install_zsh_loader