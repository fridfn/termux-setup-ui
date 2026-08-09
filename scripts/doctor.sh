#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🌱 FARID FATHONI N — ENVIRONMENT DOCTOR
# ═══════════════════════════════════════════════════════════════

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

PASS=0
WARN=0
FAIL=0


# ───────────────────────────────────────────────────────────────
# HELPERS
# ───────────────────────────────────────────────────────────────

check_command() {

    local command_name="$1"
    local label="$2"

    if command -v "$command_name" >/dev/null 2>&1; then
        echo "   ✅ $label"
        PASS=$((PASS + 1))
    else
        echo "   ❌ $label"
        FAIL=$((FAIL + 1))
    fi

}


check_file() {

    local file="$1"
    local label="$2"

    if [ -f "$file" ]; then
        echo "   ✅ $label"
        PASS=$((PASS + 1))
    else
        echo "   ⚠️  $label"
        WARN=$((WARN + 1))
    fi

}


check_directory() {

    local directory="$1"
    local label="$2"

    if [ -d "$directory" ]; then
        echo "   ✅ $label"
        PASS=$((PASS + 1))
    else
        echo "   ⚠️  $label"
        WARN=$((WARN + 1))
    fi

}


# ───────────────────────────────────────────────────────────────
# HEADER
# ───────────────────────────────────────────────────────────────

clear

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║                                                          ║"
echo "║              🩺 FARID FATHONI N ENVIRONMENT DOCTOR             ║"
echo "║                                                          ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""


# ───────────────────────────────────────────────────────────────
# SYSTEM
# ───────────────────────────────────────────────────────────────

echo "🖥️  SYSTEM"
echo ""

if [ -n "${PREFIX:-}" ]; then
    echo "   ✅ Termux environment"
    PASS=$((PASS + 1))
else
    echo "   ❌ Termux environment"
    FAIL=$((FAIL + 1))
fi

echo "   Architecture : $(uname -m)"
echo "   Android      : $(getprop ro.build.version.release 2>/dev/null || echo unknown)"
echo "   Termux       : ${TERMUX_VERSION:-unknown}"

echo ""


# ───────────────────────────────────────────────────────────────
# CORE TOOLS
# ───────────────────────────────────────────────────────────────

echo "🧰 CORE TOOLS"
echo ""

check_command git "Git"
check_command curl "curl"
check_command wget "wget"
check_command jq "jq"
check_command ssh "OpenSSH"
check_command zsh "Zsh"

echo ""


# ───────────────────────────────────────────────────────────────
# NODE
# ───────────────────────────────────────────────────────────────

echo "🟢 NODE.JS"
echo ""

if command -v node >/dev/null 2>&1; then

    echo "   ✅ Node.js : $(node -v)"
    PASS=$((PASS + 1))

else

    echo "   ❌ Node.js tidak ditemukan."
    FAIL=$((FAIL + 1))

fi


if command -v npm >/dev/null 2>&1; then

    echo "   ✅ npm      : $(npm -v)"
    PASS=$((PASS + 1))

else

    echo "   ❌ npm tidak ditemukan."
    FAIL=$((FAIL + 1))

fi

echo ""


# ───────────────────────────────────────────────────────────────
# GIT
# ───────────────────────────────────────────────────────────────

echo "🔧 GIT"
echo ""

if command -v git >/dev/null 2>&1; then

    GIT_NAME="$(git config --global user.name 2>/dev/null || true)"
    GIT_EMAIL="$(git config --global user.email 2>/dev/null || true)"

    if [ -n "$GIT_NAME" ]; then
        echo "   ✅ Git name  : $GIT_NAME"
        PASS=$((PASS + 1))
    else
        echo "   ⚠️  Git name belum dikonfigurasi."
        WARN=$((WARN + 1))
    fi

    if [ -n "$GIT_EMAIL" ]; then
        echo "   ✅ Git email : $GIT_EMAIL"
        PASS=$((PASS + 1))
    else
        echo "   ⚠️  Git email belum dikonfigurasi."
        WARN=$((WARN + 1))
    fi

