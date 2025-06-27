My unix (macOS and Debian Linux, currently) dotfiles. A work in progress. No effort will be made to make this to anyone's taste - or really, for anyone's use - but mine.

This directory exists to collect the files related to administering my dotfiles repo that are not dotfiles themselves. They are "meta" files, if you will.


Here is how I administer/clone my dotfiles to a new machine. These instructions might be incomplete or incorrect. They were written down without immediately testing them.

- Use `bash`. Change directory to `${HOME}`.
- Clone the repository with `git clone --bare --recurse-submodules <ssh_url_to_repository>`. The name of the repository should be `Dotfiles.git`, and the file this step creates should be `Dotfiles.git`.
- Checkout `.bashrc` with `git --work-tree="${HOME}" --git-dir="${HOME}/Dotfiles.git" checkout .bashrc`.
- Launch a new interactive instance of `bash`. Ensure your current directory is `${HOME}`.
- Shell configuration will (as a rule) only apply to shells launched *at this point*.

Do this *before* committing on a new machine:
- Make sure you don't care about any files matching the shell glob `~/Dotfiles.git/hooks/*.sample`. You almost certainly don't - they're samples that `git` can regenerate at any time unless you messed with them. Then run `~/.samuel_skean_dotfiles_miscellanea/install_git_hooks.bash`.

# How to Modify:

Informative:
- Administer the repo from `bash`, using `git-df` in place of `git` when manipulating the repo. This command can be run from any working directory. When manipulating submodules of this repository, use `git`, keeping your current working directory within the submodule when interacting with it as normal.

Normative:
- Commit to this repository right after any modifications to submodules.
- Ensure this repository can be used on Linux and macOS shortly after any commits. Consider ensuring this *before* committing.


- Consider switching to [`yadm`](https://yadm.io/) (Yet Another Dotfiles Manager) or similar purpose-built software that uses an otherwise desirable version control system.
