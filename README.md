# 💜 Termux Custom Setup - FaDevelopment

> **Beautiful, functional, and personalized CLI environment for Termux**  
> Created by Farid Fathoni Nugroho

A comprehensive Termux configuration featuring a custom Zsh theme, intelligent bash functions, and developer-focused shortcuts for an enhanced mobile development experience.

---

## ✨ Features

- 🎨 **Custom ASCII Art Banner** - Beautiful purple-cyan gradient welcome screen
- 🚀 **Smart Command Aliases** - Quick shortcuts for common tasks
- 📝 **Enhanced Directory Listing** - Colorful and informative `ls` output
- 🔧 **Developer Tools Integration** - Git, Node.js, PHP, MariaDB, Redis, and more
- 🎯 **Custom Functions** - Code editor integration, dynamic MOTD, and more
- 📚 **Quick Reference System** - Built-in documentation for React, JavaScript, Git, and Termux commands
- 🌈 **Base16 3024 Color Scheme** - Eye-friendly dark theme with vibrant accents
- ⚡ **Oh My Zsh Integration** - Enhanced shell with plugins and custom theme

---

## 📦 Installation

### Prerequisites

- **Termux** installed on Android device
- Internet connection for package downloads
- Storage permission granted to Termux

### Quick Install

1. **Clone or download this repository:**
   ```bash
   cd ~
   git clone <your-repo-url> termux-setup
   cd termux-setup
   ```

2. **Run the setup script:**
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

3. **Follow the prompts:**
   - Choose whether to install packages from `packages.txt`
   - Decide if you want Oh My Zsh installed (recommended)

4. **Restart Termux** to apply all changes

---

## 🎨 What Gets Installed

### Configuration Files

| File | Location | Purpose |
|------|----------|---------|
| `.zshrc` | `~/` | Zsh configuration with custom theme |
| `.bashrc` | `~/` | Bash configuration with functions and aliases |
| `.profile` | `~/` | Sources `.bashrc` on login |
| `colors.properties` | `~/.termux/` | Custom color scheme |
| `termux.properties` | `~/.termux/` | Termux app settings |
| `exfavorite.zsh-theme` | `~/.oh-my-zsh/custom/themes/` | Custom Zsh prompt theme |

### Key Packages

```md
Development Tools:
- git, gh (GitHub CLI)
- nodejs, yarn, npm
- php, php-fpm, composer
- python, python-pip
- clang, make, llvm

Database & Cache:
- mariadb, redis

Networking:
- nginx, openssh
- curl, wget (via inetutils)

Utilities:
- zsh, oh-my-zsh
- nano, tree, neofetch
- figlet, jp2a
- ncdu, man, less
```

---

## 🚀 Usage Guide

### Custom Banner

Every time you open a new terminal session or type `clear`, you'll see:

```md
   ____  _____      _____                     _ _
  / __ \| ____|_  _|  ___|_ ___   _____  _ __(_) |_ ___
 / / _ `|  _| \ \/ / |_ / _ `\ \ / / _ \| "__| | __/ _ \
| | (_| | |___ >  <|  _| (_| |\ V / (_) | |  | | ||  __/
 \ \__,_|_____/_/\_\_|  \__,_| \_/ \___/|_|  |_|\__\___|
  \____/ By : Farid Fathoni N ~

  Selamat datang di terminal @FaDevelopment !
```

### Custom Functions

#### `color()`
Apply colors to terminal output:
```bash
color "Hello World" purple
color "Error message" red
color "Success!" green
```

Available colors: `black`, `red`, `green`, `yellow`, `blue`, `purple`, `cyan`, `white`

#### `code()`
Open files in Acode editor:
```bash
code                    # Open Acode
code index.html         # Open specific file
code src/App.jsx        # Open with path
```

#### Enhanced `ls`
Automatically shows:
- Colored directory listing
- Current working directory
- Decorative borders

---

## 🎨 Customization

### Changing the Banner

Edit the ASCII art in `.bashrc`:

```bash
nano ~/.bashrc
# Find the clear() function and modify the echo statements
```

### Adding New Aliases

```bash
obash
# Add at the bottom:
alias mycommand="your command here"
# Save, then:
reload
```

### Modifying Colors

Edit the color scheme:
```bash
nano ~/.termux/colors.properties
```

### Creating Custom Documentation

Add your own reference guides:
```bash
cd ~/kamus
nano myguide.sh
# Write your guide, then add alias in .bashrc:
alias myguide='~/kamus/myguide.sh'
```

---

## 📚 Oh My Zsh Integration

### Included Plugins

- **git** - Git aliases and tab completion
- **zsh-autosuggestions** - Fish-like command suggestions
- **zsh-syntax-highlighting** - Real-time syntax highlighting

### Theme: exfavorite

Custom theme featuring:
- Current directory display
- Git branch and status indicators
- Color-coded prompt based on command success
- Clean, minimal design

---

## 🔧 Troubleshooting

### MOTD Not Updating

If the welcome message doesn't match your `.bashrc` banner:

```bash
bash ~/.update_motd.sh
```

### Zsh Theme Not Loading

Ensure the theme file exists:
```bash
ls ~/.oh-my-zsh/custom/themes/exfavorite.zsh-theme
```

If missing, copy from backup:
```bash
cp oh-my-zsh-custom/themes/exfavorite.zsh-theme ~/.oh-my-zsh/custom/themes/
```

### Colors Not Working

Check if `colors.properties` is in the right place:
```bash
ls ~/.termux/colors.properties
```

Apply colors:
```bash
termux-reload-settings
```

### Aliases Not Found

Reload your configuration:
```bash
source ~/.bashrc
source ~/.zshrc
```

---

## 🗂️ Project Structure

```md
termux-setup/
├── .bashrc                      # Bash configuration & aliases
├── .zshrc                       # Zsh configuration
├── .profile                     # Login profile
├── .termux/
│   ├── colors.properties        # Color scheme
│   └── termux.properties        # App settings
├── oh-my-zsh-custom/
│   └── themes/
│       └── exfavorite.zsh-theme # Custom Zsh theme
├── kamus/                       # Reference guides (not included)
│   ├── termux.sh
│   ├── github.sh
│   ├── react.sh
│   ├── javascript.sh
│   └── color.sh
├── packages.txt                 # Package list
├── setup.sh                     # Automated setup script
└── README.md                    # This file
```

---

## 🤝 Contributing

This is a personal configuration, but feel free to:
- Fork and adapt for your needs
- Suggest improvements via issues
- Share your own customizations

---

## 📄 License

This configuration is free to use and modify. Created with 💜 by Farid Fathoni Nugroho.

---

## 🙏 Acknowledgments

- **Oh My Zsh** - Framework for managing Zsh configuration
- **Base16** - Color scheme foundation
- **Termux Community** - For the amazing Android terminal emulator

---

## 📞 Support

If you encounter issues:
1. Check the troubleshooting section above
2. Review your modifications to config files
3. Restore from backup if needed

---

**Happy coding from your mobile terminal!** 🚀💜

> *"Coding isn't just about logic... it's about putting your heart into the screen."*  
> — Farid Fathoni Nugroho