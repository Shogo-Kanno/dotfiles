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
	@echo "Linking dotfiles to home…"
	@if [ -f ".bashrc" ]; then ln -sf $(PWD)/.bashrc ~/.bashrc; else echo ".bashrc not found, skip"; fi
	@if [ -f ".gitconfig" ]; then ln -sf $(PWD)/.gitconfig ~/.gitconfig; else echo ".gitconfig not found, skip"; fi
	@if [ -d ".config/nvim" ]; then \
	  ln -snf $(PWD)/.config/nvim ~/.config/; \
	else echo ".config/nvim not found, skip"; fi
