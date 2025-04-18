SHELL := /bin/bash

.PHONY: all install-git install-github install-gcc install-neovim install-python link-dotfiles

all: install-git install-github install-gcc install-neovim install-python link-dotfiles

install-git:
	sudo apt update && sudo apt install -y git

install-github:
	sudo apt install -y gh

install-gcc:
	sudo apt install -y build-essential

install-neovim:
	sudo apt install -y neovim

install-python:
	sudo apt install -y python3 python3-pip

link-dotfiles:
	@echo "Linking dotfiles to home..."
	ln -sf $(PWD)/.bashrc ~/.
	ln -sf $(PWD)/.gitconfig ~/.
	mkdir -p ~/.config/nvim
	ln -sf $(PWD)/.config/nvim/init.lua ~/.config/nvim/init.lua
