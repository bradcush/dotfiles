#!/bin/bash

# Install Homebrew package manager of macOS
# Homebrew Cask extends Homebrew and comes with it
# Run "brew update" afterwards for latest formulae
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Alacritty GPU terminal emulator
brew install --cask alacritty
# Install kitty GPU terminal emulator
# brew cask install --cask kitty

# Tap all fonts before installing
brew tap homebrew/cask-fonts
# Hack Nerd Font has strong differences between
# similar characters and supports glyphs
brew install --cask font-hack-nerd-font
brew install --cask font-hack
# brew install --cask font-ubuntumono-nerd-font

# Terminal multiplexer
brew install tmux

# Configurable cross-shell prompt
brew install starship

# Install zsh-autosuggestions
brew install zsh-autosuggestions

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
yarn global -g neovim

# NVM for managing node versions
brew install nvm

# pyenv for managing python versions
brew install pyenv

# virtualenv for managing python environments
brew install --HEAD pyenv-virtualenv

# Suggested build environment for python
# brew install openssl readline sqlite3 xz zlib

# Yarn for npm dependency mgmt
brew install yarn

# Language servers and formatters used
# with Neovim LSP and efm-langserver
brew install efm-langserver
brew install pandoc
brew install markdownlint-cli
brew install shellcheck
brew install shfmt
# Globally install eslint/prettier as we to
# not rely on one location for monorepos
# Favoring eslint_d over eslint as it launches daemon
# that kills subsequent startup times after first
yarn global add eslint_d
yarn global add prettier
yarn global add bash-language-server
yarn global add pyright
yarn global add typescript typescript-language-server
yarn global add vim-language-server
# Language servers for html, css, and json
yarn global add vscode-langservers-extracted
yarn global add yaml-language-server

# Lua language server and formatter install
# https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
luarocks install --server=https://luarocks.org/dev luaformatter

# Install llvm with clangd for C language support
# Requires path modification in .bashrc
# (eg. export PATH="/usr/local/opt/llvm/bin:$PATH")
brew install llvm

# Used by coc-python among others
brew install ctags

# Vault secret management
brew install vault

# TLDR man pages Node.js client
yarn global add tldr

# lookatme terminal based presentations
pip install lookatme

# Display keys pressed on your screen
brew install keycastr

# Neofetch for system stat in cli
brew install neofetch

# Display directories as trees
brew install tree
