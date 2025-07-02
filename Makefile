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
	@if [ -f "$(PWD)/.bashrc" ]; then ln -sf $(PWD)/.bashrc ~/.; else echo ".bashrc not found, skipping"; fi
	@if [ -f "$(PWD)/.gitconfig" ]; then ln -sf $(PWD)/.gitconfig ~/.; else echo ".gitconfig not found, skipping"; fi
	@if [ -f "$(PWD)/.config/nvim/init.lua" ]; then \
	  mkdir -p ~/.config/nvim; \
	  ln -sf $(PWD)/.config/nvim/init.lua ~/.config/nvim/init.lua; \
	else echo "init.lua not found, skipping"; fi
