# ── Completion ────────────────────────────────────────────────────────────────
autoload -Uz compinit && compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colored completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''

# Group completions by category with headers
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}── %d ──%f'

# ── History ───────────────────────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS       # don't save duplicate entries
setopt HIST_IGNORE_SPACE      # don't save commands starting with a space
setopt SHARE_HISTORY          # share history across sessions

# ── Colors ────────────────────────────────────────────────────────────────────
export CLICOLOR=1
export LS_COLORS='di=1;34:ln=36:so=32:pi=33:ex=1;32:bd=1;33:cd=1;33:su=1;31:sg=1;31:tw=1;34:ow=1;34'
alias ls='eza --color=auto --group-directories-first'
alias ll='eza -lah --color=auto --group-directories-first --git'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias cat='bat --paging=never'

# ── Prompt (Starship) ─────────────────────────────────────────────────────────
eval "$(starship init zsh)"

# ── Plugins ───────────────────────────────────────────────────────────────────
# zsh-autosuggestions (ghost text as you type)
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

# zsh-syntax-highlighting (colors your input live — must be last)
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ── Key bindings ──────────────────────────────────────────────────────────────
bindkey '^[[A' history-search-backward   # Up arrow: history search
bindkey '^[[B' history-search-forward    # Down arrow: history search
bindkey '^ ' autosuggest-accept          # Ctrl+Space: accept suggestion

# ── fzf ───────────────────────────────────────────────────────────────────────
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && \
    source /usr/share/fzf/shell/key-bindings.zsh
[ -f /usr/share/fzf/shell/completion.zsh ] && \
    source /usr/share/fzf/shell/completion.zsh

# ── zoxide (smart cd) ─────────────────────────────────────────────────────────
eval "$(zoxide init zsh)"

# ── atuin (better history) ────────────────────────────────────────────────────
eval "$(atuin init zsh)"

# ── fastfetch (show system info on shell start) ───────────────────────────────
fastfetch
