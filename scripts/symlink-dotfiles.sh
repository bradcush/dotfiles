#!/bin/bash

# root level dotfile symbolic links
ln -s ~/Documents/repos/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/Documents/repos/dotfiles/.bashrc ~/.bashrc
ln -s ~/Documents/repos/dotfiles/.zshrc ~/.zshrc
ln -s ~/Documents/repos/dotfiles/.fzf.bash ~/.fzf.bash
ln -s ~/Documents/repos/dotfiles/.fzf.zsh ~/.fzf.zsh
ln -s ~/Documents/repos/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Documents/repos/dotfiles/.importjs.js ~/.importjs.js

# nvim config symbolic links
ln -s ~/Documents/repos/dotfiles/.config/nvim/coc-config.vim ~/.config/nvim/coc-config.vim
ln -s ~/Documents/repos/dotfiles/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s ~/Documents/repos/dotfiles/.config/nvim/fugitive.vim ~/.config/nvim/fugitive.vim
ln -s ~/Documents/repos/dotfiles/.config/nvim/fzf.vim ~/.config/nvim/fzf.vim
ln -s ~/Documents/repos/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/Documents/repos/dotfiles/.config/nvim/mappings.vim ~/.config/nvim/mappings.vim

# ranger config symbolic links
ln -s ~/Documents/repos/dotfiles/.config/ranger/rifle.conf ~/.config/ranger/rifle.conf
