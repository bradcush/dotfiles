# Install all dependencies
.PHONY: install
	@./scripts/install.sh

# Create symlinks for dotfiles
.PHONY: symlink
symlink:
	@./scripts/symlink.sh

# Start extension session
.PHONY: extension
extension:
	@./scripts/sessions/extension.sh

# Start personal session
.PHONY: personal
personal:
	@./scripts/sessions/personal.sh

# Start presentations session
.PHONY: presentations
presentations:
	@./scripts/sessions/presentations.sh

# Start SAE session
.PHONY: sae
sae:
	@./scripts/sessions/sae.sh
