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
plugins=(git brew copydir gitignore github common-aliases laravel5)

# Enable Z
. ~/.oh-my-zsh/plugins/z/z.sh

# Enable oh my zsh
source $ZSH/oh-my-zsh.sh

# Enable oh my zsh Syntax Highlighting
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
. `brew --prefix`/etc/profile.d/z.sh

# Highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')

PROMPT=$'\n''[%T] %{$fg[green]%}%~%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} $ '


# Python SDK
export PYTHONPATH=/Users/MacMini04/Documents/Dev/Python/SDK/pynaoqi-python2.7-2.1.4.13-mac64
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:/Users/MacMini04/Documents/Dev/Python/SDK/pynaoqi-python2.7-2.1.4.13-mac64
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Use PHP 7.0.0
export PATH=/Applications/MAMP/bin/php/php7.0.0/bin:$PATH

# Use Vim keybindings
bindkey -v
export KEYTIMEOUT=1

# CLICOLOR for VIM color schemes

export CLICOLOR=1
export TERM=xterm-256color

# Include other dotfiles
source ~/.functions
source ~/.aliases
