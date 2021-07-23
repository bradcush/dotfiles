#!/bin/bash

DOTFILES_PATH="${HOME}/Documents/repos/dotfiles"

# Root level dotfile symlinks
ln -s "$DOTFILES_PATH"/.bash_profile ~/.bash_profile
ln -s "$DOTFILES_PATH"/.bashrc ~/.bashrc
ln -s "$DOTFILES_PATH"/.fzf.bash ~/.fzf.bash
ln -s "$DOTFILES_PATH"/.fzf.zsh ~/.fzf.zsh
ln -s "$DOTFILES_PATH"/.gitconfig ~/.gitconfig
ln -s "$DOTFILES_PATH"/.zshrc ~/.zshrc
ln -s "$DOTFILES_PATH"/.tmux.conf ~/.tmux.conf

# Create directories before symlinks
mkdir -p ~/.config/efm-langserver
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/bat

# nvim config symlinks
ln -s "$DOTFILES_PATH"/.config/efm-langserver/config.yaml ~/.config/efm-langserver/config.yaml
ln -s "$DOTFILES_PATH"/.config/nvim/completion.vim ~/.config/nvim/completion.vim
ln -s "$DOTFILES_PATH"/.config/nvim/editorconfig.vim ~/.config/nvim/editorconfig.vim
ln -s "$DOTFILES_PATH"/.config/nvim/fugitive.vim ~/.config/nvim/fugitive.vim
ln -s "$DOTFILES_PATH"/.config/nvim/fzf.vim ~/.config/nvim/fzf.vim
ln -s "$DOTFILES_PATH"/.config/nvim/hardtime.vim ~/.config/nvim/hardtime.vim
ln -s "$DOTFILES_PATH"/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s "$DOTFILES_PATH"/.config/nvim/lightline.vim ~/.config/nvim/lightline.vim
ln -s "$DOTFILES_PATH"/.config/nvim/mappings.vim ~/.config/nvim/mappings.vim
ln -s "$DOTFILES_PATH"/.config/nvim/neovim.vim ~/.config/nvim/neovim.vim
ln -s "$DOTFILES_PATH"/.config/nvim/python.vim ~/.config/nvim/python.vim
ln -s "$DOTFILES_PATH"/.config/nvim/lsp.lua ~/.config/nvim/lsp.lua
ln -s "$DOTFILES_PATH"/.config/nvim/treesitter.lua ~/.config/nvim/treesitter.lua

# Miscellaneous configuration symlinks
ln -s "$DOTFILES_PATH"/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s "$DOTFILES_PATH"/.config/bat/themes/ ~/.config/bat/
ln -s "$DOTFILES_PATH"/.config/starship.toml ~/.config/starship.toml
