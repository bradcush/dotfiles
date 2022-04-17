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

# Start bradcush session
.PHONY: bradcush
bradcush:
	@./scripts/sessions/bradcush.sh

# Start datalgo session
.PHONY: datalgo
datalgo:
	@./scripts/sessions/datalgo.sh

# Start personal session
.PHONY: personal
personal:
	@./scripts/sessions/personal.sh

# Start presentations session
.PHONY: presentations
presentations:
	@./scripts/sessions/presentations.sh

# Start problems session
.PHONY: problems
problems:
	@./scripts/sessions/problems.sh

# Start SAE session
.PHONY: sae
sae:
	@./scripts/sessions/sae.sh

# Start scratch session
.PHONY: scratch
scratch:
	@./scripts/sessions/scratch.sh

# Start study session
.PHONY: study
study:
	@./scripts/sessions/study.sh
