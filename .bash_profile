# shellcheck shell=bash

# Adapted from `[ilmari-karonen](https://unix.stackexchange.com/users/9334/ilmari-karonen)`'s answer on http://unix.stackexchange.com/questions/119627/why-are-interactive-shells-on-osx-login-shells-by-default:
# Of particular note from that answer:
# > Now, a kind of a silly peculiarity of bash, not shared by most other shells, is that it will not automatically run .bashrc if it's started as a login shell. The standard work-around for that is to include something like the following commands in .bash_profile:
# > ```bash
# > [[ -e ~/.profile ]] && source ~/.profile    # load generic profile settings
# > [[ -e ~/.bashrc  ]] && source ~/.bashrc     # load aliases etc.
# > ```
[[ -e ~/.profile ]] && source ~/.profile    # load generic profile settings
[[ -e ~/.bashrc  ]] && source ~/.bashrc     # source .bashrc

# Only uncomment this line if you want the deprecation warning for macOS's *built-in* `bash` not to be printed. The `bash` that homebrew installs prints no such deprecation warning, and I would hope that no other `bash`s for macOS would do so - unless they are somehow *separately* deprecated, and then I'd kinda hope they wouldn't care about this env variable!
# As macOS's built-in bash is *very old* and doesn't do what I expect w.r.t. setting the cursor shape in .inputrc and navigating the command line with alt+<arrows>, I'd like to be alerted whenever I'm using it, even if this isn't a perfect way.
# These comments apply on 20250615, and to macOS 15.5.
# export BASH_SILENCE_DEPRECATION_WARNING=1
