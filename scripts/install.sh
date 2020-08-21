#!/bin/bash

# Install Homebrew package manager of macOS
# Homebrew Cask extends Homebrew and comes with it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Oh My ZSH framework
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install neovim development version
# To upgrade HEAD run "brew reinstall neovim"
brew install --HEAD neovim

# Download plug.vim and put it in the "autoload"
# directory for use with "vim-plug" plugin manager
# https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# pyenv for managing python versions
brew install pyenv

# virtualenv for managing python environments
brew install --HEAD pyenv-virtualenv

# For python remote-plugins support
# python -m pip install --user --upgrade pynvim
# For JS remote-plugins support
# yarn global add neovim

# NVM for managing node versions
brew install nvm

# Suggested build environment for python
# brew install openssl readline sqlite3 xz zlib

# Yarn for npm dependency mgmt
brew install yarn

# Install llvm with clangd for C language support
# Requires path modification in .bashrc
# (eg. export PATH="/usr/local/opt/llvm/bin:$PATH")
brew install llvm

# Used by coc-python among others
brew install ctags

# Install Alacritty GPU terminal emulator
brew cask install alacritty
# Install kitty GPU terminal emulator
brew cask install kitty

# Hack Nerd Font for NERDTree and other
# plugins that might use glyphs
brew cask install font-hack-nerd-font

# Other nice fonts
brew cask install font-hack
brew cask install font-ubuntumono-nerd-font

# Terminal multiplexer
brew install tmux

# Vifm file explorer
brew install vifm

# bat is a better replacement for cat
brew install bat

# A command-line fuzzy finder
brew install fzf

# Neofetch for system stat in cli
brew install neofetch

# Diplay directories as trees
brew install tree

# Vault secret management
brew install vault

# Display keys pressed on your screen
brew install keycastr

# TLDR man pages Node.js client
npm install -g tldr

# Ruby version manager
# brew install rbenv

# Install deps for Dashlane macOS dev
# brew install carthage
# brew install encfs
# brew cask install osxfuse

# Do I need to custom install any of these?
# brew intstall bash
# brew install cmake
# brew install curl
