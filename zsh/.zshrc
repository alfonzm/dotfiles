# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load compinit
autoload -Uz compinit vcs_info
compinit

# load version control information
zstyle ':vcs_info:git*' formats "(%b)"

# https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
precmd() {
  vcs_info

  # Prompt
  NEWLINE=$'\n'
  PROMPT_SYMBOL=$'$ '

  if [[ -z ${vcs_info_msg_0_} ]]; then
    PS1="${NEWLINE}%B%F{yellow}%~%f%b ${NEWLINE}${PROMPT_SYMBOL}"
  else
    # PROMPT="${NEWLINE}%B%F{yellow}%~%f%b %F{cyan}${vcs_info_msg_0_}%f${NEWLINE}${PROMPT_SYMBOL}"
    PS1="${NEWLINE}%B%F{yellow}%~%f%b %F{cyan}${vcs_info_msg_0_}%f${NEWLINE}${PROMPT_SYMBOL}"
  fi
}


# Include other dotfiles
source ~/.functions
source ~/.aliases

# Simulate XDG_CONFIG_HOME path
export XDG_CONFIG_HOME="$HOME/.config"

# Use ripgrep for FZF, including hidden files
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{**/vendor/*,**/node_modules/*,**/.git/*,**/public/*}"'

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# How often to auto-update (in days)
export UPDATE_ZSH_DAYS=13

# Initialize zoxide
eval "$(zoxide init zsh)"

# Editor
export EDITOR='nvim'

# Add composer to PATH
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Use Vim keybindings
bindkey -v
export KEYTIMEOUT=1

# CLICOLOR for VIM color schemes
export CLICOLOR=1

# Fix Gruvbox palette for vim
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# History
HISTFILESIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt inc_append_history
setopt share_history

export BAT_THEME="gruvbox-dark"

# Vi-mode - Disable the cursor style feature
ZVM_CURSOR_STYLE_ENABLED=false

# Vi-mode - Always start with insert mode
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

# zsh-nvm settings https://github.com/lukechilds/zsh-nvm
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# zsh highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red,bold')
ZSH_HIGHLIGHT_PATTERNS+=('\rm -i -rf *' 'fg=white,bold,bg=red,bold')
ZSH_HIGHLIGHT_PATTERNS+=('git reset --hard' 'fg=white,bold,bg=red,bold')

# Source zsh plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.zsh/zsh-nvm/zsh-nvm.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/alfonzm/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# Created by `pipx` on 2024-03-17 08:11:10
export PATH="$PATH:/Users/alfonzm/.local/bin"

# Go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"
