"=============================================================================
" File:        occur.vim
" Author:      FURUSAWA, Noriyoshi (noriyosi xxx gmail dot com) xxx=@,dot=.
" Last Change: 2008/7/13
" Version:     0.03
"=============================================================================

if exists('loaded_occur') || &cp
    finish
endif
let loaded_occur=1

if v:version < 700
    echo "Sorry, occur ONLY runs with Vim 7.0 and greater."
    finish
endif

if !exists("g:occur_no_quickfix_map")
    let g:occur_no_quickfix_map = 0
endif

" Key bind
nnoremap <silent> <unique> <Leader>oc :Occur<CR>
nnoremap <silent> <unique> <Leader>mo :Moccur<CR>
nnoremap <silent> <unique> <Leader>* *<C-o>:Moccur<CR>

" Create commands
command! Occur silent call s:SetupAndGo('s:Occur')
command! Moccur silent call s:SetupAndGo('s:Moccur')
command! StarOccur exec "normal! *<C-o>" <Bar> Moccur

function! s:Occur()
    let expr = 'caddexpr expand("%") . ":" . line(".") . ":" . getline(".")'
    exec 'silent keepjumps g/' . @/ . '/' . expr
endfunction

function! s:Moccur()
    " Create the buffer list
    redir => command_out
    ls
    redir END

    let buffers = []
    for line in split(command_out, '\n')
        call add(buffers, split(line, ' ')[0])
    endfor

    " Search the pattern in all buffers
    for buf_number in buffers
        exec 'keepjumps buffer ' . buf_number
        call s:Occur()
    endfor
endfunction

function! s:SetupAndGo(func)
    let org_efm = &errorformat
    let &errorformat = '%f:%l:%m'

    " Clear the results window
    cexpr "================= occur result ================="
    cclose

    " Log the current cursor position
    normal! H

    " Do Occur
    call function(a:func)()

    " Open the results window (and restore cursor position)
    keepjumps cfirst 1
    exec "normal! \<C-o>"
    copen

    " Map the key sequence on the QuickFix
    if !g:occur_no_quickfix_map
        nnoremap <buffer> <silent> <Space> <C-w><C-_>
        nnoremap <buffer> <silent> x 10<C-w>_<CR>zxzz:copen<CR>
        nnoremap <buffer> <silent> <CR> <CR>zxzz:cclose<CR>
        nnoremap <buffer> <silent> q :cclose<CR>
    endif

    let &errorformat = org_efm
endfunction

