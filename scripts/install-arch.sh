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

# Arch specific language server install
# go install github.com/mattn/efm-langserver@latest
sudo pacman -S lua-language-server
# Simple X display locker
sudo pacman -S slock
# Managing ssh and gpg keys
sudo pacman -S keychain
# Command-line clipboard
sudo pacman -S xclip
