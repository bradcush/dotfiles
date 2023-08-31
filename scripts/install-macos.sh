#!/bin/bash

# Install Homebrew package manager of macOS
# Homebrew Cask extends Homebrew and comes with it
# Run brew update afterwards for latest formulae
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Bun to run, test, transpile, and bundle
curl -fsSL https://bun.sh/install | bash

# Yarn for npm dependency mgmt
# Global symlinks using /opt/homebrew/bin
# yarn global bin shows binary path
# https://yarnpkg.com/getting-started/install
# Shipped with Node.js >= 16.10
corepack enable
# Update global yarn version
corepack prepare yarn@stable --activate

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

# Install zsh-syntax-highlighting
brew install zsh-syntax-highlighting

# A command-line fuzzy finder
brew install fzf
/opt/homebrew/opt/fzf/install

# Rg and Ag for use with fzf
brew install ripgrep
brew install the_silver_searcher

# base16-fzf colorscheme repository
# Expected to be cloned with other repositories
git clone git@github.com:fnune/base16-fzf.git

# bat is a better replacement for cat
brew install bat

# Install Neovim development version
# To upgrade HEAD run brew reinstall neovim
# You can also brew upgrade neovim
# brew install --HEAD luajit
# Required luv to be reinstalled
# brew install luv
brew install --HEAD neovim

# Go for compiling hexokinase
brew install go

# Download plug.vim and put it in the autoload
# directory for use with vim-plug plugin manager
# https://github.com/junegunn/vim-plug
# :PlugInstall required before running Neovim successfully
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# NVM for managing node versions
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

# For JS remote-plugins support
npm install -g neovim

# pyenv for managing python versions
# Set both version with 3 first
# pyenv global 3.11.3 2.7.18
brew install pyenv

# For python remote-plugins support
# python -m pip install neovim

# virtualenv for managing python environments
brew install --HEAD pyenv-virtualenv

## Install Rust using rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Language servers and formatters used
# with Neovim LSP and efm-langserver
brew install efm-langserver
brew install lua-language-server
brew install pandoc
brew install markdownlint-cli
brew install rust-analyzer
brew install shellcheck
brew install shfmt
brew install texlab
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

# LuaRocks package mgmt
brew install luarocks
# Better Lua source code formatting
luarocks install --server=https://luarocks.org/dev luaformatter

# Install llvm with clangd for C language support
# Requires path modification in .bashrc
# (eg. export PATH="/usr/local/opt/llvm/bin:$PATH")
brew install llvm

# Arduino language server module
# https://github.com/arduino/arduino-language-server
go install github.com/arduino/arduino-language-server@latest

# Arduino CLI supported by vim-arduino
brew install arduino-cli

# Experimental Dashlane CLI
git clone git@github.com:Dashlane/dashlane-cli.git
# Install using Dashlane homebrew
# brew install dashlane/tap/dashlane-cli

# Install latex tools like latexmk
# and others needed by texlab
brew install mactex

# Vault secret management
brew install vault

# TLDR man pages Node.js client
npm install -g tldr

# lookatme terminal based presentations
# Install as part of project python environment
# pip install lookatme

# Display keys pressed on your screen
brew install keycastr

# Rectangle window manager
brew install --cask rectangle

# Install cht.sh client
# https://github.com/chubin/cheat.sh
PATH_DIR="$HOME/bin" && mkdir -p "$PATH_DIR"
curl https://cht.sh/:cht.sh >"$PATH_DIR/cht.sh"
chmod +x "$PATH_DIR/cht.sh"

# Neofetch for system stat in cli
brew install neofetch

# Display directories as trees
brew install tree

# macOS trash cli
brew install trash

# Download utility
brew install wget

# gpg for commit signatures
# GPG Suite used intead for keychain
# https://gpgtools.org
brew install gpg
