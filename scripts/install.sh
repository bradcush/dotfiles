#!/bin/bash

# Install Homebrew package manager of macOS
# Homebrew Cask extends Homebrew and comes with it
# Run "brew update" afterwards for latest formulae
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Yarn for npm dependency mgmt
# Global symlinks using /opt/homebrew/bin
# yarn global bin shows binary path
brew install yarn

# PNPM for npm dependency mgmt
# Fixed PNPM version for Dashlane
npm install -g pnpm@6.32.8
# Shell tab-completion for pnpm
pnpm install-completion bash
pnpm install-completion zsh

# Install Alacritty GPU terminal emulator
brew install --cask alacritty
# Install kitty GPU terminal emulator
# brew cask install --cask kitty

# Tap all fonts before installing
brew tap homebrew/cask-fonts
# Hack Nerd Font has strong differences between
# similar characters and supports glyphs
# brew install --cask font-hack
brew install --cask font-hack-nerd-font
# brew install --cask font-ubuntumono-nerd-font

# Terminal multiplexer
brew install tmux

# Configurable cross-shell prompt
brew install starship

# Install zsh-autosuggestions
brew install zsh-autosuggestions

# Install zsh-autocomplete
# git clone git@github.com:marlonrichert/zsh-autocomplete.git

# Install zsh-syntax-highlighting
brew install zsh-syntax-highlighting

# A command-line fuzzy finder
brew install fzf
"$(brew --prefix)"/opt/fzf/install

# Rg and Ag for use with fzf
brew install ripgrep
brew install the_silver_searcher

# base16-fzf colorscheme repository
# Expected to be cloned with other repositories
git clone git@github.com:fnune/base16-fzf.git

# bat is a better replacement for cat
brew install bat

# Install Neovim development version
# To upgrade HEAD run "brew reinstall neovim"
# brew install --HEAD luajit
# Required luv to be reinstalled
# brew install luv
brew install --HEAD neovim

# Go for compiling hexokinase
brew install go

# Download plug.vim and put it in the "autoload"
# directory for use with "vim-plug" plugin manager
# https://github.com/junegunn/vim-plug
# :PlugInstall required before running Neovim successfully
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# For python remote-plugins support
# python -m pip install --user --upgrade pynvim
# python2 -m pip install --upgrade pip
# python3 -m pip install --upgrade pip
# For JS remote-plugins support
npm install -g neovim

# NVM for managing node versions
brew install nvm

# pyenv for managing python versions
brew install pyenv

# virtualenv for managing python environments
brew install --HEAD pyenv-virtualenv

## Install Rust using rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Language servers and formatters used
# with Neovim LSP and efm-langserver
brew install efm-langserver
brew install pandoc
brew install markdownlint-cli
brew install rust-analyzer
brew install shellcheck
brew install shfmt
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
# Lua language server and formatter install (LSP requires compilation)
# https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
git clone https://github.com/sumneko/lua-language-server
luarocks install --server=https://luarocks.org/dev luaformatter
# Compiling lua-language-server requires ninja
brew install ninja

# Install llvm with clangd for C language support
# Requires path modification in .bashrc
# (eg. export PATH="/usr/local/opt/llvm/bin:$PATH")
brew install llvm

# Arduino CLI supported by vim-arduino
brew install arduino-cli

# Vault secret management
brew install vault

# TLDR man pages Node.js client
npm install -g tldr

# lookatme terminal based presentations
# Install as part of project python environment
# pip install lookatme

# Display keys pressed on your screen
brew install keycastr

# Neofetch for system stat in cli
brew install neofetch

# Display directories as trees
brew install tree

# macOS trash cli
brew install trash

# gpg for commit signatures
# GPG Suite used intead for keychain
# https://gpgtools.org
brew install gpg
