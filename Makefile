# Formatting variables, FORMATRESET is always to be used last to close formatting
FORMATBLUE:=$(shell tput setab 4)
FORMATBOLD:=$(shell tput bold)
FORMATRESET:=$(shell tput sgr0)

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo
	@echo "  clean                         -- to clean EVERYTHING (Warning)"
	@echo "  clean-frontend-install        -- to clean frontend installation"
	@echo "  clean-frontend-build          -- to clean frontend built files"
	@echo
	@echo "  install-frontend              -- to install frontend requirements with Npm"
	@echo "  install                       -- to install everything"
	@echo
	@echo "  css                           -- to build CSS with default environnement"
	@echo
	@echo "  lint-scss                     -- to run Stylelint on Sass sources for lint hint (do not write anything)"
	@echo "  fix-scss                      -- to run Stylelint on Sass sources for lint fix (write file fixes)"
	@echo

clean-frontend-build:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Cleaning frontend built files <---$(FORMATRESET)\n"
	@echo ""
	rm -Rf css
	rm -Rf cleaned
.PHONY: clean-frontend-build

clean-frontend-install:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Cleaning frontend install <---$(FORMATRESET)\n"
	@echo ""
	rm -Rf node_modules
.PHONY: clean-frontend-install

clean: clean-frontend-install clean-frontend-build
.PHONY: clean

install-frontend:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Installing frontend requirements <---$(FORMATRESET)\n"
	@echo ""
	npm install
.PHONY: install-frontend

install: install-frontend
.PHONY: install

css:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Build CSS for development environment <---$(FORMATRESET)\n"
	@echo ""
	npm run-script css
.PHONY: css

lint-scss:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Running Stylelint on Sass sources <---$(FORMATRESET)\n"
	@echo ""
	npx stylelint "scss/**/*.scss"
.PHONY: lint-scss

fix-scss:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Running Stylelint to fix Sass sources <---$(FORMATRESET)\n"
	@echo ""
	@rm -Rf cleaned
	@cp -rf scss cleaned
	npx stylelint --fix "cleaned/*.scss"
.PHONY: fix-scss
