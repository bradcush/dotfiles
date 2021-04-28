#!/bin/bash

# Install Homebrew package manager of macOS
# Homebrew Cask extends Homebrew and comes with it
# Run "brew update" afterwards for latest formulae
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Oh My ZSH framework
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions

# NVM for managing node versions
brew install nvm

# A command-line fuzzy finder
brew install fzf
"$(brew --prefix)"/opt/fzf/install

# Rg and Ag for use with FZF
brew install ripgrep
brew install the_silver_searcher

# Install neovim development version
# To upgrade HEAD run "brew reinstall neovim"
brew install --HEAD luajit
# Required luv to be reinstalled
brew install luv
brew install --HEAD neovim

# Install Alacritty GPU terminal emulator
brew install --cask alacritty
# Install kitty GPU terminal emulator
brew cask install --cask kitty

# Download plug.vim and put it in the "autoload"
# directory for use with "vim-plug" plugin manager
# https://github.com/junegunn/vim-plug
# :PlugInstall required before running neovim successfully
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# pyenv for managing python versions
brew install pyenv

# virtualenv for managing python environments
brew install --HEAD pyenv-virtualenv

# For python remote-plugins support
# python -m pip install --user --upgrade pynvim
# python2 -m pip install --upgrade pip
# python3 -m pip install --upgrade pip
# For JS remote-plugins support
yarn global add neovim

# Suggested build environment for python
# brew install openssl readline sqlite3 xz zlib

# Yarn for npm dependency mgmt
brew install yarn

# Language servers and formatters used
# with neovim LSP and efm-langserver
brew install efm-langserver
brew install pandoc
brew install markdownlint-cli
brew install shellcheck
brew install shfmt
# Globally install eslint/prettier as we to
# not rely on one location for monorepos
npm install -g eslint
npm install -g prettier
npm install -g bash-language-server
npm install -g pyright
npm install -g typescript typescript-language-server
npm install -g vim-language-server
npm install -g vscode-css-languageserver-bin
npm install -g vscode-html-languageserver-bin
npm install -g vscode-json-languageserver
npm install -g yaml-language-server

# Lua language server and formatter install
# https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
luarocks install --server=https://luarocks.org/dev luaformatter

# Install llvm with clangd for C language support
# Requires path modification in .bashrc
# (eg. export PATH="/usr/local/opt/llvm/bin:$PATH")
brew install llvm

# Used by coc-python among others
brew install ctags

# Tap all fonts before installing
brew tap homebrew/cask-fonts

# Hack Nerd Font for NERDTree and other
# plugins that might use glyphs
brew install --cask font-hack-nerd-font
# Other nice fonts
brew install --cask font-hack
# brew install --cask font-ubuntumono-nerd-font

# Terminal multiplexer
brew install tmux

# Vifm file explorer
brew install vifm

# lookatme terminal based presentations
pip install lookatme

# bat is a better replacement for cat
brew install bat

# Neofetch for system stat in cli
brew install neofetch

# Diplay directories as trees
brew install tree

# Vault secret management
brew install vault

# Display keys pressed on your screen
brew install keycastr

# TLDR man pages Node.js client
npm install -g tldr

# Ruby version manager
# brew install rbenv

# Install deps for Dashlane macOS dev
# brew install carthage
# brew install encfs
# brew install --cask osxfuse

# Do I need to custom install any of these?
# brew intstall bash
# brew install cmake
# brew install curl
