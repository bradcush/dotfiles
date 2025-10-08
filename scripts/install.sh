#!/bin/bash

# Reference common install script
. "$HOME/Documents/repos/dotfiles/scripts/install.sh"

# Install Homebrew package manager of macOS
# Homebrew Cask extends Homebrew and comes with it
# Run brew update afterwards for latest formulae
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Alacritty GPU terminal emulator
brew install --cask alacritty

# Hack Nerd Font has strong differences between
# similar characters and supports glyphs
# brew install --cask font-hack
brew install --cask font-hack-nerd-font
# brew install --cask font-ubuntumono-nerd-font

# Terminal multiplexer
brew install tmux

# Configurable cross-shell prompt
brew install starship

# A command-line fuzzy finder
brew install fzf
/opt/homebrew/opt/fzf/install

# Install Neovim development version
# To upgrade HEAD run brew reinstall neovim
# You can also brew upgrade neovim
brew install --HEAD neovim

# Go for compiling hexokinase
brew install go

# Language servers and formatters used
# with Neovim LSP and efm-langserver
brew install efm-langserver
brew install lua-language-server
brew install pandoc
brew install markdownlint-cli

# LuaRocks package mgmt
brew install luarocks
# Better Lua source code formatting
luarocks install --server=https://luarocks.org/dev luaformatter

# Rectangle window manager
brew install --cask rectangle

# NVM for managing node versions
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

# base16-fzf colorscheme repository
# Expected to be cloned with other repositories
git clone git@github.com:fnune/base16-fzf.git

# gpg for commit signatures
# GPG Suite used instead for keychain
# https://gpgtools.org
brew install gpg

# Rg and Ag for use with fzf
brew install ripgrep
brew install the_silver_searcher

# Corepack needed for yarn
npm install -g corepack

# Globally install eslint/prettier as we to
# not rely on one location for monorepos
# Favoring eslint_d over eslint as it launches daemon
# that kills subsequent startup times after first
npm install -g eslint_d
npm install -g prettier
npm install -g typescript typescript-language-server
npm install -g vim-language-server

# Install zsh-autosuggestions
brew install zsh-autosuggestions

# Install zsh-syntax-highlighting
brew install zsh-syntax-highlighting

# bat replaces cat
brew install bat
