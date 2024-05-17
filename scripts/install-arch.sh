#!/bin/bash

# Reference common install script
. "$HOME/Documents/repos/dotfiles/scripts/install.sh"

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

# DWM and dmenu for simpler windows
git clone https://aur.archlinux.org/dwm.git
sudo pacman -S dmenu
# Cheatsheet until memorized
# [Mod]+p to run a command with dmenu
# [Mod]+j and [Mod]+k to cycle apps in a tag
# [Mod]+m switch to monocle mode
# [Mod]+f switch to floating mode
# [Shift]+[Mod]+<tag> to move window to tag
# [Shift]+[Mod]+q to shutdown dwm cleanly
# [Shift]+[Mod]+c to quit a window

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

# Configurable cross-shell prompt
sudo pacman -S starship

# Terminal multiplexer
sudo pacman -S tmux

# Additional tools for builing
# Things like make and gcc
sudo pacman -S base-devel

# A command-line fuzzy finder
sudo pacman -S fzf

# Ag for use with fzf
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
# We should use npm for both systems
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

# IRC client installed with live
sudo pacman -S irssi

# Install zsh-autosuggestions
sudo pacman -S zsh-autosuggestions

# Install zsh-syntax-highlighting
sudo pacman -S zsh-syntax-highlighting

# Slack desktop application
git clone https://aur.archlinux.org/slack-desktop.git

# Anki application
git clone https://aur.archlinux.org/anki.git
