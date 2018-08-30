#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Development
brew install heroku
brew install lua
brew install node
brew install nvm
brew install rbenv ruby-build rbenv-gem-rehash
brew install yarn

# ZSH
brew install zsh
brew install z

# Utilities
brew install coreutils
brew install ffmpeg --with-libvpx
brew install imagemagick --with-webp
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
