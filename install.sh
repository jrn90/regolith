#!/bin/bash

# Install Script for Regolith Linux Setup

. ./deps.sh

install_code() {
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg
	sudo apt install code
}

install_docker() {
	# remove old
	sudo apt-get remove docker docker-engine docker.io containerd runc -y
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io -y
}

install_docker_compose() {
	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
}

install_flatpak() {
	sudo apt install flatpak -y
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	# Install Mark Text
	flatpak install flathub com.github.marktext.marktext -y
	# Install Obsidian
	flatpak install flathub md.obsidian.Obsidian -y
	# Install Slack
	flatpak install flathub com.slack.Slack -y
	# Install Spotify
	flatpak install flathub com.spotify.Client -y
}

install_htop() {
	sudo apt install htop -y
}

install_regolith() {
	sudo apt-add-repository ppa:regolith-linux/release -y
	sudo apt install regolith-desktop-mobile -y
}

install_vim() {
	sudo apt install vim -y
}

install_xclip() {
	sudo apt install xclip -y
}

# deps
install_deps

# installers
install_code
install_docker
install_docker_compose
install_flatpak
install_htop
install_regolith
install_vim
install_xclip

