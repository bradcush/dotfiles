#!/bin/bash

# Bun to run, test, transpile, and bundle
curl -fsSL https://bun.sh/install | bash

# NVM for managing node versions
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

## Install Rust using rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Yarn for npm dependency mgmt
# Global symlinks using /opt/homebrew/bin
# yarn global bin shows binary path
# https://yarnpkg.com/getting-started/install
# Shipped with Node.js >= 16.10
corepack enable
# Update global yarn version
corepack prepare yarn@stable --activate

# For JS remote-plugins support
npm install -g neovim

# base16-fzf colorscheme repository
# Expected to be cloned with other repositories
git clone git@github.com:fnune/base16-fzf.git

# Globally install eslint/prettier as we to
# not rely on one location for monorepos
# Favoring eslint_d over eslint as it launches daemon
# that kills subsequent startup times after first
npm install -g eslint_d
npm install -g prettier
# Seems like bash-language-server isn't needed
# and might be included in Neovim by default
npm install -g bash-language-server
npm install -g pyright
npm install -g typescript typescript-language-server
npm install -g vim-language-server
# Language servers for html, css, and json
npm install -g vscode-langservers-extracted
npm install -g yaml-language-server

# Experimental Dashlane CLI
git clone git@github.com:Dashlane/dashlane-cli.git
# Install using Dashlane homebrew
# brew install dashlane/tap/dashlane-cli

# TLDR man pages Node.js client
npm install -g tldr

# Install cht.sh client
# https://github.com/chubin/cheat.sh
PATH_DIR="$HOME/bin" && mkdir -p "$PATH_DIR"
curl https://cht.sh/:cht.sh >"$PATH_DIR/cht.sh"
chmod +x "$PATH_DIR/cht.sh"

# gittuf security wrapper for git
git clone git@github.com:gittuf/gittuf.git

# For creating SMOM using SBOMit specs
go get github.com/testifysec/protobomit
