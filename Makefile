HELL := /bin/bash

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
	@echo "🔗 Linking dotfiles to home directory..."

	@if [ -f "$(PWD)/.bashrc" ]; then \
		ln -sf $(PWD)/.bashrc ~/.bashrc; \
		echo "✅ Linked .bashrc"; \
	else \
		echo "⚠️  .bashrc not found, skipping"; \
	fi

	@if [ -f "$(PWD)/.gitconfig" ]; then \
		ln -sf $(PWD)/.gitconfig ~/.gitconfig; \
		echo "✅ Linked .gitconfig"; \
	else \
		echo "⚠️  .gitconfig not found, skipping"; \
	fi

	@mkdir -p ~/.config

	@if [ -d "$(PWD)/.config/nvim" ]; then \
		mkdir -p ~/.config; \
		rm -rf ~/.config/nvim; \
		ln -snf $(PWD)/.config/nvim ~/.config/nvim; \
		echo "✅ Linked .config/nvim"; \
	else \
		echo "⚠️  .config/nvim not found, skipping"; \
	fi
