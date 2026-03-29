#!/usr/bin/env bash
set -e

# ── Detect OS and package manager ─────────────────────────────────────────────
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS"

    # Install Homebrew if not present
    if ! command -v brew &>/dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew install zsh-autosuggestions zsh-syntax-highlighting fzf zoxide eza bat neovim tmux lazygit btop atuin fastfetch
    brew install --cask ghostty font-jetbrains-mono-nerd-font

    # macOS clipboard works natively, no wl-clipboard needed

elif command -v dnf &>/dev/null; then
    echo "Detected Fedora-based distro (dnf)"
    sudo dnf install -y zsh zsh-autosuggestions zsh-syntax-highlighting fzf zoxide eza bat neovim tmux lazygit btop kitty wl-clipboard atuin fastfetch

elif command -v apt &>/dev/null; then
    echo "Detected Debian-based distro (apt)"
    sudo apt update
    sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting fzf zoxide eza bat neovim tmux btop kitty wl-clipboard atuin fastfetch
    # lazygit not in apt repos, install manually
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit -D -t /usr/local/bin/
    rm lazygit lazygit.tar.gz

else
    echo "Unsupported OS/package manager. Install packages manually."
    exit 1
fi

# ── Install Starship ──────────────────────────────────────────────────────────
echo "Installing Starship prompt..."
curl -sS https://starship.rs/install.sh | sh

# ── Install JetBrainsMono Nerd Font (Linux only, Mac uses cask above) ─────────
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Installing JetBrainsMono Nerd Font..."
    mkdir -p ~/.local/share/fonts
    curl -Lo /tmp/JetBrainsMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
    unzip -o /tmp/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
    fc-cache -fv
    rm /tmp/JetBrainsMono.zip
fi

# ── Set zsh as default shell ──────────────────────────────────────────────────
echo "Setting zsh as default shell..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    chsh -s /bin/zsh
else
    chsh -s /usr/bin/zsh
fi

# ── Restore dotfiles ──────────────────────────────────────────────────────────
echo "Restoring dotfiles..."
git clone --bare https://github.com/SmoofOperator/dotfiles.git "$HOME/.dotfiles"
git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" checkout

echo "Done. Log out and back in to start using zsh."
