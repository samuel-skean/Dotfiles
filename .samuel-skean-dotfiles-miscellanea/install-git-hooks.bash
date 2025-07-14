#!/usr/bin/env bash

set -eux

git --work-tree="${HOME}" --git-dir="${HOME}/Dotfiles.git" config core.hooksPath "${HOME}/.samuel-skean-dotfiles-miscellanea/git-hooks"
rm ~/Dotfiles.git/hooks/*.sample
cat > ~/Dotfiles.git/hooks/README.md <<'EOF'
This isn't where Dotfiles.git's core.hooksPath is set to.
See `~/.samuel-skean-dotfiles-miscellanea/install-git-hooks.bash` for more info.
EOF
