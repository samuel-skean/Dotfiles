This version of the README is knowingly pretty sloppy and difficult to read.
Nothing is modified in one-modified.json from the original (at https://github.com/zed-industries/zed/blob/<SHA-1 hash of git object that goes in github urls like this - probably tree?>/assets/themes/one/one.json) at the moment. The empty patch file denotes this.
Two invariants about the patch file:
1. The patch file is generated with `git diff --no-index`, given two paths.
2. This patch file takes you from https://github.com/zed-industries/zed/blob/<SHA-1 hash of git object that goes in github urls like this - probably tree?>/assets/themes/one/one.json to one-modified.json in this directory, where that git hash placeholder is replaced by part before the first hyphen of the patch file's name. The patch file's name is of the form '<SHA-1 hash of git object that goes in github urls like those listed previously - probably tree?>-one-to-one-modified.patch'.
