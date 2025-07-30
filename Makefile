SHELL := /bin/bash

.PHONY: all install-git install-github install-gcc install-neovim install-python link-dotfiles

all: install-git install-github install-gcc install-neovim install-python link-dotfiles

install-git:
	@echo "📦 Installing git..."
	sudo apt update && sudo apt install -y git

install-github:
	@echo "📦 Installing GitHub CLI..."
	sudo apt install -y gh

install-gcc:
	@echo "📦 Installing build-essential..."
	sudo apt install -y build-essential

install-neovim:
	@echo "📦 Installing Neovim..."
	sudo apt install -y neovim

install-python:
	@echo "📦 Installing Python..."
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
		rm -rf ~/.config/nvim; \
		ln -snf $(PWD)/.config/nvim ~/.config/nvim; \
		echo "✅ Linked .config/nvim"; \
	else \
		echo "⚠️  .config/nvim not found, skipping"; \
	fi
