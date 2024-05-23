eval $(ssh-agent) > /dev/null
ssh-add -q ~/.ssh/github
ssh-add -q ~/.ssh/for_my_pis
# ssh-add -q ~/.ssh/for_nodes
export PATH="$PATH:/Users/samuelskean/Documents/Chromium/depot_tools"
export PATH="$PATH:/Applications/Coq-Platform~8.17~2023.08.app/Contents/Resources/bin"
export PATH="$PATH:/Users/samuelskean/Library/Python/3.9/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.my-nix-stuff/result/bin:$PATH"
export EDITOR=nvim
export VISUAL="$EDITOR"
bindkey -e # Unsure why this is necessary to get bck-i-search to work.
