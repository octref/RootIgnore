# RootIgnore

**Set 'wildignore' from git repo root or home folder**

## Usage
This plugin is designed to complement CtrlP & Command-T by automatically
filtering search results according to `.gitignore` in your project, and
the global `~/.gitignore`.

There is a [script](http://www.vim.org/scripts/script.php?script_id=2557) by
Adam Bellaire, but it doesn't respect `.gitignore` when you are in a subfolder
of your project.

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
Add patterns in ~/.gitignore to wildignore.

```
let g:RootIgnoreAgignore = 1
(Default: 0)
```
**Requirement**: [**ag**](https://github.com/ggreer/the_silver_searcher)  
Let RootIgnore set `ctrlp's g:ctrlp_user_command` to use **ag** for
faster search.

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

## Update

- **08-07-2015**
  - Fix a bug for using .gitignore in non-git folder.
- **07-27-2015**
  - If we are not in a git folder, but have a .gitignore in current folder, use its patterns.
- **03-01-2015**
  - Include ~/.gitignore by default
- **02-04-2015**
  - Resolve folder-paths in .gitignore to paths relative to cwd

## Credit
Adapted from [gitignore](http://www.vim.org/scripts/script.php?script_id=2557)
by Adam Bellaire

## License
MIT

