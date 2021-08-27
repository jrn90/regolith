#!/bin/bash

# Configure Regolith
# Run this file when inside of Regolith

user="joe"

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

configure_font() {
	curl -L https://github.com/microsoft/cascadia-code/releases/download/v2106.17/CascadiaCode-2106.17.zip --output /home/$user/Downloads/font.zip
	unzip -q -o /home/$user/Downloads/font.zip -d /home/$user/Downloads/font
	mkdir /home/$user/.fonts
	cp /home/$user/Downloads/font/ttf/CascadiaCodePL.ttf /home/$user/.fonts/
	rm -r /home/$user/Downloads/font
	rm /home/$user/Downloads/font.zip
}

configure_look() {
	sudo apt install regolith-look-ubuntu -y
	regolith-look set ubuntu
	regolith-look refresh
}

configure_code
configure_font
configure_look

