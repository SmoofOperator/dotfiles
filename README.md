# dotfiles

Configuration files for zsh and terminal tools.

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
