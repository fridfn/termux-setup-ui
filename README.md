🌱 Farid Fathoni N — Termux Environment

«Personal Termux environment setup and configuration for.»

Repository ini digunakan untuk menyiapkan, mengonfigurasi, dan memelihara environment Termux yang digunakan untuk development dan menjalankan ekosistem Farid Fathoni N.

Source code utama tidak berada di repository ini. Repository ini hanya bertanggung jawab terhadap environment, shell, tools, konfigurasi, dan automation yang dibutuhkan.

---

✨ Features

Farid Fathoni N Termux Setup menyediakan:

- 🌱 Automated Termux environment setup
- 📦 Package management berdasarkan kategori
- 🟢 Node.js LTS setup
- 🔧 Git configuration
- 🔐 SSH & GitHub authentication setup
- 🐚 Zsh setup
- 🧠 Oh My Zsh integration
- 🎨 ExFavorite custom theme
- ✨ Zsh autosuggestions
- 🖍️ Zsh syntax highlighting
- 🖥️ Custom terminal banner
- 📜 Dynamic Termux MOTD
- 🧹 Custom "clear" hook
- 🩺 Environment Doctor
- 🚀 Recommended setup
- ♻️ Idempotent setup scripts

---

📁 Repository Structure

.
├── .github/
│   └── ...
│
├── oh-my-zsh-custom/
│   ├── plugins/
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

---

🚀 Installation

Requirements

Setup ditujukan untuk:

- Android
- Termux
- ARM64 / "aarch64"
- Termux dari F-Droid atau sumber resmi Termux

Pastikan repository Termux dapat diakses sebelum menjalankan setup.

---

1. Clone repository

git clone <repository-url> ~/termux-setup
cd ~/termux-setup

---

2. Jalankan setup

bash setup.sh

akan menampilkan menu utama:

════════════════════════════════════════════════════════
🌱 Farid Fathoni N SETUP MENU
════════════════════════════════════════════════════════

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

---

⚡ Recommended Setup

Untuk installation baru setelah factory reset, gunakan:

[A] Recommended setup

Recommended setup akan memasang komponen utama yang dibutuhkan environment.

Secara umum:

Termux update
      ↓
Core packages
      ↓
Node.js LTS
      ↓
Zsh / shell configuration
      ↓
Environment ready

Komponen tambahan seperti Git identity dan GitHub SSH dapat dikonfigurasi melalui menu masing-masing.

---

📦 Package Management

Package dikelompokkan berdasarkan kebutuhan.

Core

Tools dasar yang dibutuhkan environment:

git
curl
wget
jq
openssh
zsh
...

Install:

bash scripts/packages.sh core

Development

Development tools seperti compiler, runtime, dan utilities.

bash scripts/packages.sh dev

Optional

Tools tambahan yang tidak selalu dibutuhkan.

bash scripts/packages.sh optional

Server

Package untuk kebutuhan server/local development.

bash scripts/packages.sh server

---

🟢 Node.js

Aurielle menggunakan Node.js LTS sebagai runtime utama untuk project JavaScript/Node.

Setup:

bash scripts/node.sh

Verifikasi:

node --version
npm --version

Contoh environment:

Node : v24.x
npm  : 11.x

Script akan mempertahankan instalasi Node.js yang sudah tersedia apabila environment sudah sesuai.

---

🔧 Git

Konfigurasi Git dapat dilakukan melalui:

bash scripts/git.sh

Verifikasi:

git --version
git config --global --get user.name
git config --global --get user.email

Jika Git identity belum tersedia, setup akan meminta konfigurasi yang diperlukan.

---

🔐 SSH & GitHub

menyediakan setup SSH untuk GitHub.

Jalankan:

bash scripts/ssh.sh

Setup akan:

1. Membuat "~/.ssh" jika belum tersedia.
2. Membuat Ed25519 SSH key.
3. Mengatur konfigurasi SSH.
4. Menampilkan public key.
5. Membantu melakukan authentication test ke GitHub.

Public key dapat ditambahkan melalui:

GitHub → Settings → SSH and GPG keys → New SSH key

Setelah ditambahkan, test:

ssh -T git@github.com

Authentication yang berhasil biasanya menghasilkan pesan seperti:

Hi <username>! You've successfully authenticated,
but GitHub does not provide shell access.

---

🐚 Zsh

menggunakan Zsh + Oh My Zsh sebagai shell utama.

Setup:

bash scripts/zsh.sh

Komponen yang dikonfigurasi:

Zsh
 ├── Oh My Zsh
 ├── zsh-autosuggestions
 ├── zsh-syntax-highlighting
 └── ExFavorite theme

Zsh juga akan dikonfigurasi sebagai default shell apabila environment mendukungnya.

Verifikasi:

echo "$SHELL"

---

🎨 ExFavorite Theme

menggunakan custom theme:

ExFavorite

Theme berada di:

oh-my-zsh-custom/themes/exfavorite.zsh-theme

dan dipasang ke:

~/.oh-my-zsh/custom/themes/exfavorite.zsh-theme

Konfigurasi ".zshrc":

ZSH_THEME="exfavorite"

---

🖥️ Terminal Banner

Banner utama berada di:

scripts/banner.sh

File ini menjadi single source of truth untuk tampilan banner terminal.

