My unix (macOS and Debian Linux, currently) dotfiles. A work in progress. No effort will be made to make this to anyone's taste - or really, for anyone's use - but mine.

The directory `.samuel-skean-dotfiles-miscellanea` exists to collect the files related to administering my dotfiles repo that are not dotfiles themselves. They are "meta" files, if you will.

Here is how I administer/clone my dotfiles to a new machine. These instructions might be incomplete or incorrect, but they did work once.

- Use `bash`. Change directory to `${HOME}`.
- If on debian, run `sudo apt install curl build-essential git`. On other distros, run equivalent commands to install the same things. `build-essential` is only necessary if you use `cargo-binstall`, but I always end up wanting it.
- Install rust, then just.
  - Rust: https://rust-lang.org/tools/install/
  - Just: Run `cargo install just`.
    - If installing via cargo-binstall instead, be sure to install a c compiler first.
- Download the Justfile. (Currently, `curl -H "Cache-Control: no-cache" -H "Pragma: no-cache" https://raw.githubusercontent.com/samuel-skean/Dotfiles/refs/heads/main/Justfile > Justfile`)
- Run `just clone && just normal-install` from the home directory.

  (NOTE: This only works if the repo is still on Github at https://github.com/samuel-skean/Dotfiles.git. If it's moved, run `just clone <new_git_url> && just normal-install` instead.)

# How to Modify:

Informative:
- Administer the repo from `bash`, using `git-df` in place of `git` when manipulating the repo. This command can be run from any working directory. When manipulating submodules of this repository, use `git`, keeping your current working directory within the submodule when interacting with it as normal.

Normative:
- Commit to this repository right after any modifications to submodules.
- Ensure this repository can be used on Linux and macOS shortly after any commits. Consider ensuring this *before* committing.


- Consider switching to [`yadm`](https://yadm.io/) (Yet Another Dotfiles Manager) or similar purpose-built software that uses an otherwise desirable version control system.

## NOTE ON LICENSING:
`LICENSE.txt` takes precedence over anything else in this repository when it comes to defining the license of this code.
But in case the bit in the license about "machine-executable object code" seems confusing (this repo is almost all config files and script files) then please just distribute the code with the same license attached.
If you do find a way to derive "machine-executable object code" from this repo, be my guest and omit the license text if you so desire :).
