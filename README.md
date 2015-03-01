# RootIgnore

**Set 'wildignore' from git repo root or home folder**

## Install
#### Vundle

```Vim
plugin 'octref/RootIgnore'
```

## Option
```
let g:RootIgnoreUseHome = 1
(Default: 1)
```
Add patterns in ~/.gitignore to **wildignore**.

```
let g:RootIgnoreAgignore = 1
(Default: 0)
```
**Requirement**: [**ag**](https://github.com/ggreer/the_silver_searcher)  
Let RootIgnore set `ctrlp's g:ctrlp_user_command` to use **ag** to ignore
the patterns found in repo root's gitignore.  

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
Currently, there seems to be no easy way to:
- Restrict search results to files under current directory
- Honor `.gitignore` in repo root

Adam Bellaire's [script](http://www.vim.org/scripts/script.php?script_id=2557) honors `.gitignore` when Vim is opened at repo root,
but not when Vim is opened in subfolders under repo root.  

If this plugin is present, when you `cd foo/bar/` and open Vim,
and suppose `foo/.gitingore` ignores `_*`, CtrlP ignores `foo/bar/_build` and
all results are under `foo/bar/`.

## Update

**03-01-2015**
- Include ~/.gitignore by default
**02-04-2015**
- Resolve folder-paths in .gitignore to paths relative to cwd

## Credit
Adapted from [gitignore](http://www.vim.org/scripts/script.php?script_id=2557)
by Adam Bellaire

## License
MIT

