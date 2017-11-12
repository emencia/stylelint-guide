.PHONY: help check valid invalid

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo
	@echo "  check              -- launch stylelint on valid and invalid scss files"
	@echo "  valid              -- launch stylelint on valid scss file"
	@echo "  invalid            -- launch stylelint on invalid scss file"
	@echo

check:
	@stylelint scss/valid.scss scss/invalid.scss --formatter verbose

valid:
	@stylelint scss/valid.scss --formatter verbose

invalid:
	@stylelint scss/invalid.scss --formatter verbose
