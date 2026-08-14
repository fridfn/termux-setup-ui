#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🌱 — TERMUX ENVIRONMENT SETUP
#
# Version : 2.0
#
# Purpose:
#   Prepare a clean Termux environment for.
#
# source code lives in a separate repository.
# This repository ONLY manages the Termux environment.
# ═══════════════════════════════════════════════════════════════

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PACKAGES="$SCRIPT_DIR/scripts/packages.sh"
NODE="$SCRIPT_DIR/scripts/node.sh"
GIT="$SCRIPT_DIR/scripts/git.sh"
SSH="$SCRIPT_DIR/scripts/ssh.sh"
ZSH="$SCRIPT_DIR/scripts/zsh.sh"
MOTD="$SCRIPT_DIR/scripts/motd.sh"
DOCTOR="$SCRIPT_DIR/scripts/doctor.sh"
TERMUX_STYLE="$SCRIPT_DIR/scripts/termux-style.sh"

# ───────────────────────────────────────────────────────────────
# ENVIRONMENT CHECK
# ───────────────────────────────────────────────────────────────

if [ -z "${PREFIX:-}" ]; then

    echo ""
    echo "❌ This script must be executed inside Termux."
    echo ""

    exit 1

fi


# ───────────────────────────────────────────────────────────────
# HEADER
# ───────────────────────────────────────────────────────────────

clear

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║                                                          ║"
echo "║              🌱 TERMUX SETUP                   ║"
echo "║                                                          ║"
echo "║                  Environment v2.0                        ║"
echo "║                                                          ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

echo "📁 Repository : $SCRIPT_DIR"
echo "📱 Android    : $(getprop ro.build.version.release 2>/dev/null || echo unknown)"
echo "🏗️  Arch       : $(uname -m)"
echo "🧪 Termux     : ${TERMUX_VERSION:-unknown}"
echo ""


# ───────────────────────────────────────────────────────────────
# UPDATE
# ───────────────────────────────────────────────────────────────

update_termux() {

    echo ""
    echo "🌱 Updating Termux..."
    echo ""

    if pkg update -y && pkg upgrade -y; then

        echo ""
        echo "✅ Termux updated."

    else

        echo ""
        echo "⚠️  Update failed."

    fi

}


# ───────────────────────────────────────────────────────────────
# PROJECT
# ───────────────────────────────────────────────────────────────

setup_project_workspace() {
    echo
    echo "🌱 Project Workspace"
    echo

    bash "$SCRIPT_DIR/project/setup.sh"
}


# ───────────────────────────────────────────────────────────────
# MENU
# ───────────────────────────────────────────────────────────────

while true; do

    echo ""
    echo "════════════════════════════════════════════════════════"
    echo "🌱 SETUP MENU"
    echo "════════════════════════════════════════════════════════"
    echo ""
    echo "  [1] Update / upgrade Termux"
    echo ""
    echo "  [2] Install Core packages"
    echo "  [3] Install Development packages"
    echo "  [4] Install Optional packages"
    echo "  [5] Install Server packages"
    echo ""
    echo "  [6] Setup Node.js LTS"
    echo "  [7] Setup Git"
    echo "  [8] Setup SSH / GitHub"
    echo "  [9] Setup Zsh, Termux Style & configuration"
    echo ""
    echo "  [D] Run environment doctor"
    echo "  [P] Setup Project Workspace"
    echo "  [A] Recommended setup"
    echo "  [T] Setup Termux style"
    echo "  [0] Exit"
    echo ""

    read -p "Choose: " choice

    case "$choice" in

        1)
            update_termux
            ;;

        2)
            bash "$PACKAGES" core
            ;;

        3)
            bash "$PACKAGES" dev
            ;;

        4)
            bash "$PACKAGES" optional
            ;;

        5)
            bash "$PACKAGES" server
            ;;

        6)
            bash "$NODE"
            ;;

        7)
            bash "$GIT"
            ;;

        8)
            bash "$SSH"
            ;;

        9)
            echo "🌱 Configuring Zsh..."
            bash "$ZSH"
            
            echo ""
            echo "🌱 Configuring Termux style..."
            bash "$TERMUX"
            
            echo ""
            echo "🌱 Configuring MOTD..."
            bash "$MOTD"
            ;;

        [[Aa])
            echo ""
            echo "🚀 Running recommended environment setup..."
            echo ""

            # ───────────────────────────────────────────────
            # CORE ENVIRONMENT
            # ───────────────────────────────────────────────

            bash "$PACKAGES" core


            # ───────────────────────────────────────────────
            # NODE.JS LTS
            # ───────────────────────────────────────────────

            bash "$NODE"


            # ───────────────────────────────────────────────
            # GIT
            # ───────────────────────────────────────────────

            bash "$GIT"


            # ───────────────────────────────────────────────
            # SSH / GITHUB
            # ───────────────────────────────────────────────

            bash "$SSH"


            # ───────────────────────────────────────────────
            # ZSH + OH MY ZSH + PLUGINS + THEME
            # ───────────────────────────────────────────────

            bash "$ZSH"
            
            # ───────────────────────────────────────────────
            # TERMUX STYLE CONFIG
            # ───────────────────────────────────────────────

            bash "$TERMUX_STYLE"


            # ───────────────────────────────────────────────
            # MOTD
            # ───────────────────────────────────────────────

            echo ""
            echo "🌱 Configuring MOTD..."
            bash "$MOTD"


            # ───────────────────────────────────────────────
            # FINAL
            # ───────────────────────────────────────────────

            echo ""
            echo "════════════════════════════════════════════════════════"
            echo "✅ Recommended environment ready."
            echo "════════════════════════════════════════════════════════"
            echo ""

            ;;
            
        [Dd])
            bash "$SCRIPT_DIR/scripts/doctor.sh"
            ;;
        [Tt])
            bash "$TERMUX_STYLE"
            ;;
        [Pp])
            setup_project_workspace
            ;;
        0)
            echo ""
            echo "👋 Leaving setup."
            echo ""
            exit 0
            ;;

        *)
            echo ""
            echo "⚠️  Invalid option."
            ;;

    esac

done

