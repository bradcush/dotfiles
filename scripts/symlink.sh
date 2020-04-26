#!/bin/bash

DOTFILES_CONFIG_PATH="${HOME}/Documents/repos/dotfiles"

# root level dotfile symbolic links
ln -s ${DOTFILES_CONFIG_PATH}/.bash_profile ~/.bash_profile
ln -s ${DOTFILES_CONFIG_PATH}/.bashrc ~/.bashrc
ln -s ${DOTFILES_CONFIG_PATH}/.zshrc ~/.zshrc
ln -s ${DOTFILES_CONFIG_PATH}/.fzf.bash ~/.fzf.bash
ln -s ${DOTFILES_CONFIG_PATH}/.fzf.zsh ~/.fzf.zsh
ln -s ${DOTFILES_CONFIG_PATH}/.gitconfig ~/.gitconfig

# nvim config symbolic links
ln -s ${DOTFILES_CONFIG_PATH}/.config/nvim/coc-config.vim ~/.config/nvim/coc-config.vim
ln -s ${DOTFILES_CONFIG_PATH}/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s ${DOTFILES_CONFIG_PATH}/.config/nvim/fugitive.vim ~/.config/nvim/fugitive.vim
ln -s ${DOTFILES_CONFIG_PATH}/.config/nvim/fzf.vim ~/.config/nvim/fzf.vim
ln -s ${DOTFILES_CONFIG_PATH}/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ${DOTFILES_CONFIG_PATH}/.config/nvim/mappings.vim ~/.config/nvim/mappings.vim
ln -s ${DOTFILES_CONFIG_PATH}/.config/nvim/lightline.vim ~/.config/nvim/lightline.vim

# bat config symbolic links
ln -s ${DOTFILES_CONFIG_PATH}/.config/bat/themes/ ~/.config/bat/

# zsh custom symbolic links
ln -s ${DOTFILES_CONFIG_PATH}/.oh-my-zsh/custom/themes/bundles.zsh-theme ~/.oh-my-zsh/custom/themes/bundles.zsh-theme
