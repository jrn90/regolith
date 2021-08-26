#!/bin/bash

# Install Script for Regolith Linux Setup

user="joe"

not_root() {
	[ "$(id -u)" -ne 0 ]; 
}

install_curl() {
	sudo apt-get install curl -y
}

download_nvidia() {
	curl --progress-bar https://us.download.nvidia.com/XFree86/Linux-x86_64/470.63.01/NVIDIA-Linux-x86_64-470.63.01.run --output /home/$user/Downloads/nvidia_drivers.run
	sudo chmod +x /home/$user/Downloads/nvidia_drivers.run
}

if not_root; then
	echo 'Please run as root'
	exit 1
fi

# installers
install_curl

# downloads
download_nvidia
