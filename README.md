# AlfonzM's dotfiles

⚡️ Dotfiles for when my laptop gets stolen, or I get a new computer — hopefully it's the latter.

## Overview

Contains:

- zsh config
- brew installs (and cask apps)
- iTerm2 config
- aliases
- functions
- sublime settings

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
1. Setup BetterTouchTool license key (check email)
1. Setup Alfred license key (check email) and sync Alfred preferences (see `alfred` directory)

#### Peripherals
1. Setup macOS Trackpad and Keyboard settings
1. Setup Logi Options for MX Master 3
1. Setup ObinsKit for Anne Pro 2 keyboard (see `keyboards` directory)

#### Sublime Text
1. Setup Sublime Text [SyncSettings](https://packagecontrol.io/packages/Sync%20Settings) and download settings from Gist

### How to install Boxy Theme manually for Sublime Text 4

1. Copy `sublime/Boxy/Packages/User/Boxy Theme` to `~/Library/Application Support/Sublime Text/Packages/User`.
1. Copy `sublime/Installed Packages/Boxy Theme.sublime-package` file to `~/Library/Application Support/Sublime Text/Installed Packages`.
1. Edit `~/Library/Application Support/Sublime Text/Packages/User/Package Control.sublime-settings` and add `Boxy Theme` to `installed_packages` array.

## Custom scripts

For more custom workstation-specific scripts/configs, create a `.custom` file in the home directory. This is automatically included in `.zshrc`.

```
$ touch ~/.custom
$ vim ~/.custom
```
