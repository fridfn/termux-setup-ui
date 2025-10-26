#!/data/data/com.termux/files/usr/bin/bash

echo "🌱 Updating Termux repositories..."
pkg update -y && pkg upgrade -y

# ───────────────────────────────
# ASK USER: Install Packages?
# ───────────────────────────────
echo ""
read -p "❓ Mau install semua packages dari packages.txt? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
  echo ""
  echo "📦 Installing packages..."
  while read package; do
    [[ -z "$package" ]] && continue  # skip baris kosong
    echo "→ Installing $package..."
    pkg install -y "$package" || echo "⚠️  Gagal install $package, dilewati."
  done < packages.txt
else
  echo "⏩ Lewati instalasi packages."
fi

# ───────────────────────────────
# CHECK OH MY ZSH
# ───────────────────────────────
echo ""
echo "🧠 Checking Oh My Zsh installation..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  read -p "❓ Oh My Zsh belum ada. Mau install sekarang? (y/n): " zsh_choice
  if [[ "$zsh_choice" =~ ^[Yy]$ ]]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    echo "⏩ Skip install Oh My Zsh."
  fi
else
  echo "✅ Oh My Zsh sudah terpasang, lanjut..."
fi

# ───────────────────────────────
# COPY CONFIG FILES
# ───────────────────────────────
echo ""
echo "🧩 Copying configuration files..."
cp .zshrc ~/ 2>/dev/null && echo "✅ Copied .zshrc" || echo "⚠️  .zshrc tidak ditemukan."
mkdir -p ~/.termux
cp .termux/* ~/.termux/ 2>/dev/null && echo "✅ Copied .termux files" || echo "⚠️  .termux files tidak ditemukan."
cp -r oh-my-zsh-custom ~/.oh-my-zsh/custom 2>/dev/null && echo "✅ Copied custom plugins" || echo "⚠️  Custom plugins tidak ditemukan."

echo ""
echo "🧩 Restoring bash profile..."
cp .profile ~/ 2>/dev/null && echo "✅ Copied .profile" || echo "⚠️  .profile not found."
cp .bashrc ~/ 2>/dev/null && echo "✅ Copied .bashrc" || echo "⚠️  .bashrc not found."


echo ""
echo "✨ Selesai! Restart Termux untuk menerapkan perubahan."
