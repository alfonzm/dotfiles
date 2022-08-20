#!/bin/bash

echo "\n"
echo "⚡ Running AlfonzM's dotfiles..."
echo "⚡ http://github.com/AlfonzM/dotfiles"

# Symlink dotfiles
echo "\n⚡ Symlinking .gitconfig..."
echo "ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig"
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig

echo "\n⚡ Symlinking .aliases..."
echo "ln -sf ~/.dotfiles/system/.aliases ~/.aliases"
ln -sf ~/.dotfiles/system/.aliases ~/.aliases

echo "\n⚡ Symlinking .functions..."
echo "ln -sf ~/.dotfiles/system/.functions ~/.functions"
ln -sf ~/.dotfiles/system/.functions ~/.functions

echo "\n⚡ Symlinking .zshrc..."
echo "ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc"
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc

echo "\n⚡ Symlinking alacritty.yml..."
echo "ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc"
ln -sf ~/.dotfiles/alacritty ~/.config

echo "\n⚡ Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "\n⚡ Symlinking tmux..."
echo "ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf"
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
mkdir ~/.tmux
ln -sf ~/.dotfiles/tmux/reset ~/.tmux/reset

echo "\n⚡ Setting up zsh and oh-my-zsh"
# chsh -s `which zsh`
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Homebrew
echo "\n⚡️ Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install brew formulas
echo "\n⚡ Installing brew formulas"
echo "    sh ./homebrew/brew.sh"
sh ./homebrew/brew.sh

# Brew cask installs
echo "\n⚡ Installing brew casks"
echo "    sh ./homebrew/brew-cask.sh"
sh ./homebrew/brew-cask.sh

# Mac App Store installs
echo "\n⚡ Installing Mac App Store apps"
echo "    sh ./mas/mas.sh"
sh ./mas/mas.sh

# Symlink subl command
echo "\n⚡ Symlinking subl command"
echo "ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/bin/subl"
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# Download Powerline fonts for coding and terminal
curl -L https://github.com/powerline/fonts/archive/refs/heads/master.zip -o ~/Downloads/Powerline\ Fonts.zip

# Symlink Alacritty config
echo "\n⚡ Symlinking Alacritty config"
echo "ln -sf ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml"
ln -sf ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# Test truecolor
echo "⚡ Truecolor test:"
curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash

# Done!
echo "\n"
echo "DONE! One last thing, run: \n\n $ source ~/.zshrc " | cowsay | lolcat
