#!/data/data/com.termux/files/usr/bin/bash

echo "Installing packages..."
pkg install -y $(awk '{print $1}' packages.txt)

echo "Setting up Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copying configs..."
cp .zshrc ~/
mkdir -p ~/.termux
cp .termux/* ~/.termux/
cp -r oh-my-zsh-custom ~/.oh-my-zsh/custom

echo "Done 🎉 Restart Termux to apply changes."
