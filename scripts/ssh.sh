#!/data/data/com.termux/files/usr/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🌱 FARID FATHONI N — SSH / GITHUB SETUP
# ═══════════════════════════════════════════════════════════════

set -u

SSH_DIR="$HOME/.ssh"
KEY="$SSH_DIR/id_ed25519"
PUB_KEY="$KEY.pub"
CONFIG="$SSH_DIR/config"

echo ""
echo "🔐 FARID FATHONI N — SSH / GITHUB SETUP"
echo ""

# ───────────────────────────────────────────────────────────────
# INSTALL OPENSSH
# ───────────────────────────────────────────────────────────────

if ! command -v ssh >/dev/null 2>&1; then

    echo "📦 Installing OpenSSH..."

    if ! pkg install -y openssh; then
        echo "❌ Gagal install OpenSSH."
        exit 1
    fi

else

    echo "✅ OpenSSH tersedia."

fi

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"


# ───────────────────────────────────────────────────────────────
# SSH KEY
# ───────────────────────────────────────────────────────────────

if [ -f "$KEY" ] && [ -f "$PUB_KEY" ]; then

    echo "✅ Ed25519 SSH key sudah tersedia."

else

    echo "⚠️  Ed25519 SSH key belum tersedia."
    echo ""

    read -p "❓ Buat SSH key baru? (y/n): " answer

    if [[ "$answer" =~ ^[Yy]$ ]]; then

        echo ""
        read -p "Email/comment SSH key: " ssh_email

        if [ -z "$ssh_email" ]; then
            echo "❌ Email tidak boleh kosong."
            exit 1
        fi

        if ! ssh-keygen \
            -t ed25519 \
            -C "$ssh_email" \
            -f "$KEY"; then

            echo "❌ Gagal membuat SSH key."
            exit 1

        fi

        chmod 600 "$KEY"
        chmod 644 "$PUB_KEY"

        echo ""
        echo "✅ SSH key berhasil dibuat."

    else

        echo "⏩ SSH key creation skipped."
        exit 0

    fi

fi


# ───────────────────────────────────────────────────────────────
# SSH CONFIG
# ───────────────────────────────────────────────────────────────

if [ ! -f "$CONFIG" ]; then

    cat > "$CONFIG" <<'EOF'
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
EOF

    chmod 600 "$CONFIG"

    echo "✅ GitHub SSH config created."

else

    chmod 600 "$CONFIG"

    echo "✅ SSH config already exists."

fi


# ───────────────────────────────────────────────────────────────
# GITHUB SSH TEST
# ───────────────────────────────────────────────────────────────

echo ""
echo "🔌 Testing GitHub SSH..."
echo ""

SSH_OUTPUT="$(ssh -T \
    -o BatchMode=yes \
    -o ConnectTimeout=10 \
    git@github.com 2>&1)"

SSH_STATUS=$?

echo "$SSH_OUTPUT"
echo ""

# GitHub authentication success normally returns exit code 1.
if echo "$SSH_OUTPUT" | grep -q "successfully authenticated"; then

    echo "════════════════════════════════════════════════════════"
    echo "✅ GitHub SSH authentication berhasil."
    echo "════════════════════════════════════════════════════════"

    exit 0

fi


# ───────────────────────────────────────────────────────────────
# AUTHENTICATION FAILED
# ───────────────────────────────────────────────────────────────

echo "⚠️  GitHub SSH authentication belum berhasil."

echo ""
echo "🔑 Public key:"
echo ""

cat "$PUB_KEY"

echo ""
echo "📌 Jika key belum ditambahkan ke GitHub:"
echo "   Settings → SSH and GPG keys → New SSH key"
echo ""

if [ "$SSH_STATUS" -eq 1 ]; then

    echo "ℹ️  Exit code 1 dari GitHub bisa normal,"
    echo "   tetapi pesan autentikasi harus menunjukkan"
    echo "   'successfully authenticated'."

fi

echo ""
echo "⚠️  SSH setup selesai dengan warning."
echo ""