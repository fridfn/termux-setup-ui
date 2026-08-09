#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🌱 FARID FATHONI N TERMUX SETUP
# Package Installer
# ═══════════════════════════════════════════════════════════════

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PACKAGES_DIR="$SCRIPT_DIR/packages"


# ───────────────────────────────────────────────────────────────
# INSTALL PACKAGE FILE
# ───────────────────────────────────────────────────────────────

install_package_file() {

    local file="$1"
    local label="$2"

    if [ ! -f "$file" ]; then
        echo ""
        echo "⚠️  Package manifest tidak ditemukan:"
        echo "   $file"
        return 1
    fi

    echo ""
    echo "════════════════════════════════════════════════════════"
    echo "📦 $label"
    echo "════════════════════════════════════════════════════════"
    echo ""

    local total=0
    local success=0
    local failed=0

    while IFS= read -r package || [[ -n "$package" ]]; do

        # Skip empty line
        [[ -z "$package" ]] && continue

        # Skip comments
        [[ "$package" =~ ^[[:space:]]*# ]] && continue

        # Remove whitespace
        package="$(echo "$package" | xargs)"

        # Prevent legacy format:
        # nodejs/now
        # git/now
        # clang/stable,now
        package="${package%%/*}"

        # Validate package name
        if [[ ! "$package" =~ ^[a-zA-Z0-9.+_-]+$ ]]; then
            echo "⚠️  Invalid package: $package"
            continue
        fi

        total=$((total + 1))

        echo "→ Installing $package..."

        if pkg install -y "$package"; then
            echo "   ✅ OK"
            success=$((success + 1))
        else
            echo "   ⚠️  FAILED — skipped"
            failed=$((failed + 1))
        fi

        echo ""

    done < "$file"

    echo "────────────────────────────────────────────────────────"
    echo "📊 $label result"
    echo ""
    echo "   Total   : $total"
    echo "   Success : $success"
    echo "   Failed  : $failed"
    echo "────────────────────────────────────────────────────────"
}


# ───────────────────────────────────────────────────────────────
# COMMANDS
# ───────────────────────────────────────────────────────────────

case "${1:-}" in

    core)

        install_package_file \
            "$PACKAGES_DIR/core.txt" \
            "Core packages"

        ;;

    dev)

        install_package_file \
            "$PACKAGES_DIR/dev.txt" \
            "Development packages"

        ;;

    optional)

        install_package_file \
            "$PACKAGES_DIR/optional.txt" \
            "Optional packages"

        ;;

    server)

        echo ""
        echo "⚠️  SERVER PACKAGES"
        echo ""
        echo "These packages are optional:"
        echo ""
        echo "  nginx"
        echo "  redis"
        echo "  mariadb"
        echo "  php"
        echo "  php-fpm"
        echo "  composer"
        echo ""

        read -p "❓ Continue? (y/n): " answer

        if [[ "$answer" =~ ^[Yy]$ ]]; then

            install_package_file \
                "$PACKAGES_DIR/server.txt" \
                "Server packages"

        else

            echo "⏩ Server packages skipped."

        fi

        ;;

    all)

        install_package_file \
            "$PACKAGES_DIR/core.txt" \
            "Core packages"

        ;;

    *)

        echo ""
        echo "Usage:"
        echo ""
        echo "  ./scripts/packages.sh core"
        echo "  ./scripts/packages.sh dev"
        echo "  ./scripts/packages.sh optional"
        echo "  ./scripts/packages.sh server"
        echo "  ./scripts/packages.sh all"
        echo ""

        ;;

esac
