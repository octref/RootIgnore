# RootIgnore

### Set 'wildignore' from git repo root

Adapted from [gitignore](http://www.vim.org/scripts/script.php?script_id=2557)
by Adam Bellaire

## Install
#### Vundle

```Vim
plugin 'octref/RootIgnore'
```

===

### Setting

#### CtrlP
```Vim
" As long as it doesn't contain 'r' it's fine
let g:ctrlp_working_path_mode = '0'
```

#### Command-T
```Vim
let g:CommandTTraverseSCM = 'pwd'
" If you want to add your own ignore pattern
let g:CommandTWildIgnore = &wildignore . ',myPattern"
```

## Usage
After installation it works automatically.

This plugin is designed to complement CtrlP & Command-T.
There is no easy way to:
- Restrict search results to files under current directory
- Honor `.gitignore` in repo root

Adam Bellaire's [script](http://www.vim.org/scripts/script.php?script_id=2557) honors `.gitignore` when Vim is opened at repo root,
but not when Vim is opened in subfolders under repo root.  

If this plugin is present, when you `cd foo/bar/` and open Vim,
and suppose `foo/.gitingore` ignores `_*`, CtrlP ignores `foo/bar/_build` and
all results are under `foo/bar/`.

## License
MIT
