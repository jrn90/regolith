#!/bin/bash

# Configure Regolith
# Run this file when inside of Regolith

set -e

not_root() {
	[ "$(id -u)" -ne 0 ];
}

configure_code() {
	code --install-extension golang.Go
	code --install-extension DavidAnson.vscode-markdownlint
	code --install-extension streetsidesoftware.code-spell-checker
	code --install-extension redhat.vscode-yaml
	code --install-extension PKief.material-icon-theme
	code --install-extension CoenraadS.bracket-pair-colorizer-2
	code --install-extension dracula-theme.theme-dracula
	code --install-extension Gruntfuggly.todo-tree	
}

configure_look() {
	sudo apt install regolith-look-ubuntu -y
	regolith-look set ubuntu
	regolith-look refresh
}

if not_root; then
	echo 'Please run as root'
	exit 1
fi

configure_code
configure_look


