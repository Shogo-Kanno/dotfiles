SHELL := /bin/bash

.PHONY: backup-wsl restore-wsl

backup-wsl:
	@echo "💾 Backing up WSL distro to external SSD..."
	@powershell.exe wsl --export Ubuntu-22.04 E:\\wsl-backup\\ubuntu2204.tar
	@echo "✅ Backup complete: E:\\wsl-backup\\ubuntu2204.tar"

restore-wsl:
	@echo "♻️ Restoring WSL distro from external SSD..."
	@powershell.exe wsl --shutdown
	@powershell.exe wsl --unregister Ubuntu-22.04 || echo "No existing distro to remove"
	@powershell.exe wsl --import Ubuntu-22.04 C:\\WSL\\Ubuntu22 E:\\wsl-backup\\ubuntu2204.tar
	@echo "✅ Restore complete!"
