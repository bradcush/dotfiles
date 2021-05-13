# Install all dependencies
.PHONY: install
	@./scripts/install.sh

# Create symlinks for dotfiles
.PHONY: symlink
symlink:
	@./scripts/symlink.sh
