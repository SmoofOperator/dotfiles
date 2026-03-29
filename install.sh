#!/usr/bin/env bash
set -e

# ── Install packages ──────────────────────────────────────────────────────────
echo "Installing packages..."
sudo dnf install -y zsh zsh-autosuggestions zsh-syntax-highlighting fzf zoxide eza bat neovim

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
