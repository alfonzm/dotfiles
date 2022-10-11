#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Development
brew install alacritty
brew install ctags
brew install hub
brew install lua
brew install neovim
brew install node
brew install nvm
brew install rbenv ruby-build
brew install tmux
brew install tmuxinator
brew install yarn

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
