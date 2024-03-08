
# Run all shell files
all:link init brew github

# run init.sh
init:
	@echo "\033[0;34mRun init.sh\033[0m"
	@./init.sh
	@echo "\033[0;34mDone.\033[0m"

# next create symbolic links
link:
	@echo "\033[0;34mRun link.sh\033[0m"
	@./link.sh
	@echo "\033[0;34mDone.\033[0m"

# Set macOS system preferences.
defaults:
	@echo "\033[0;34mRun defaults.sh\033[0m"
	@./defaults.sh
	@echo "\033[0;32mDone.\033[0m"

# Install macOS applications.
brew:
	@echo "\033[0;34mRun brew.sh\033[0m"
	@./brew.sh
	@echo "\033[0;32mDone.\033[0m"

# Set GitHub
github:
	@echo "\033[0;34mRun github.sh\033[0m"
	@./github.sh
	@echo "\033[0;32mDone.\033[0m"
