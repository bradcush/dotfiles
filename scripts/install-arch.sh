#!/bin/bash

# Reference common install script
. "$HOME/Documents/repos/dotfiles/scripts/install.sh"

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
