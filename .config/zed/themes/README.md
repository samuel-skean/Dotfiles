## Three invariants about the patch file:
1. The patch file is generated with `git diff --no-index`, given two paths.
2. This patch file takes you from `https://github.com/zed-industries/zed/blob/<SHA-1 hash of git commit>/assets/themes/one/one.json` to `one-modified.json` in this directory, where that git hash placeholder is replaced by part before the first hyphen of the patch file's name. The patch file's name is of the form `<SHA-1 hash of git commit>-one-to-one-modified.patch`. ...Yes, the 'one-to-one-modified' part of the name is pretty unreadable and trips me up often. CONSIDER: Changing that part of the name.
3. Keep the name of the "original" (maintained by zed on github) file written in the .gitignore directory in this current directory (themes) up-to-date. This needs changing whenever I base my theme off a new theme.

## Rationale for storing the patch file and not the original theme:
I want the thing I maintain to be a way I *get* from the official theme to the one I want. I want to acknowledge one single source of truth for a given version of the official zed theme. If those "permalinks" aren't permanent, god help me.
Unfortunately, with the way I currently generate the patch files, the patch files end up including several lines of unchanged text that likely means applying it to significantly different files would fail - but for reasons I likely wouldn't care about.
Also unfortunately, if stuff *moves around* in the file that zed maintains (that I want to apply my patch to), then I'm probably up a creek without a paddle in terms of *automatically* applying the patch. But at that point, I can still go back to the zed github - and start writing a new patch file, with my human brain.

### Quick Note:
There are also "comments" (in the form of funny little otherwise-meaningless key-value pairs) in the theme json file(s). They explain the rationale of the choices in the theme(s) themselves.
JSON not having comments is not remotely my favorite thing.
