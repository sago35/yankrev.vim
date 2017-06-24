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
"  - Requires git.
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

command! -nargs=0 Yankrev call yankrev#Yankrev()

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: ts=4 sts=0 sw=4
