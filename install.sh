# Symlink dotfiles to home directory

mkdir ~/.dotfiles
cp -R ./* ~/.dotfiles

# Symlink dotfiles
ln -sv ~/.dotfiles/git/.gitconfig ~
ln -sv ~/.dotfiles/zsh/.zshrc ~
ln -sv ~/.dotfiles/system/.aliases ~

# Symlink subl command
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl