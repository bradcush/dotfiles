#!/bin/bash

# Install Homebrew package manager of macOS
# Homebrew Cask extends Homebrew and comes with it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Oh My ZSH framework
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install neovim development version
# To upgrade HEAD run "brew reinstall neovim"
brew install --HEAD neovim

# For Python remote-plugins support
# Check python2 and python3 in $PATH first
# python2 -m pip install --user --upgrade pynvim
# python3 -m pip install --user --upgrade pynvim
# You might need to install pip for a given version
# python2 -m ensurepip --default-pip --user --upgrade
# For JS remote-plugins support
# yarn global add neovim

# NVM for managing node versions
brew install nvm

# Yarn for npm dependency mgmt
brew install yarn

# Install llvm with clangd for C language support
# Requires path modification in .bashrc
# (eg. export PATH="/usr/local/opt/llvm/bin:$PATH")
brew install llvm

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
