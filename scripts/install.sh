#!/bin/bash

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

# Neovim stable latest
brew install neovim
# Install Neovim development version
# To upgrade HEAD run brew reinstall neovim
# You can also brew upgrade neovim
# brew install --HEAD neovim

# vim-plug installation separate from Neovim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

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
# Requires cmake:
# brew install cmake
# Better Lua source code formatting
luarocks install --server=https://luarocks.org/dev luaformatter

# Rectangle window manager
brew install --cask rectangle

# NVM for managing node versions
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

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
# npm install -g prettier
# Prettier version used by Cerby
npm install -g prettier@2.8.3
npm install -g typescript typescript-language-server
npm install -g vim-language-server

# Install zsh-autosuggestions
brew install zsh-autosuggestions

# Install zsh-syntax-highlighting
brew install zsh-syntax-highlighting

# bat replaces cat
brew install bat

# Claude Code CLI native install
curl -fsSL https://claude.ai/install.sh | bash

# OpenAI Codex CLI native install
curl -fsSL https://chatgpt.com/codex/install.sh | sh

# 1Password CLI
brew install 1password-cli

# curl Bun installation
curl -fsSL https://bun.com/install | bash

# Ruby version manager
brew install rbenv

# GitHub CLI, mostly for agents
brew install gh

# Check for leaked secrets
brew install git-scripts
brew install trufflehog

# Code security CLI tool
brew install semgrep

# GitHub stacks management
gh extension install github/gh-stack
# Remember conflict resolutions across restack
# git config rerere.enabled true
# Usage:
# gh stack checkout 42386
# gh stack sync

# Not being picked up locally
# Needed to be on node@22.22.2 everywhere
# Have same version globally and via bun run oxlint
npm install -g oxlint

# Requires brew install libusb
# Foundry smart contract development
curl -L https://foundry.paradigm.xyz | bash && foundryup

# Cantina.xyz CLI and MCPs
# https://ai.cantina.xyz/docs/apex-cli
# https://github.com/cantinasec/cantina-claude-mcp
npm install -g @cantinasecurity/apex-cli

# For Solidity
npm install -g @nomicfoundation/slang
npm install -g @nomicfoundation/solidity-language-server

# Lean prover
brew install elan-init

# AWS CLI, needed for Uniswap management, Privy stuff
# aws kms rotate-key-on-demand --key-id 167b1037-5bf8-4955-b52b-ab5e5659e1d7
curl -fsSL https://awscli.amazonaws.com/v2/install.sh | bash
