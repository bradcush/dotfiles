# Install dependencies
install:
.PHONY: install
	@./scripts/install.sh

# Connect display
.PHONY: display
display:
	@./scripts/display.sh

# Start arduino session
.PHONY: arduino
arduino:
	@./scripts/sessions/arduino.sh

# Start bradcush session
.PHONY: bradcush
bradcush:
	@./scripts/sessions/bradcush.sh

# Start datalgo session
.PHONY: datalgo
datalgo:
	@./scripts/sessions/datalgo.sh

# Start deeps session
.PHONY: deeps
deeps:
	@./scripts/sessions/deeps.sh

# Start dotfiles session
.PHONY: dotfiles
dotfiles:
	@./scripts/sessions/dotfiles.sh

# Start eth session
.PHONY: eth
eth:
	@./scripts/sessions/eth.sh

# Start mark session
.PHONY: mark
mark:
	@./scripts/sessions/mark.sh

# Start presentations session
.PHONY: presentations
presentations:
	@./scripts/sessions/presentations.sh

# Start problems session
.PHONY: problems
problems:
	@./scripts/sessions/problems.sh

# Start scratch session
.PHONY: scratch
scratch:
	@./scripts/sessions/scratch.sh

# Start zcash session
.PHONY: zcash
zcash:
	@./scripts/sessions/zcash.sh

# Start zecli session
.PHONY: zecli
zecli:
	@./scripts/sessions/zecli.sh
