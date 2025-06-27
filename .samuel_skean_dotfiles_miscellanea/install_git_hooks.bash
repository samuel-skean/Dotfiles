#!/usr/bin/env bash

set -eux

git --work-tree="${HOME}" --git-dir="${HOME}/Dotfiles.git" config core.hooksPath "${HOME}/.samuel_skean_dotfiles_miscellanea/git_hooks"
rm ~/Dotfiles.git/hooks/*.sample
cat > ~/Dotfiles.git/hooks/README.md <<'EOF'
This isn't where Dotfiles.git's core.hooksPath is set to.
See `~/.samuel_skean_dotfiles_miscellanea/install_git_hooks.bash` for more info.
EOF
