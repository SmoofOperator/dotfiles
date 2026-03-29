#!/usr/bin/env bash
set -e

# ── Detect package manager ────────────────────────────────────────────────────
if command -v dnf &>/dev/null; then
    echo "Detected Fedora-based distro (dnf)"
    sudo dnf install -y zsh zsh-autosuggestions zsh-syntax-highlighting fzf zoxide eza bat neovim tmux lazygit btop
elif command -v apt &>/dev/null; then
    echo "Detected Debian-based distro (apt)"
    sudo apt update
    sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting fzf zoxide eza bat neovim tmux btop
    # lazygit not in apt repos, install manually
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit -D -t /usr/local/bin/
    rm lazygit lazygit.tar.gz
else
    echo "Unsupported package manager. Install packages manually."
    exit 1
fi

# ── Install Starship ──────────────────────────────────────────────────────────
echo "Installing Starship prompt..."
curl -sS https://starship.rs/install.sh | sh

# ── Set zsh as default shell ──────────────────────────────────────────────────
echo "Setting zsh as default shell..."
chsh -s /usr/bin/zsh

# ── Restore dotfiles ──────────────────────────────────────────────────────────
echo "Restoring dotfiles..."
git clone --bare https://github.com/SmoofOperator/dotfiles.git "$HOME/.dotfiles"
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" checkout

echo "Done. Log out and back in to start using zsh."
