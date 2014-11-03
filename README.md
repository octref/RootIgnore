# RootIgnore

### Set 'wildignore' from git repo root

Adapted from [gitignore](http://www.vim.org/scripts/script.php?script_id=2557)
by Adam Bellaire

## Install
**Vundle**

```
plugin 'octref/RootIgnore'
```

## Usage

This plugin is designed to complement CtrlP
There is no apparent way to
- Restrict search results to files under current directory
- Honor `.gitignore` in repo root

Adam Bellaire's script honors `.gitignore` when Vim is opened at repo root,
but not when Vim is opened in subfolders under repo root.  
For example, if this plugin is present, when you `cd foo/bar/` and open Vim,
and suppose `foo/.gitingore` ignores `_*`, CtrlP ignores `foo/bar/_build` and
all results are under `foo/bar/`.

## License
MIT