Banner digunakan oleh:

Termux startup
       ↓
     /etc/motd

clear command
       ↓
   Zsh clear hook

Dengan demikian, tampilan startup dan "clear" menggunakan sumber yang sama.

Menjalankan banner secara manual:

bash scripts/banner.sh

---

📜 MOTD

MOTD dikonfigurasi melalui:

bash scripts/motd.sh

Script menghasilkan:

$PREFIX/etc/motd

dan membuat generator:

~/update_motd.sh

Generator dapat digunakan untuk memperbarui MOTD berdasarkan "banner.sh".

---

🧹 Clear Hook

Aurielle mengintegrasikan banner dengan command:

clear

Sehingga:

clear

tidak hanya membersihkan terminal, tetapi juga menampilkan kembali banner.

Implementasinya berada pada konfigurasi Zsh.

Tujuannya adalah menjaga pengalaman terminal tetap konsisten:

┌──────────────────────────┐
│      Terminal Start      │
│          ↓               │
│      Banner     │
└──────────────────────────┘

             atau

┌──────────────────────────┐
│          clear            │
│            ↓              │
│      Banner     │
└──────────────────────────┘

---

🩺 Environment Doctor

Untuk memeriksa kondisi environment:

bash scripts/doctor.sh

Doctor memeriksa beberapa komponen utama:

System

- Termux
- Architecture
- Android version
- Termux version

Core Tools

- Git
- curl
- wget
- jq
- OpenSSH
- Zsh

Node.js

- Node.js
- npm

Git

- Git name
- Git email

SSH

- "~/.ssh"
- Ed25519 private key
- Ed25519 public key

Configuration

- ".bashrc"
- ".profile"
- ".zshrc"
- ".termux"
- Oh My Zsh

Repository

- "setup.sh"
- "packages/"
- "scripts/"

GitHub

- SSH key availability

Doctor membedakan:

✅ Passed
⚠️ Warning
❌ Failed

Warning tidak selalu berarti environment rusak. Beberapa warning merupakan konfigurasi opsional seperti Git identity atau SSH key.

---

🔄 Idempotent Setup

Script dirancang agar aman dijalankan lebih dari satu kali.

Contohnya:

bash scripts/zsh.sh
bash scripts/zsh.sh
bash scripts/zsh.sh

Tidak seharusnya menghasilkan instalasi plugin/theme yang berulang atau konfigurasi yang menumpuk.

Plugin diperiksa berdasarkan file yang benar-benar dibutuhkan, bukan hanya keberadaan direktorinya.

Contoh:

directory exists
       ≠
plugin installed

Hal ini penting karena directory kosong dapat muncul akibat instalasi yang sebelumnya gagal.

---

🔁 Factory Reset Recovery

Salah satu tujuan utama repository ini adalah mempermudah recovery setelah device di-reset.

Flow yang diharapkan:

Factory Reset
      ↓
Install Termux
      ↓
Clone termux-setup
      ↓
bash setup.sh
      ↓
[A] Recommended setup
      ↓
Configure Git
      ↓
Configure SSH / GitHub
      ↓
Configure Zsh
      ↓
Environment Doctor
      ↓
🌱 Environment Ready

Dengan repository ini, konfigurasi environment tidak perlu dibuat ulang secara manual.

---

🧪 Verification

Setelah setup selesai, jalankan:

bash scripts/doctor.sh

Kemudian verifikasi:

node --version
npm --version
git --version
curl --version
jq --version
ssh -V
zsh --version

Verifikasi shell:

echo "$SHELL"
echo "$ZSH_THEME"

Verifikasi plugin:

ls ~/.oh-my-zsh/custom/plugins/

Verifikasi theme:

ls ~/.oh-my-zsh/custom/themes/

Verifikasi GitHub:

ssh -T git@github.com

---

🌱 Design Philosophy

Aurielle Termux Setup mengikuti beberapa prinsip:

1. Separation of Concerns

Environment setup dan source code dipisahkan.

2. Idempotency

Setup dapat dijalankan kembali tanpa merusak konfigurasi yang sudah ada.

3. Recovery First

Environment harus mudah dipulihkan setelah device reset.

4. Single Source of Truth

Komponen seperti terminal banner tidak dibuat ulang di banyak tempat.

5. Diagnostic Before Manual Fix

Environment Doctor digunakan untuk mengetahui kondisi sistem sebelum melakukan troubleshooting manual.

6. Minimal Manual Configuration

Sebisa mungkin proses setup dilakukan melalui automation.

---

📌 Current Environment

Environment ini dikembangkan dan digunakan pada perangkat Android ARM64 dengan Termux.

Contoh environment:

Architecture : aarch64
Android      : 9
Termux       : 0.119.0-beta.3
Node.js      : 24.x LTS
npm          : 11.x
Shell        : Zsh
Framework    : Oh My Zsh
Theme        : ExFavorite

Versi dapat berbeda tergantung versi package yang tersedia pada repository Termux.

---

🌱 Farid Fathoni N

«A clean environment for a calmer development workflow.»

Repository ini bukan sekadar installer package.

Ini adalah blueprint environment Farid Fathoni N — sehingga ketika environment hilang, device di-reset, atau setup perlu direproduksi, seluruh fondasi dapat dibangun kembali dari repository ini.