echo "⚡ Running AlfonzM's dotfiles..."
echo "⚡ http://github.com/alfonzm/dotfiles"

echo "\n⚡ Install Command Line Tools for Xcode"
sudo xcode-select --install

echo "\n⚡ Setting up zsh and oh-my-zsh"
# chsh -s `which zsh`
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# Install Homebrew
echo "\n⚡️ Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install brew formulas
echo "\n⚡ Installing brew formulas"
echo "sh ./homebrew/brew.sh"
sh ./homebrew/brew.sh

# Brew cask installs
echo "\n⚡ Installing brew casks"
echo "sh ./homebrew/brew-cask.sh"
sh ./homebrew/brew-cask.sh

# Stow config directories
for stow_dir in git zsh nvim tmux yabai lazygit alacritty;
do
  echo "\n⚡ Stowing $stow_dir..."
  stow -D $stow_dir
  stow $stow_dir
done

echo "\n⚡ Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Run macOS defaults commands
echo "\n⚡ Setting up default macOS settings"
echo "sh ./macos/.osx"
sh ./macos/.osx

# Download Powerline fonts for coding and terminal
echo "⚡ Downloading Powerline fonts"
curl -L https://github.com/powerline/fonts/archive/refs/heads/master.zip -o ~/Downloads/Powerline\ Fonts.zip

# Test truecolor
echo "⚡ Truecolor test:"
curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash

# Done!
echo "\n"
echo "DONE! One last thing, run: \n\n $ src-zsh " | cowsay | lolcat
