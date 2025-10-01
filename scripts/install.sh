#!/bin/bash

# Bun to run, test, transpile, and bundle
curl -fsSL https://bun.sh/install | bash

# NVM for managing node versions
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

## Install Rust using rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Yarn for npm dependency mgmt
# yarn global bin shows binary path
# https://yarnpkg.com/getting-started/install
npm install -g corepack

# For JS remote-plugins support
npm install -g neovim

# base16-fzf colorscheme repository
# Expected to be cloned with other repositories
git clone git@github.com:fnune/base16-fzf.git

# Globally install eslint/prettier as we to
# not rely on one location for monorepos
# Favoring eslint_d over eslint as it launches daemon
# that kills subsequent startup times after first
npm install -g eslint_d
# efm-langserver setup using this formatter
# It's now needed as a separate package
npm install -g eslint-formatter-visualstudio
npm install -g prettier
# Seems like bash-language-server isn't needed
# and might be included in Neovim by default
npm install -g bash-language-server
npm install -g pyright
npm install -g typescript typescript-language-server
npm install -g vim-language-server
# Language servers for html, css, and json
npm install -g vscode-langservers-extracted
npm install -g yaml-language-server

# Experimental Dashlane CLI
git clone git@github.com:Dashlane/dashlane-cli.git
# Install using Dashlane homebrew
# brew install dashlane/tap/dashlane-cli

# TLDR man pages Node.js client
npm install -g tldr

# Install cht.sh client
# https://github.com/chubin/cheat.sh
PATH_DIR="$HOME/bin" && mkdir -p "$PATH_DIR"
curl https://cht.sh/:cht.sh >"$PATH_DIR/cht.sh"
chmod +x "$PATH_DIR/cht.sh"

# gittuf security wrapper for git
git clone git@github.com:gittuf/gittuf.git

# For creating SMOM using SBOMit specs
go get github.com/testifysec/protobomit

# Arch specific installation
# Install first packages
pacman -S iwctl
pacman -S zsh
# Neovim package is currently latest stable release, use
# AUR package neovim-git for latest development version
pacman -S neovim

# New user with default group
# sudo w/o assigning other groups
useradd -m bradcush
passwd bradcush
pacman -S sudo

# Change default shell
shsh -s /usr/bin/zsh

# Window management
sudo pacman -S xorg-server
# Example for intel graphics
# sudo pacman -S xf86-video-intel
# Setup both .xinitrc and .xserverrc
sudo pacman -S xorg-init

# DWM and dmenu for simpler windows
git clone https://aur.archlinux.org/dwm.git
sudo pacman -S dmenu

# Using this font everywhere
sudo pacman -S ttf-hack-nerd
# Needed to resolve many miscellaneous characters
# https://en.wikipedia.org/wiki/Miscellaneous_Symbols
sudo pacman -S ttf-dejavu
# startx manually for now

# Other packages
sudo pacman -S alacritty
sudo pacman -S git
# Pick pipewire-jack audio
# Remembered as recommended
sudo pacman -S chromium
# For theming GTK applications
# Choose xdg-desktop-portal-gtk
# Dark mode can then be set
sudo pacman -S xdg-desktop-portal

# Setting dark themes
sudo pacman -S gnome-themes-extra
git clone https://aur.archlinux.org/adwaita-qt-git.git

# Screen resolution mgmt
sudo pacman -S xorg-xrandr
sudo pacman -S neofetch

# Set wallpaper
sudo pacman -S feh

# Audio drivers setup
# Requires restart and unmute
sudo pacman -S alsa-utils
sudo pacman -S sof-firmware

# ZOOM for video conferencing
git clone https://aur.archlinux.org/zoom.git

# Configurable cross-shell prompt
sudo pacman -S starship

# Terminal multiplexer
sudo pacman -S tmux

# Additional tools for builing
# Things like make and gcc
sudo pacman -S base-devel

# A command-line fuzzy finder
sudo pacman -S fzf

