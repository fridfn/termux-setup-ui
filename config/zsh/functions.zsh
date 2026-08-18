# ═══════════════════════════════════════════════════════════
# AURIELLE — ZSH FUNCTIONS
# ═══════════════════════════════════════════════════════════


# Create directory and enter it
mkcd() {
    if [[ -z "$1" ]]; then
        echo "Usage: mkcd <directory>"
        return 1
    fi

    mkdir -p "$1" && cd "$1"
}


# Quick Git status
gstatus() {
    git status
}


# Show current Git branch
gbranch() {
    git branch --show-current
}


# Reload Zsh configuration
reloadzsh() {
    source ~/.zshrc
    echo "✓ Zsh configuration reloaded."
}