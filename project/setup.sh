#!/data/data/com.termux/files/usr/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
USERS_FILE="$SCRIPT_DIR/users.txt"

PROJECT_ROOT="$HOME/projects"

echo
echo "════════════════════════════════════════════════════════"
echo "           AURIELLE PROJECT WORKSPACE"
echo "════════════════════════════════════════════════════════"
echo

if [ ! -f "$USERS_FILE" ]; then
    echo "❌ users.txt tidak ditemukan."
    exit 1
fi

mkdir -p "$PROJECT_ROOT"

total=0
created=0
existing=0

while IFS= read -r user || [ -n "$user" ]; do

    # Skip empty line
    [ -z "$user" ] && continue

    # Skip comments
    [[ "$user" =~ ^[[:space:]]*# ]] && continue

    # Remove whitespace
    user="$(echo "$user" | xargs)"

    [ -z "$user" ] && continue

    total=$((total + 1))

    USER_DIR="$PROJECT_ROOT/$user"

    if [ -d "$USER_DIR" ]; then
        echo "   ✓ $user/"
        existing=$((existing + 1))
    else
        mkdir -p "$USER_DIR"
        echo "   + $user/"
        created=$((created + 1))
    fi

done < "$USERS_FILE"

echo
echo "────────────────────────────────────────────────────────"
echo "📊 Project workspace result"
echo
echo "   Users    : $total"
echo "   Created  : $created"
echo "   Existing : $existing"
echo "────────────────────────────────────────────────────────"
echo
echo "📁 Workspace:"
echo "   $PROJECT_ROOT"
echo
echo "✅ Project workspace ready."
echo
