#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Development
brew install hub
brew install lua
brew install node
brew install nvm
brew install rbenv ruby-build
brew install tmux
brew install tmuxinator
brew install yarn

# ZSH -- commented because macOS now uses zsh by default
# brew install zsh
brew install z

# Utilities
brew install coreutils
brew install ffmpeg
brew install imagemagick
brew install mas-cli/tap/mas
brew install peco
brew install pv
brew install ranger
brew tap iveney/mocha
brew install realpath
brew install speedtest-cli
brew install terminal-notifier
brew install tree
brew install wget
brew install youtube-dl

# Fun stuff
brew install cowsay

# Remove outdated versions from the cellar
brew cleanup
