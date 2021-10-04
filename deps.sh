#!/bin/bash

# Dependencies installer

install_deps() {
	sudo apt update
	sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release gcc curl make -y
	sudo apt update
}

install_deps
