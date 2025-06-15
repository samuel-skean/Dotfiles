# .bashrc

# Lots of this came from the default .bashrc from Debian 12. Some of that is called out. Some of it is not.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# From macOS ~/.bashrc (but almost certainly *not* a default part of macOS. Almost certainly put there by VSCode.)
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path bash)"
# End from macOS ~/.bashrc.

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

. "$HOME/.cargo/env"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # CONSIDER: Making the color somehow dependent on the machine, so I can easily see what machine I'm on with a glance at the prompt.
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# End from debian ~/.bashrc.

# My manual contributions. The next step is to take "ownership" of the whole thing (and not rely on stuff purely because it's from some distro).


# From .zprofile 20250608 TODO: Update or remove timestamp.
#
eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# End from .zprofile 20250608 TODO: Update or remove timestamp.

# Cannibalized from other .bashrc's, but I've taken most responsibility:
# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# # Purely my manipulations (not copied from a pre-existing .bashrc):

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000


# Don't let me overwrite files from the shell with just output redirection (`>`).
# This setting might mostly get in my way, but it's one of the earlier things I remember learning about the shell so I'll try it on for now :).
set -o noclobber

export EDITOR="/usr/bin/env nvim"

# Set the cursor to a vertical line before invoking a command.
PS0=$'\x1b[6 q'

# Just to support a copy of postgresql that I installed on my mac in a non-package-managed way for CS 480 (Databases).
# This should likely be removed, but for now, it's better to have it and not need it, yada yada.
export PATH="/usr/local/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
