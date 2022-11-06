# AlfonzM's dotfiles

![An image of Alfonz's workspace including a laptop and an external monitor that's showing code on Vim — the vastly superior code editor. :wink:](img/dotfiles.jpg)

⚡️ Dotfiles for when my laptop gets stolen, or I get a new computer — hopefully it's the latter.

## Overview

Contains:

- zsh config
- aliases
- Neovim config
- tmux config
- lf, lazygit, lazydocker config
- Homebrew installs
- Alacritty config
- macOS System Preferences
- Alfred workflows
- BetterTouchTool settings

## Installation

```
$ git clone https://github.com/AlfonzM/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ sh install.sh
```

### Other Steps

#### MySQL
1. Setup MySQL servers on Docker

#### Productivity Tools

BetterTouchTool

1. Setup BetterTouchTool license key (check email)
1. Setup Alfred license key (check email)
1. Go to Alfred > Preferences > Advanced > Set preferences folder to `~/.dotfiles/alfred`

Yabai

1. After brew installing yabai, run `brew services start yabai`.
1. Setup permissions in System Preferences after starting the service. ([Guide](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)))

#### Peripherals
1. Setup [macOS](/macos) Trackpad and Keyboard settings
1. Setup [Logi Options](/mouse) for MX Master 3
1. Setup [Anne Pro 2](/keyboards/annepro2) keyboard

#### Karabiner

1. Go to Complex Modifications, add "caps_lock to Esc and Control"
1. Go to Parameters, set `to_if_alone_timeout_milliseconds` to 500

#### Sublime Text
1. Setup Sublime Text [SyncSettings](https://packagecontrol.io/packages/Sync%20Settings) and download settings from Gist

### How to install Boxy Theme manually for Sublime Text 4

1. Copy `sublime/Boxy/Packages/User/Boxy Theme` to `~/Library/Application Support/Sublime Text/Packages/User`.
1. Copy `sublime/Installed Packages/Boxy Theme.sublime-package` file to `~/Library/Application Support/Sublime Text/Installed Packages`.
1. Edit `~/Library/Application Support/Sublime Text/Packages/User/Package Control.sublime-settings` and add `Boxy Theme` to `installed_packages` array.

## TODO

- Ansible
- Stow bin directory?
- Script for installing npm default-packages (see nvm directory)
- Script for installing pip plugins. For now, manually install the ff:
  - `python3 -m pip install pynvim` — required for some nvim plugins
  - `pip install lookatme`
