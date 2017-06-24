" Script Name: yankrev.vim
" Description: Yank revision (git-hash) and filename and lineno
"
" Copyright:   (C) 2017 sago35
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:  sago35 <sago35@gmail.com>
"
" Dependencies:
"  - Requires Vim 8.0 or higher.
"
" Version:     0.1.0
" Changes:
"   0.1.0
"       Initial release

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_yankrev') || (v:version < 800)
    finish
endif
let g:loaded_yankrev = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:Yankrev()
    let l:filename = substitute(expand("%"), "\\", "/", "g")
    let l:line = line(".")
    let l:hash = get(systemlist("git rev-parse HEAD"), 0)
    let l:exists = count(systemlist("git ls-files"), l:filename)
    let l:diff = count(systemlist("git diff --name-only"), l:filename)

    let l:yankstr = l:filename . ":" . l:line
    if l:exists
        if l:diff
            let l:yankstr = l:filename . ":" . l:line . "@" . l:hash . "*"
        else
            let l:yankstr = l:filename . ":" . l:line . "@" . l:hash
        endif
    endif

    echo l:yankstr
    let @* = l:yankstr
endfunction

command! -nargs=0 Yankrev call s:Yankrev()

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: ts=4 sts=0 sw=4
