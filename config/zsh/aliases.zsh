# ═══════════════════════════════════════════════════════════
# AURIELLE — ZSH ALIASES
# ═══════════════════════════════════════════════════════════


# ───────────────────────────────────────────────────────────
# Navigation
# ───────────────────────────────────────────────────────────

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

alias home='cd ~'
alias prefix='cd "$PREFIX"'


# ───────────────────────────────────────────────────────────
# System
# ───────────────────────────────────────────────────────────

alias cpu='ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 21'
alias ram='ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 21'
alias mem='free -h'
alias disk='df -h "$PREFIX" "$HOME"'

alias sysinfo='uname -a'
alias arch='uname -m'
alias kernel='uname -r'
alias uptime='uptime'


# ───────────────────────────────────────────────────────────
# Network
# ───────────────────────────────────────────────────────────

alias myip='ip addr show | awk '\''/inet / && !/127.0.0.1/ {print $2}'\'''
alias net='ip addr'
alias route='ip route'
alias dns='getprop | grep dns'
alias pingg='ping -c 4 1.1.1.1'


# ───────────────────────────────────────────────────────────
# Development
# ───────────────────────────────────────────────────────────

alias nodever='node -v && npm -v'
alias pyver='python --version'
alias gitver='git --version'

alias pkglist='pkg list-installed'
alias pkgfind='pkg search'


# ───────────────────────────────────────────────────────────
# Git
# ───────────────────────────────────────────────────────────

alias gs='git status --short --branch'
alias gb='git branch -a'
alias gr='git remote -v'

alias gitlog='git log -5 --oneline --decorate'
alias gitgraph='git log --oneline --graph --decorate --all'

alias gitrecent='git log -10 --pretty=format:"%h  %ad  %s" --date=short'


# ───────────────────────────────────────────────────────────
# Project
# ───────────────────────────────────────────────────────────

alias projects='cd ~/projects'


# ───────────────────────────────────────────────────────────
# Environment
# ───────────────────────────────────────────────────────────

alias doctor='termux-doctor'