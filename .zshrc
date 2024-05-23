export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.my-nix-stuff/result/bin:$PATH"
export EDITOR=nvim
export VISUAL="$EDITOR"
bindkey -e # Unsure why this is necessary to get bck-i-search to work.

fpath+=~/.zfunc

# Marlon Richert's answer on [this page](https://stackoverflow.com/questions/67136714/how-to-properly-install-new-completions-in-zsh)
# was helpful, but in the end I just followed rustup's
# instructions and ran `compinstall` to generate the end of this file.

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/samuelskean/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
