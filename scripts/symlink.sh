#!/bin/bash

DOTFILES_PATH="$HOME/Documents/repos/dotfiles"

# Root level dotfile symlinks
ln -s "$DOTFILES_PATH"/.bash_profile ~/.bash_profile
ln -s "$DOTFILES_PATH"/.bashrc ~/.bashrc
ln -s "$DOTFILES_PATH"/.fzf.bash ~/.fzf.bash
ln -s "$DOTFILES_PATH"/.fzf.zsh ~/.fzf.zsh
ln -s "$DOTFILES_PATH"/.profile ~/.profile
ln -s "$DOTFILES_PATH"/.tmux.conf ~/.tmux.conf
ln -s "$DOTFILES_PATH"/.zprofile ~/.zprofile
ln -s "$DOTFILES_PATH"/.zshenv ~/.zshenv
ln -s "$DOTFILES_PATH"/.zshrc ~/.zshrc

# Create directories before symlinks
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/bat
mkdir -p ~/.config/efm-langserver
mkdir -p ~/.config/nvim
# mkdir -p ~/Library/Arduino15

# nvim config symlinks
ln -s "$DOTFILES_PATH"/.config/efm-langserver/config.yaml ~/.config/efm-langserver/config.yaml
# ln -s "$DOTFILES_PATH"/.config/nvim/arduino.vim ~/.config/nvim/arduino.vim
ln -s "$DOTFILES_PATH"/.config/nvim/deeps.lua ~/.config/nvim/deeps.lua
ln -s "$DOTFILES_PATH"/.config/nvim/dap.lua ~/.config/nvim/dap.lua
ln -s "$DOTFILES_PATH"/.config/nvim/editorconfig.vim ~/.config/nvim/editorconfig.vim
ln -s "$DOTFILES_PATH"/.config/nvim/fugitive.vim ~/.config/nvim/fugitive.vim
ln -s "$DOTFILES_PATH"/.config/nvim/fzf.vim ~/.config/nvim/fzf.vim
ln -s "$DOTFILES_PATH"/.config/nvim/globals.lua ~/.config/nvim/globals.lua
ln -s "$DOTFILES_PATH"/.config/nvim/hardtime.vim ~/.config/nvim/hardtime.vim
ln -s "$DOTFILES_PATH"/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s "$DOTFILES_PATH"/.config/nvim/lightline.vim ~/.config/nvim/lightline.vim
ln -s "$DOTFILES_PATH"/.config/nvim/lsp.lua ~/.config/nvim/lsp.lua
ln -s "$DOTFILES_PATH"/.config/nvim/mappings.vim ~/.config/nvim/mappings.vim
ln -s "$DOTFILES_PATH"/.config/nvim/python.vim ~/.config/nvim/python.vim
ln -s "$DOTFILES_PATH"/.config/nvim/signify.vim ~/.config/nvim/signify.vim
ln -s "$DOTFILES_PATH"/.config/nvim/startify.vim ~/.config/nvim/startify.vim
ln -s "$DOTFILES_PATH"/.config/nvim/test.vim ~/.config/nvim/test.vim

# Miscellaneous configuration symlinks
ln -s "$DOTFILES_PATH"/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s "$DOTFILES_PATH"/.config/bat/themes/ ~/.config/bat/
ln -s "$DOTFILES_PATH"/.config/starship.toml ~/.config/starship.toml
ln -s "$DOTFILES_PATH"/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
# ln -s "$DOTFILES_PATH"/Library/Arduino15/arduino-cli.yaml ~/Library/Arduino15/arduino-cli.yaml
ln -s "$DOTFILES_PATH"/.lua-format ~/.lua-format

if [[ $OSTYPE == "darwin"* ]]; then
  # Symlink specific dotfiles for macOS
  ln -s "$DOTFILES_PATH"/.gitconfig-arch ~/.gitconfig
  ln -s "$DOTFILES_PATH"/.ssh/config-macos ~/.ssh/config
fi

if [[ $OSTYPE == 'linux-gnu' ]]; then
  # Symlink specific dotfiles for Arch Linux
  ln -s "$DOTFILES_PATH"/.gitconfig-macos ~/.gitconfig
  ln -s "$DOTFILES_PATH"/.config/chromium-flags.conf ~/.config/chromium-flags.conf
  ln -s "$DOTFILES_PATH"/.ssh/config-arch ~/.ssh/config
  # Specifically for the X Window System
  ln -s "$DOTFILES_PATH"/.xinitrc ~/.xinitrc
  ln -s "$DOTFILES_PATH"/.fehbg ~/.fehbg
  ln -s "$DOTFILES_PATH"/usr/bin/startdwm /usr/bin/startdwm
  ln -s "$DOTFILES_PATH"/usr/share/X11/xorg.conf.d/50-mouse.conf /usr/share/X11/xorg.conf.d/50-mouse.conf
fi
