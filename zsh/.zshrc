# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Themes located in ~/.oh-my-zsh/themes/
ZSH_THEME="simple"
# ZSH_THEME="minimal"
# ZSH_THEME="mh"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Plugins found in ~/.oh-my-zsh/plugins/
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
	brew
	common-aliases
	copydir
	git
	github
	gitignore
	laravel5
	tmux
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# Enable Z
. ~/.oh-my-zsh/plugins/z/z.sh

# Enable oh my zsh
source $ZSH/oh-my-zsh.sh

# ZSH Highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

# Editor
export EDITOR='vim'

# Terminal prompt
PROMPT=$'\n''%{$fg[green]%}%~%{$fg_bold[blue]%} $(git_prompt_info)%{$reset_color%} $ '

# Add to PATH
# export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Use MAMP PHP 7.0.0
# export PATH=/Applications/MAMP/bin/php/php7.0.0/bin:$PATH

# Use Vim keybindings
bindkey -v
export KEYTIMEOUT=1

# CLICOLOR for VIM color schemes
export CLICOLOR=1
export TERM=xterm-256color

# Include other dotfiles
source ~/.functions
source ~/.aliases

# Include custom scripts if exists
if [ -f ~/.custom ]; then
	source ~/.custom
fi

# Love2D
# alias love="/Applications/love.app/Contents/MacOS/love"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# Node version manager

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Postgres Version Manager
# source /Users/alfonzm/.pgvm/pgvm_env

# Run RVM
# source ~/.rvm/scripts/rvm

# History
HISTFILESIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt inc_append_history
setopt share_history
