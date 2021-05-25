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

1. Setup MySQL servers on Docker
2. Setup macOS Trackpad and Keyboard settings
3. Setup BetterTouchTool license key (check email)
4. Setup Logi Options for MX Master 3
5. Setup ObinsKit for Anne Pro 2 keyboard (see keyboards directory)

## Custom scripts

For more custom workstation-specific scripts/configs, create a `.custom` file in the home directory. This is automatically included in `.zshrc`.

```
$ touch ~/.custom
$ vim ~/.custom
```