fi

echo ""


# ───────────────────────────────────────────────────────────────
# SSH
# ───────────────────────────────────────────────────────────────

echo "🔐 SSH"
echo ""

check_directory "$HOME/.ssh" "~/.ssh"

if [ -f "$HOME/.ssh/id_ed25519" ]; then
    echo "   ✅ Ed25519 private key"
    PASS=$((PASS + 1))
else
    echo "   ⚠️  Ed25519 private key belum ada."
    WARN=$((WARN + 1))
fi

if [ -f "$HOME/.ssh/id_ed25519.pub" ]; then
    echo "   ✅ Ed25519 public key"
    PASS=$((PASS + 1))
else
    echo "   ⚠️  Ed25519 public key belum ada."
    WARN=$((WARN + 1))
fi

echo ""


# ───────────────────────────────────────────────────────────────
# CONFIGURATION
# ───────────────────────────────────────────────────────────────

echo "🎨 CONFIGURATION"
echo ""

check_file "$HOME/.bashrc" "~/.bashrc"
check_file "$HOME/.profile" "~/.profile"
check_file "$HOME/.zshrc" "~/.zshrc"

check_directory "$HOME/.termux" "~/.termux"

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "   ✅ Oh My Zsh"
    PASS=$((PASS + 1))
else
    echo "   ⚠️  Oh My Zsh belum terpasang."
    WARN=$((WARN + 1))
fi

echo ""


# ───────────────────────────────────────────────────────────────
# SETUP REPOSITORY
# ───────────────────────────────────────────────────────────────

echo "📁 TERMUX SETUP REPOSITORY"
echo ""

check_file "$SCRIPT_DIR/setup.sh" "setup.sh"
check_directory "$SCRIPT_DIR/packages" "packages/"
check_directory "$SCRIPT_DIR/scripts" "scripts/"

echo ""


# ───────────────────────────────────────────────────────────────
# GITHUB SSH
# ───────────────────────────────────────────────────────────────

echo "🌐 GITHUB SSH"
echo ""

if command -v ssh >/dev/null 2>&1 && [ -f "$HOME/.ssh/id_ed25519" ]; then

    echo "   Testing github.com..."

    SSH_OUTPUT="$(ssh -T -o ConnectTimeout=5 -o StrictHostKeyChecking=accept-new git@github.com 2>&1 || true)"

    if echo "$SSH_OUTPUT" | grep -qi "successfully authenticated"; then

        echo "   ✅ GitHub SSH authentication"

        PASS=$((PASS + 1))

    elif echo "$SSH_OUTPUT" | grep -qi "Hi "; then

        echo "   ✅ GitHub SSH authentication"

        PASS=$((PASS + 1))

    else

        echo "   ⚠️  GitHub SSH belum terautentikasi."
        WARN=$((WARN + 1))

    fi

else

    echo "   ⚠️  SSH key belum tersedia."
    WARN=$((WARN + 1))

fi

echo ""


# ───────────────────────────────────────────────────────────────
# SUMMARY
# ───────────────────────────────────────────────────────────────

echo "════════════════════════════════════════════════════════"
echo "🩺 DIAGNOSTIC SUMMARY"
echo "════════════════════════════════════════════════════════"
echo ""

echo "   ✅ Passed  : $PASS"
echo "   ⚠️  Warning : $WARN"
echo "   ❌ Failed  : $FAIL"

echo ""

if [ "$FAIL" -eq 0 ] && [ "$WARN" -eq 0 ]; then

    echo "🌱 FARID FATHONI N environment is healthy."

elif [ "$FAIL" -eq 0 ]; then

    echo "🌱 Environment is functional, but some optional setup"
    echo "   steps still need attention."

else

    echo "⚠️  Some required components are missing."

fi

echo ""
