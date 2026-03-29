# dotfiles

Configuration files for zsh and terminal tools. Works on Fedora-based and Debian-based distros.

## Restore on a fresh install

```sh
curl -sS https://raw.githubusercontent.com/SmoofOperator/dotfiles/main/install.sh | sh
```

Then log out and back in.

---

## What's included

### Shell

**[zsh](https://www.zsh.org/)**
A more powerful shell than bash. Provides the foundation for all the tools below.

**[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)**
Shows a grayed-out ghost suggestion as you type, pulled from your command history. Press `→` or `Ctrl+Space` to accept.

**[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)**
Colors your command as you type it. Valid commands turn green, invalid ones red. Helps catch typos before hitting Enter.

### Prompt

**[Starship](https://starship.rs/)**
A fast, minimal prompt that auto-detects context — shows git branch, dirty state, and language versions (Node, Python, Rust, etc.) only when relevant.

### Fuzzy search

**[fzf](https://github.com/junegunn/fzf)**
Fuzzy finder for the terminal. Key bindings added:
- `Ctrl+R` — fuzzy search through command history
- `Ctrl+T` — fuzzy search files in the current directory

### Modern replacements

**[eza](https://github.com/eza-community/eza)**
A modern replacement for `ls`. Aliased to `ls` and `ll`. Shows colors, groups directories first, and includes git status per file in long view (`ll`).

**[bat](https://github.com/sharkdp/bat)**
A modern replacement for `cat`. Aliased to `cat`. Adds syntax highlighting and line numbers when viewing files.

**[zoxide](https://github.com/ajeetdsouza/zoxide)**
A smarter `cd`. Learns your most frequently visited directories and lets you jump to them with `z <partial-name>` from anywhere.

### Editor

**[Neovim](https://neovim.io/) + [LazyVim](https://www.lazyvim.org/)**
Neovim is a modern, fast terminal editor. LazyVim is a pre-built configuration that turns it into a full IDE. Includes:
- `Space+e` — file tree (neo-tree)
- `Space+ff` — fuzzy file search (Telescope)
- `Space+fg` — fuzzy text search across project
- LSP: autocompletion, go-to-definition, inline errors
- Syntax highlighting for all major languages (Treesitter)
- Git signs in the gutter and inline blame (gitsigns)
- `Space+gg` — open lazygit TUI (if installed)

### Multiplexer

**[tmux](https://github.com/tmux/tmux)**
Split your terminal into panes and windows, and keep sessions alive when you close the terminal. Key bindings:
- Prefix is `Ctrl+A` (changed from default `Ctrl+B`)
- `Ctrl+A |` — split pane vertically
- `Ctrl+A -` — split pane horizontally
- `Alt+Arrow` — navigate between panes
- `Shift+Arrow` — navigate between windows
- `Ctrl+A r` — reload tmux config

### Git

**[lazygit](https://github.com/jesseduffield/lazygit)**
A terminal UI for git. Stage hunks, resolve conflicts, view diffs, and manage branches without typing git commands. Run with `lazygit` or `Space+gg` inside Neovim.

### System monitoring

**[btop](https://github.com/aristocratsofcode/btop)**
A modern replacement for `top`/`htop`. Shows CPU, memory, disk, and network usage in one view. Run with `btop`.

### Terminal emulator

**[kitty](https://sw.kovidgoyal.net/kitty/)**
A GPU-accelerated terminal emulator. Configured with the Tokyo Night color theme (matching LazyVim), JetBrainsMono Nerd Font, and tab support.

### Font

**[JetBrainsMono Nerd Font](https://www.nerdfonts.com/)**
A monospace font patched with thousands of icons. Required for icons to render correctly in eza, Neovim, Starship, and kitty.

### Clipboard

**[wl-clipboard](https://github.com/bugaevc/wl-clipboard)**
Wayland clipboard integration. Allows Neovim and tmux to copy/paste to and from the system clipboard.

### History

**[atuin](https://atuin.sh/)**
Replaces `Ctrl+R` with a powerful history search UI. Stores metadata (exit code, directory, duration) and can sync history across machines.

### System info

**[fastfetch](https://github.com/fastfetch-cli/fastfetch)**
Displays system info (OS, kernel, CPU, memory, etc.) on shell startup.
