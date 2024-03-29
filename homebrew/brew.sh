#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Development
brew install alacritty
brew install eza
brew install git
brew install git-delta
brew install lazydocker
brew install lazygit
brew install lua
brew install neovim
brew install node
brew install nvm
brew install prettierd
brew install rbenv ruby-build
brew install tmux
brew install tmuxinator
brew install stow
brew install yarn

# Productivity
brew install fzf
brew install koekeishiya/formulae/yabai
brew install lf

# Language Server (for nvim)
brew install lua-language-server

# ZSH z util
brew install z

# Utilities
brew install bat
brew install coreutils
brew install ffmpeg
brew install imagemagick
brew install mas-cli/tap/mas
brew install peco
brew install pngpaste
brew install pv
brew install ranger
brew install ripgrep
brew install speedtest-cli
brew install terminal-notifier
brew install the_silver_searcher
brew install trash
brew install tree
brew install wget
brew install youtube-dl

# Fun stuff
brew install cowsay
brew install lolcat
brew install neofetch

# Remove outdated versions from the cellar
brew cleanup
