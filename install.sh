#!/bin/bash

# Install Script for Regolith Linux Setup

not_root() {
	[ "$(id -u)" -ne 0 ]; 
}

install_code() {
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg
	sudo apt install apt-transport-https
	sudo apt update
	sudo apt install code
}

install_curl() {
	sudo apt-get install curl -y
}

install_regolith() {
	sudo apt-add-repository ppa:regolith-linux/release -y
	sudo apt install regolith-desktop-mobile -y
}

install_vim() {
	sudo apt install vim -y
}

if not_root; then
	echo 'Please run as root'
	exit 1
fi

# installers
install_code
install_curl
install_regolith
install_vim
