#!/bin/bash

echo "⚡ Running AlfonzM's dotfiles..."
echo "⚡ (http://github.com/AlfonzM/dotfiles)"

# Symlink dotfiles
echo "\n⚡ Symlinking .gitconfig..."
ln -svf ./git/.gitconfig ~

echo "\n⚡ Symlinking .aliases..."
ln -svf ~/.dotfiles/system/.aliases ~/.aliases

echo "\n⚡ Symlinking .functions..."
ln -svf ~/.dotfiles/system/.functions ~/.functions

echo "\n⚡ Symlinking .zshrc..."
ln -svf ~/.dotfiles/zsh/.zshrc ~/.zshrc

# Brew installs
echo "\n⚡ Installing brew formulas"
echo "sh ./homebrew/brew.sh"
sh ./homebrew/brew.sh

# Brew cask installs
echo "\n⚡ Installing brew casks"
echo "sh ./homebrew/brew-cask.sh"
sh ./homebrew/brew-cask.sh

# Gem installs
echo "\n⚡ Installing ruby gems"
echo "sh ./ruby/gems.sh"
sh ./ruby/gems.sh

# Symlink subl command
echo "\n⚡ Symlinking subl command"
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

echo ""

echo "DONE! One last thing, run:\n\n$ source ~/.zshrc" | cowsay -f dragon | lolcat