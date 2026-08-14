# 🌱 Farid Fathoni N — Termux Environment

> **Personal Termux environment setup and configuration.**

Repository ini digunakan untuk membangun kembali environment Termux untuk kebutuhan development.

Repository ini **tidak menyimpan source code project utama**. Fokusnya hanya pada:

- Shell & terminal
- Development tools
- Git & SSH
- Zsh & Oh My Zsh
- Terminal appearance
- Automation & diagnostics

---

## ✨ Features

- 🌱 Automated Termux setup
- 📦 Categorized package management
- 🟢 Node.js LTS
- 🔧 Git configuration
- 🔐 SSH & GitHub authentication
- 🐚 Zsh + Oh My Zsh
- 🎨 ExFavorite custom theme
- ✨ Zsh autosuggestions
- 🖍️ Zsh syntax highlighting
- 🖥️ Custom terminal banner
- 📜 Termux MOTD
- 🧹 Custom `clear` behavior
- 🩺 Environment Doctor
- ♻️ Idempotent setup
- 🔁 Factory-reset recovery

---

## 📁 Structure

```text
.
├── .github/
│
├── oh-my-zsh-custom/
│   └── themes/
│       └── exfavorite.zsh-theme
│
├── packages/
│   ├── core.txt
│   ├── dev.txt
│   ├── optional.txt
│   └── server.txt
│
├── scripts/
│   ├── banner.sh
│   ├── doctor.sh
│   ├── git.sh
│   ├── motd.sh
│   ├── node.sh
│   ├── packages.sh
│   ├── ssh.sh
│   └── zsh.sh
│
├── .bashrc
├── .profile
├── .zshrc
├── colors.properties
├── font.ttf
├── termux.properties
├── setup.sh
└── README.md
```

---

## 🚀 Installation

### Requirements

- Android
- Termux
- ARM64 / `aarch64`
- Termux dari F-Droid atau sumber resmi

### 1. Clone

```bash
git clone <repository-url> ~/termux-setup
cd ~/termux-setup
```

### 2. Run Setup

```bash
bash setup.sh
```

Kemudian pilih:

```text
[A] Recommended setup
```

Recommended setup digunakan untuk menyiapkan environment utama secara otomatis.

---

## 🛠️ Setup Menu

```text
[1] Update / upgrade Termux

[2] Install Core packages
[3] Install Development packages
[4] Install Optional packages
[5] Install Server packages

[6] Setup Node.js LTS
[7] Setup Git
[8] Setup SSH / GitHub
[9] Setup Zsh & configuration

[D] Run environment doctor
[A] Recommended setup
[0] Exit
```

---

## 📦 Packages

Package dibagi berdasarkan kebutuhan:

| Category | Purpose |
|---|---|
| `core` | Tools utama environment |
| `dev` | Development tools |
| `optional` | Tools tambahan |
| `server` | Local/server development |

Contoh:

```bash
bash scripts/packages.sh core
```

---

## 🟢 Node.js

Setup Node.js LTS:

```bash
bash scripts/node.sh
```

Verify:

```bash
node --version
npm --version
```

Script akan mempertahankan instalasi yang sudah sesuai sehingga aman dijalankan kembali.

---

## 🔧 Git

Setup Git:

```bash
bash scripts/git.sh
```

Verify:

```bash
git --version
git config --global --get user.name
git config --global --get user.email
```

Jika Git identity sudah dikonfigurasi, setup akan melewati konfigurasi tersebut.

---

## 🔐 SSH / GitHub

Setup SSH:

```bash
bash scripts/ssh.sh
```

Script akan menangani:

- `~/.ssh`
- Ed25519 SSH key
- SSH configuration
- GitHub authentication

Test:

```bash
ssh -T git@github.com
```

---

## 🐚 Zsh

Aurielle menggunakan:

```text
Zsh
 ├── Oh My Zsh
 ├── zsh-autosuggestions
 ├── zsh-syntax-highlighting
 └── ExFavorite
```

Setup:

