#!/bin/bash

# Install first packages
pacman -S neovim
pacman -S iwctl
pacman -S zsh

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
sudo pacman -S awesome
# Using this font everywhere
sudo pacman -S ttf-hack-nerd
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

# Screen resolution mgmt
sudo pacman -S xorg-xrandr
sudo pacman -S neofetch
sudo pacman -S archlinux-wallpaper
sudo pacman -S ukui-wallpapers

# Audio drivers setup
# Requires restart and unmute
sudo pacman -S alsa-utils
sudo pacman -S sof-firmware

# After downloading installer
# Checkout zoom.us for download
sudo pacman -U zoom_x86_64.pkg.tar.xz

# Superfluous packages
sudo pacman -S starship
sudo pacman -S tmux
# Additional tools for builing
# Things like make and gcc
sudo pacman -S base-devel
sudo pacman -S fzf
sudo pacman -S ripgrep
sudo pacman -S bat
sudo pacman -S go

# Required for installing bun
sudo pacman -S unzip
# Bun to run, test, transpile, and bundle
curl -fsSL https://bun.sh/install | bash

# Globally install eslint/prettier as we to
# not rely on one location for monorepos
# Favoring eslint_d over eslint as it launches daemon
# that kills subsequent startup times after first
npm install -g eslint_d
npm install -g prettier
npm install -g bash-language-server
npm install -g pyright
npm install -g typescript typescript-language-server
npm install -g vim-language-server
# Language servers for html, css, and json
npm install -g vscode-langservers-extracted
npm install -g yaml-language-server
npm install -g markdownlint-cli
# Other language servers
sudo pacman -S shfmt
# Arch specific language server install
# go install github.com/mattn/efm-langserver@latest
# See AUR installation instead for simplicity
# git clone https://aur.archlinux.org/efm-langserver.git
# makepkg --syncdeps --rmdeps --clean
# sudo pacman -U efm-langserver-0.0.48-1-x86_64.pkg.tar.zst
sudo pacman -S lua-language-server
sudo pacman -S luarocks
# Required for installing luaformatter
sudo pacman -S cmake
# Installation requires sudo due to install
luarocks install --server=https://luarocks.org/dev luaformatter

# Experimental Dashlane CLI
git clone git@github.com:Dashlane/dashlane-cli.git

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
