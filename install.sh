#!/bin/bash

echo "\n"
echo "  ⚡ Running AlfonzM's dotfiles..."
echo "  ⚡ (http://github.com/AlfonzM/dotfiles)"

# Symlink dotfiles
echo "\n  ⚡ Symlinking .gitconfig..."
echo "    ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig"
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig

echo "\n  ⚡ Symlinking .aliases..."
echo "    ln -sf ~/.dotfiles/system/.aliases ~/.aliases"
ln -sf ~/.dotfiles/system/.aliases ~/.aliases

echo "\n  ⚡ Symlinking .functions..."
echo "    ln -sf ~/.dotfiles/system/.functions ~/.functions"
ln -sf ~/.dotfiles/system/.functions ~/.functions

echo "\n  ⚡ Symlinking .zshrc..."
echo "    ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc"
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc


# Brew installs
echo "\n  ⚡ Installing brew formulas"
echo "    sh ./homebrew/brew.sh"
#sh ./homebrew/brew.sh


# Brew cask installs
echo "\n  ⚡ Installing brew casks"
echo "    sh ./homebrew/brew-cask.sh"
#sh ./homebrew/brew-cask.sh


# Gem installs
echo "\n  ⚡ Installing ruby gems"
echo "    sh ./ruby/gems.sh"
#sh ./ruby/gems.sh


# Symlink subl command
echo "\n  ⚡ Symlinking subl command"
echo "    ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/bin/subl"
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# Symlink Sublime User packages 
echo "\n  ⚡ Symlinking Sublime User packages"
echo "    ln -sf ~/.dotfiles/sublime ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User"
mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User_backup
ln -snf ~/.dotfiles/sublime ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User


# Done!
echo "\n"
echo "  DONE! One last thing, run:  \n\n  $ source ~/.zshrc  " | cowsay -f dragon | lolcat -a
