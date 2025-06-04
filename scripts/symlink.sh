#!/bin/bash

DOTFILES_PATH="$HOME/Documents/repos/dotfiles"

# Create directories before symlinks
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/bat
mkdir -p ~/.config/efm-langserver
mkdir -p ~/.config/nvim

# Root level, config, and nvim config symlinks
ln -s "$DOTFILES_PATH"/home/bradcush/.config/chromium-flags.conf ~/.config/chromium-flags.conf
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/arduino.lua ~/.config/nvim/arduino.lua
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/deeps.lua ~/.config/nvim/deeps.lua
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/dap.lua ~/.config/nvim/dap.lua
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/editorconfig.vim ~/.config/nvim/editorconfig.vim
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/fugitive.vim ~/.config/nvim/fugitive.vim
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/fzf.vim ~/.config/nvim/fzf.vim
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/globals.lua ~/.config/nvim/globals.lua
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/hardtime.vim ~/.config/nvim/hardtime.vim
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/lightline.vim ~/.config/nvim/lightline.vim
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/lsp.lua ~/.config/nvim/lsp.lua
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/mappings.vim ~/.config/nvim/mappings.vim
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/python.vim ~/.config/nvim/python.vim
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/signify.vim ~/.config/nvim/signify.vim
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/startify.vim ~/.config/nvim/startify.vim
ln -s "$DOTFILES_PATH"/home/bradcush/.config/nvim/test.vim ~/.config/nvim/test.vim
ln -s "$DOTFILES_PATH"/home/bradcush/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s "$DOTFILES_PATH"/home/bradcush/.config/efm-langserver/config.yaml ~/.config/efm-langserver/config.yaml
ln -s "$DOTFILES_PATH"/usr/share/X11/xorg.conf.d/00-keyboard.conf /usr/share/X11/xorg.conf.d/00-keyboard.conf
ln -s "$DOTFILES_PATH"/usr/share/X11/xorg.conf.d/50-mouse.conf /usr/share/X11/xorg.conf.d/50-mouse.conf
ln -s "$DOTFILES_PATH"/usr/bin/startdwm /usr/bin/startdwm
ln -s "$DOTFILES_PATH"/home/bradcush/.config/bat/themes/ ~/.config/bat/
ln -s "$DOTFILES_PATH"/home/bradcush/.config/starship.toml ~/.config/starship.toml
ln -s "$DOTFILES_PATH"/home/bradcush/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -s "$DOTFILES_PATH"/home/bradcush/.xinitrc ~/.xinitrc
ln -s "$DOTFILES_PATH"/home/bradcush/.fehbg ~/.fehbg
ln -s "$DOTFILES_PATH"/home/bradcush/.gitconfig ~/.gitconfig
ln -s "$DOTFILES_PATH"/home/bradcush/.ssh/config ~/.ssh/config
ln -s "$DOTFILES_PATH"/home/bradcush/.lua-format ~/.lua-format
ln -s "$DOTFILES_PATH"/home/bradcush/.bash_profile ~/.bash_profile
ln -s "$DOTFILES_PATH"/home/bradcush/.bashrc ~/.bashrc
ln -s "$DOTFILES_PATH"/home/bradcush/.fzf.bash ~/.fzf.bash
ln -s "$DOTFILES_PATH"/home/bradcush/.fzf.zsh ~/.fzf.zsh
ln -s "$DOTFILES_PATH"/home/bradcush/.profile ~/.profile
ln -s "$DOTFILES_PATH"/home/bradcush/.tmux.conf ~/.tmux.conf
ln -s "$DOTFILES_PATH"/home/bradcush/.zprofile ~/.zprofile
ln -s "$DOTFILES_PATH"/home/bradcush/.zshenv ~/.zshenv
ln -s "$DOTFILES_PATH"/home/bradcush/.zshrc ~/.zshrc
