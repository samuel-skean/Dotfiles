My unix (macOS and Debian Linux, currently) dotfiles. A work in progress. No effort will be made to make this to anyone's taste - or really, for anyone's use - but mine.

The directory `.samuel_skean_dotfiles_miscellanea` exists to collect the files related to administering my dotfiles repo that are not dotfiles themselves. They are "meta" files, if you will.

Here is how I administer/clone my dotfiles to a new machine. These instructions might be incomplete or incorrect, but they did work once.

- Use `bash`. Change directory to `${HOME}`.
- Clone the repository with `git clone --bare --recurse-submodules <ssh_url_to_repository>`. The name of the repository should be `Dotfiles.git`, and the file this step creates should be `Dotfiles.git`.
- Make sure you don't care about your current `~/.bashrc`, this next command will clobber them. Checkout `.bashrc` with `git --work-tree="${HOME}" --git-dir="${HOME}/Dotfiles.git" checkout main .bashrc`.
- Launch a new interactive instance of `bash`. Ensure your current directory is `${HOME}`.
- **Make sure you don't care about your current copies of any other files in this repo, this next command will clobber them.** Checkout everything else with `git-df checkout main && git-df restore --staged ./ && git-df restore ./`. Feel free to split these up to be more cautious.
- Run `git-df submodule init && git-df submodule update` to establish the contents of submodules in the working tree. TODO: Why doesn't `--recurse-submodules` cut it from the initial clone, or if added to the `checkout` step(s).
- Shell configuration will (as a rule) only apply to new *login* shells launched *at this point*.

- If you *know* the contents of `README.md` that you want to preserve are all already committed to the repo, you can run `git-df update-index --skip-worktree README.md && rm README.md` to remove it from your home directory.
I learned this from [this article](https://gitbetter.substack.com/i/113695216/using-update-index). CONSIDER: Using [`git-sparse-checkout`](https://git-scm.com/docs/git-sparse-checkout) - [`man git-update-index`](https://git-scm.com/docs/git-update-index) recommends it for this sorta thing.
- If you've followed the above bullet point, then to *edit* `README.md`, run `git-df update-index --no-skip-worktree README.md && git-df checkout -- README.md`.

Do this *before* committing on a new machine:
- Make sure you don't care about any files matching the shell glob `~/Dotfiles.git/hooks/*.sample`. You almost certainly don't - they're samples that `git` can regenerate at any time unless you messed with them. Then run `~/.samuel_skean_dotfiles_miscellanea/install_git_hooks.bash`.

# How to Modify:

Informative:
- Administer the repo from `bash`, using `git-df` in place of `git` when manipulating the repo. This command can be run from any working directory. When manipulating submodules of this repository, use `git`, keeping your current working directory within the submodule when interacting with it as normal.

Normative:
- Commit to this repository right after any modifications to submodules.
- Ensure this repository can be used on Linux and macOS shortly after any commits. Consider ensuring this *before* committing.


- Consider switching to [`yadm`](https://yadm.io/) (Yet Another Dotfiles Manager) or similar purpose-built software that uses an otherwise desirable version control system.
