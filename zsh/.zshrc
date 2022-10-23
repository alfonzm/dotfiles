# Simulate XDG_CONFIG_HOME path
export XDG_CONFIG_HOME="$HOME/.config"

# Path to your oh-my-zsh installation.
# export ZSH=~/.oh-my-zsh

# Themes located in ~/.oh-my-zsh/themes/
# ZSH_THEME="simple"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# How often to auto-update (in days)
export UPDATE_ZSH_DAYS=13

# zsh-nvm settings https://github.com/lukechilds/zsh-nvm
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# Plugins found in ~/.oh-my-zsh/plugins/
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  zsh-nvm
	brew
	common-aliases
	copydir
	git
	github
	gitignore
	tmux
	vi-mode
	# zsh-autosuggestions
	# zsh-syntax-highlighting
  globalias
)

# Enable oh my zsh
# source $ZSH/oh-my-zsh.sh

# Initialize zoxide
eval "$(zoxide init zsh)"

# ZSH Highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red,bold')

# Editor
export EDITOR='nvim'

# load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# format vcs_info variable
zstyle ':vcs_info:git:*' formats '(%b)'

# Prompt
NEWLINE=$'\n'
PROMPT_SYMBOL=$'$ '
# PROMPT=$'\n''%{$fg_bold[yellow]%}%~%{$fg_bold[cyan]%} ${vcs_info_msg_0_}%{$reset_color%}${NEWLINE}${PROMPT_SYMBOL}'
PROMPT="${NEWLINE}%B%F{yellow}%~%f%b %F{cyan}${vcs_info_msg_0_}%f${NEWLINE}${PROMPT_SYMBOL}"

# Add composer to PATH
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Use Vim keybindings
bindkey -v
export KEYTIMEOUT=1

# CLICOLOR for VIM color schemes
export CLICOLOR=1

# Fix Gruvbox palette for vim
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# Include other dotfiles
source ~/.functions
source ~/.aliases

# History
HISTFILESIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt inc_append_history
setopt share_history

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use ripgrep for FZF, including hidden files
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files -g "!{vendor,node_modules,.git,public}/*"'

export BAT_THEME="gruvbox-dark"

# Source zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
