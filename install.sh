echo "⚡ Running AlfonzM's dotfiles..."
echo "⚡ http://github.com/alfonzm/dotfiles"

echo "\n⚡ Install Command Line Tools for Xcode"
sudo xcode-select --install

echo "\n⚡ Setting up zsh"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode.git ~/.zsh/zsh-vi-mode
git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh/zsh-nvm

# Install Homebrew
echo "\n⚡️ Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install brew formulas
echo "\n⚡ Installing brew formulas"
brew bundle --file ~/.dotfiles/homebrew/Brewfile

# Install gh extensions
echo "\n⚡ Installing gh extensions"
sh ./git/gh.sh

# Silence "Last login" message from zsh
touch ~/.hushlogin

# Stow config directories - symlink everything in $stow_dir to home directory
# e.g. stow lazygit will symlink ~/.config/lazygit -> ~/.dotfiles/lazygit/.config/lazygit/
# e.g. stow zsh will create symlink to ~/.aliases ~/.functions ~/.zshrc, etc.
for stow_dir in git zsh nvim tmux yabai lazygit alacritty karabiner ncspot editorconfig aerospace gh-dash;
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
