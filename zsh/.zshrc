# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Themes located in ~/.oh-my-zsh/themes/
ZSH_THEME="simple"

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
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# Enable Z
. ~/.oh-my-zsh/plugins/z/z.sh

# Enable oh my zsh
source $ZSH/oh-my-zsh.sh

# ZSH Highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red,bold')

# Editor
export EDITOR='vim'

# Terminal prompt
NEWLINE=$'\n'
PROMPT=$'\n''%{$fg_bold[yellow]%}%1d%{$fg_bold[cyan]%} $(git_prompt_info)%{$reset_color%}${NEWLINE}$ '

# Add to PATH
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

# Include custom scripts if exists
if [ -f ~/.custom ]; then
	source ~/.custom
fi

# Love2D
# alias love="/Applications/love.app/Contents/MacOS/love"

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
