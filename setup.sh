#!/data/data/com.termux/files/usr/bin/bash

echo "Installing packages..."
pkg install -y $(awk '{print $1}' packages.txt)

echo "Checking Oh My Zsh installation..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed, skipping..."
fi

echo "Copying configs..."
cp .zshrc ~/
mkdir -p ~/.termux
cp .termux/* ~/.termux/ 2>/dev/null || echo "No .termux files found, skipped."
cp -r oh-my-zsh-custom ~/.oh-my-zsh/custom 2>/dev/null || echo "No custom plugins found, skipped."

echo "Done 🎉 Restart Termux to apply changes."