```bash
bash scripts/zsh.sh
```

Verify:

```bash
echo "$SHELL"
echo "$ZSH_THEME"
```

---

## 🎨 Terminal

Terminal configuration meliputi:

- ExFavorite theme
- Custom colors
- Custom font
- Terminal properties
- Startup banner
- MOTD

### Banner

Source utama banner:

```text
scripts/banner.sh
```

Banner digunakan untuk:

```text
Termux startup
      ↓
     MOTD

clear
      ↓
  Zsh hook
      ↓
   Banner
```

Generate MOTD:

```bash
bash scripts/motd.sh
```

---

## 🩺 Environment Doctor

Setelah setup selesai, jalankan:

```bash
bash scripts/doctor.sh
```

Doctor memeriksa:

```text
System
Core tools
Node.js
Git
SSH
Zsh
Termux configuration
Repository
GitHub authentication
```

Contoh hasil:

```text
════════════════════════════════════════════════════════
DIAGNOSTIC SUMMARY
════════════════════════════════════════════════════════

   ✅ Passed  : 23
   ⚠️  Warning : 0
   ❌ Failed  : 0

🌱 Aurielle environment is healthy.
```

---

## ♻️ Idempotent Setup

Script dirancang agar dapat dijalankan berkali-kali.

Contoh:

```bash
bash scripts/zsh.sh
bash scripts/zsh.sh
bash scripts/zsh.sh
```

Setup tidak seharusnya:

- Menginstall plugin berulang
- Membuat konfigurasi duplikat
- Mengganti konfigurasi yang sudah valid
- Merusak environment yang sudah berjalan

---

## 🔁 Factory Reset Recovery

Repository ini dirancang sebagai **recovery blueprint** untuk environment Termux.

```text
Factory Reset
      ↓
Install Termux
      ↓
Clone repository
      ↓
bash setup.sh
      ↓
[A] Recommended setup
      ↓
Configure Git
      ↓
Configure SSH / GitHub
      ↓
Environment Doctor
      ↓
🌱 Environment Ready
```

Dengan repository ini, environment dapat dibangun kembali tanpa melakukan konfigurasi manual dari awal.

---

## 🧪 Verification

Basic verification:

```bash
node --version
npm --version
git --version
curl --version
jq --version
ssh -V
zsh --version
```

Shell:

```bash
echo "$SHELL"
echo "$ZSH_THEME"
```

Zsh plugins:

```bash
ls ~/.oh-my-zsh/custom/plugins/
```

Theme:

```bash
ls ~/.oh-my-zsh/custom/themes/
```

GitHub:

```bash
ssh -T git@github.com
```

Atau gunakan:

```bash
bash scripts/doctor.sh
```

---

## 🌱 Philosophy

Aurielle Termux Setup dibangun dengan beberapa prinsip:

**Separation of Concerns**  
Environment dipisahkan dari source code project.

**Idempotency**  
Setup aman untuk dijalankan kembali.

**Recovery First**  
Environment harus mudah dipulihkan setelah device reset.

**Single Source of Truth**  
Konfigurasi penting tidak dibuat berulang di banyak tempat.

**Automation First**  
Minimalkan konfigurasi manual.

**Diagnostic First**  
Gunakan Environment Doctor sebelum melakukan troubleshooting manual.

---

## 📌 Environment

Contoh environment:

```text
Architecture : aarch64
Android      : 9
Termux       : 0.119.0-beta.3
Node.js      : 24.x LTS
npm          : 11.x
Shell        : Zsh
Framework    : Oh My Zsh
Theme        : ExFavorite
```

> Versi dapat berbeda tergantung perangkat dan repository package Termux.

---

## 🌱 Farid Fathoni N

> *“A clean environment for a calmer development workflow.”*

**Aurielle Termux Setup** bukan sekadar package installer.

Ini adalah **blueprint environment** yang memungkinkan seluruh fondasi development dibangun kembali ketika environment hilang, device di-reset, atau setup perlu direproduksi.