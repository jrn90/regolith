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

configure_docker() {
	sudo groupadd docker
	sudo usermod -aG docker $USER
	newgrp docker
}

configure_font() {
	curl -L https://github.com/microsoft/cascadia-code/releases/download/v2106.17/CascadiaCode-2106.17.zip --output /home/$user/Downloads/font.zip
	unzip -q -o /home/$user/Downloads/font.zip -d /home/$user/Downloads/font
	mkdir /home/$user/.fonts
	cp /home/$user/Downloads/font/ttf/CascadiaCodePL.ttf /home/$user/.fonts/
	rm -r /home/$user/Downloads/font
	rm /home/$user/Downloads/font.zip
}

configure_go() {
	curl -L https://golang.org/dl/go1.17.linux-amd64.tar.gz --output /home/$user/Downloads/go1.17.linux-amd64.tar.gz
	sudo rm -rf /usr/local/go
	sudo tar -C /usr/local -xzf /home/$user/Downloads/go1.17.linux-amd64.tar.gz
	echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/$user/.profile
	rm /home/$user/Downloads/go1.17.linux-amd64.tar.gz
}

configure_look() {
	sudo apt install regolith-look-ubuntu -y
	regolith-look set ubuntu
	regolith-look refresh
}

configure_code
configure_docker
configure_font
configure_go
configure_look

