" Vim plugin that finds .gitignore in repo root and sets wildignore from it 
" Adapted from gitignore <http://www.vim.org/scripts/script.php?script_id=2557>
" by Adam Bellaire
" Author: Pine Wu <https://github.com/octref>
" License: MIT

" Usage
"
" This plugin is designed to complement CtrlP & Command-T
" There is no apparent way to
" 1: Restrict search results to files under current directory
" 2: Honor .gitignore in repo root
" Adam Bellaire's script honors .gitignore when Vim is opened at repo root,
" but not when Vim is opened in subfolders under repo root.
" For example, when you cd foo/bar/ and open Vim, and suppose
" foo/.gitingore ignores _*, CtrlP ignores foo/bar/_build and all results are
" under foo/bar/

function! s:WildignoreFromGitignore(gitignore)
  if filereadable(a:gitignore)
    let igstring = ''
    for oline in readfile(a:gitignore)
      let line = substitute(oline, '\s|\n|\r', '', "g")
      if line =~ '^#' | con | endif
      if line == ''   | con | endif
      if line =~ '^!' | con | endif
      if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
      let igstring .= "," . line
    endfor
    execute "set wildignore+=".substitute(igstring, '^,', '', "g")

    " Set ag's ignore
    if g:RootIgnoreAgignore
      let agignore = ''
      for oline in readfile(a:gitignore)
        let line = substitute(oline, '\s|\n|\r', '', "g")
        if line =~ '^#' | con | endif
        if line == ''   | con | endif
        if line =~ '^!' | con | endif
        if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
        let agignore .= " --ignore '" . line . "'"
      endfor
      let agcommand = 'ag %s -i --nocolor -g ""' . agignore
      let g:ctrlp_user_command = [
          \ '.git', agcommand,
          \ 'find %s -type f'
          \ ]
    endif
  endif

endfunction

function! s:RootIgnore()
  let gitdir = finddir(".git", ";")
  if gitdir != ""
    if gitdir == ".git" 
      let gitignore = getcwd() . "/.gitignore"
    elseif gitdir =~ "/"
      let gitignore = fnamemodify(gitdir, ":h") . "/.gitignore"
    endif
    call s:WildignoreFromGitignore(gitignore)
  endif
endfunction

call s:RootIgnore()
