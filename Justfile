# Mostly written by Gemini. I wrote the names for normal-install.
set shell := ["bash", "-c"]

# Pathing variables
git_dir := home_dir() + "/Dotfiles.git"
work_tree := home_dir()
miscellanea_dir := work_tree + "/.samuel-skean-dotfiles-miscellanea"
git_df := "git --git-dir=" + git_dir + " --work-tree=" + work_tree
default_repo := "https://github.com/samuel-skean/Dotfiles.git"

# Default: list commands
default:
    @just --list

# Clone the bare repository
clone url=default_repo:
    git clone --bare --recurse-submodules {{url}} {{git_dir}}

# 1. Install dotfiles (Warning: clobbers existing files in $HOME)
install:
    @echo "Clobbering files in {{work_tree}} with repository versions..."
    {{git_df}} fetch --all
    {{git_df}} reset --hard origin/main
    {{git_df}} restore --staged ./
    {{git_df}} restore ./
    {{git_df}} submodule init
    {{git_df}} submodule update
    @echo "Installation complete."

# 2. A normal way to install everything.
normal-install: install install-hooks hide-meta
    @echo "Normal install complete: Dotfiles installed, hooks installed and meta-files hidden."

# --- Internal/Supporting Recipes ---

# Clean sample hooks and install custom ones
install-hooks:
    @echo "Installing git hooks..."
    rm -f {{git_dir}}/hooks/*.sample
    bash {{miscellanea_dir}}/install-git-hooks.bash

# Hide README/LICENSE from $HOME
hide-meta:
    @echo "Hiding README and LICENSE from home directory..."
    {{git_df}} update-index --skip-worktree README.md LICENSE.txt
    rm -f {{work_tree}}/README.md {{work_tree}}/LICENSE.txt

# Bring back README and LICENSE for editing
show-meta:
    {{git_df}} update-index --no-skip-worktree README.md
    {{git_df}} update-index --no-skip-worktree LICENSE.txt
    {{git_df}} checkout -- README.md

# Helper to run git-df commands directly
git-df *args:
    {{git_df}} {{args}}
