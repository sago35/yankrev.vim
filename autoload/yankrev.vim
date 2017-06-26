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

function! yankrev#Yankrev(start, end)
    let l:filename = substitute(expand("%"), "\\", "/", "g")
    let l:line = line(".")
    let l:col = strdisplaywidth(strpart(getline("."), 0, col(".") - 1)) + 1
    if a:start != a:end
        let l:line = a:start . "-" . a:end
        let l:col = ""
    endif
    let l:hash = get(systemlist("git rev-parse HEAD"), 0)
    let l:exists = count(systemlist("git ls-files"), l:filename)
    let l:diff = count(systemlist("git diff --name-only"), l:filename)

    let l:yankstr = l:filename . ":" . l:line . ":" . l:col
    if l:exists
        if l:diff
            let l:yankstr = l:filename . ":" . l:line . ":" . l:col . "@" . l:hash . "*"
        else
            let l:yankstr = l:filename . ":" . l:line . ":" . l:col . "@" . l:hash
        endif
    endif

    echo l:yankstr
    let @* = l:yankstr
endfunction

" vim: ts=4 sts=0 sw=4
