#!/bin/bash

DOTFILES_PATH="${HOME}/Documents/repos/dotfiles"

# root level dotfile symbolic links
ln -s ${DOTFILES_PATH}/.bash_profile ~/.bash_profile
ln -s ${DOTFILES_PATH}/.bashrc ~/.bashrc
ln -s ${DOTFILES_PATH}/.fzf.bash ~/.fzf.bash
ln -s ${DOTFILES_PATH}/.fzf.zsh ~/.fzf.zsh
ln -s ${DOTFILES_PATH}/.gitconfig ~/.gitconfig
ln -s ${DOTFILES_PATH}/.zshrc ~/.zshrc
ln -s ${DOTFILES_PATH}/.tmux.conf ~/.tmux.conf

# nvim config symbolic links
ln -s ${DOTFILES_PATH}/.config/nvim/coc-config.vim ~/.config/nvim/coc-config.vim
ln -s ${DOTFILES_PATH}/.config/nvim/editorconfig.vim ~/.config/nvim/editorconfig.vim
ln -s ${DOTFILES_PATH}/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s ${DOTFILES_PATH}/.config/nvim/fugitive.vim ~/.config/nvim/fugitive.vim
ln -s ${DOTFILES_PATH}/.config/nvim/fzf.vim ~/.config/nvim/fzf.vim
ln -s ${DOTFILES_PATH}/.config/nvim/hardtime.vim ~/.config/nvim/hardtime.vim
ln -s ${DOTFILES_PATH}/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ${DOTFILES_PATH}/.config/nvim/lightline.vim ~/.config/nvim/lightline.vim
ln -s ${DOTFILES_PATH}/.config/nvim/mappings.vim ~/.config/nvim/mappings.vim
ln -s ${DOTFILES_PATH}/.config/nvim/neovim.vim ~/.config/nvim/neovim.vim
ln -s ${DOTFILES_PATH}/.config/nvim/python.vim ~/.config/nvim/python.vim

## lightline custom symbolic links
ln -s ${DOTFILES_PATH}/.vim/bundle/lightline.vim/autoload/lightline/colorscheme/one_bradley.vim ~/.vim/bundle/lightline.vim/autoload/lightline/colorscheme/one_bradley.vim

# terminal configuration symbolic links
ln -s ${DOTFILES_PATH}/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# bat config symbolic links
ln -s ${DOTFILES_PATH}/.config/bat/themes/ ~/.config/bat/

# zsh custom symbolic links
ln -s ${DOTFILES_PATH}/.oh-my-zsh/custom/themes/bundles.zsh-theme ~/.oh-my-zsh/custom/themes/bundles.zsh-theme