# Rg and Ag for use with fzf
sudo pacman -S the_silver_searcher
sudo pacman -S ripgrep

# bat replaces cat
sudo pacman -S bat

# Go for compiling hexokinase and building
# other software like efm-langserver
sudo pacman -S go

# Required for installing bun
sudo pacman -S unzip

# Other language servers
sudo pacman -S shfmt
sudo pacman -S shellcheck
sudo pacman -S pandoc
npm install -g markdownlint-cli

# Arch specific language server install
# go install github.com/mattn/efm-langserver@latest
# https://wiki.archlinux.org/title/Arch_User_Repository
# See AUR installation instead for simplicity
git clone https://aur.archlinux.org/efm-langserver.git
# makepkg --syncdeps --rmdeps --clean
# sudo pacman -U efm-langserver-0.0.48-1-x86_64.pkg.tar.zst
# sudo pacman -Rs efm-langserver
git clone https://aur.archlinux.org/jdtls.git

sudo pacman -S lua-language-server
sudo pacman -S luarocks
# Required for luaformatter
sudo pacman -S cmake
# Installation requires sudo due to install
luarocks install --server=https://luarocks.org/dev luaformatter

# Dashlane CLI for password management
https://dashlane.github.io/dashlane-cli/install

# TLDR man pages Node.js client
npm install -g tldr

# Simple X display locker
sudo pacman -S slock

# Managing ssh and gpg keys
sudo pacman -S keychain

# Command-line clipboard
sudo pacman -S xclip

# Viewing route for packets
sudo pacman -S traceroute

# Display directories as trees
sudo pacman -S tree

# IRC client in the terminal installed
# by default with the live environment
sudo pacman -S irssi

# Install zsh-autosuggestions
sudo pacman -S zsh-autosuggestions

# Install zsh-syntax-highlighting
sudo pacman -S zsh-syntax-highlighting

# Anki flashcards application
git clone https://aur.archlinux.org/anki.git

# Useful for passing passwords but should be used
# carefully as keys are often the best choice
sudo pacman -S sshpass

# Command-line screenshot
sudo pacman -S scrot

# Note taking
sudo pacman -S obsidian

# LLVM toolchain
# https://wiki.archlinux.org/title/LLVM
sudo pacman -S clang lld lldb llvm libc++ libclc polly

# Bluetooth for keyboard
sudo pacman -S bluez bluez-utils
sudo pacman -S usbutils

# Information about input devices
sudo pacman -S xorg-xinput

# GNU Octave replaces MATLAB
# You can use the GUI or CLI octave-cli
sudo pacman -S octave
# Using symbolic for solving equations
# Install in Octave and load in ~/.octaverc
# https://gnu-octave.github.io/packages/symbolic/

# Tracing system calls
sudo pacman -S strace

# Basic calculator utility
sudo pacman -S bc

# For python remote-plugins support
# Included pynvim as dependency
# pip3 install neovim

# AWS CLI
sudo pacman -S aws-cli

# Heroku CLI
git clone https://aur.archlinux.org/heroku-cli.git

# Create ZIP archives
sudo pacman -S zip

# Required for password protected ZIP
# archives which zip didn't support
sudo pacman -S p7zip

# PostgreSQL database system
sudo pacman -S postgresql

# pgModeler PostgreSQL Database modeler
git clone https://aur.archlinux.org/pgmodeler.git

# LibreOffice for working documents
sudo pacman -S libreoffice-still

# Latex LSP support
sudo pacman -S texlab
sudo pacman -S texlive-latexindent
sudo pacman -S perl-yaml-tiny
sudo pacman -S perl-file-homedir
sudo pacman -S tectonic

# Better alternative to top
sudo pacman -S bashtop

# For following the MoonMath Manual
# Specified maxima-sbcl during install
sudo pacman -S sagemath

# Docker for containers
sudo pacman -S docker

# Solidity (programming) prebuilt binary
# Safer as coming from AUR with small PKGBUILD
git clone https://aur.archlinux.org/solidity-bin.git

# Solidity linting
npm install -g solhint
