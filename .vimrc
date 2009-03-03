" An example for a vimrc file.
"
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Last change:  2001 Jul 18
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"       for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"     for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent    " always set autoindenting on
set nobackup    " do not keep a backup file, use versions instead
set history=50    " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch   " do incremental searching
set st=4 sw=4 ts=4 expandtab
set encoding=cp1251
"set termencoding=cp1251
set termencoding=utf8
set fileencoding=cp1251
set number
set ve=all
set updatetime=1000
set cindent
set timeoutlen=300
let Tlist_Ctags_Cmd='exctags'
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Highlight_Tag=1
let g:explVertical=1
let g:explSplitRight=1
let g:explWinSize=20

"set enc=cp1251
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype on
  filetype plugin on
  filetype  indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et

endif " has("autocmd")

runtime! macros/matchit.vim

"--andr
"colorscheme delek
colorscheme textmate16

" Codepage
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r    :e ++enc=koi8-r<CR>
menu Encoding.windows-1251  :e ++enc=cp1251<CR>
menu Encoding.utf8  :e ++enc=utf8<CR>

map <F8>  :emenu Encoding.<TAB>
nnoremap <silent> <F1> :TlistToggle<CR>
nnoremap <silent> <F2> :Explore<CR>
"map <F3>  :call BufferList()<CR>
map <F3>  :help<CR>
map <TAB> <C-w>w

"function RubyEndToken ()
"    let current_line = getline( '.' )
"    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
"    let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
"    let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
"
"    if match(current_line, braces_at_end) >= 0
"        return "\<CR>}\<C-O>O" 
"    elseif match(current_line, stuff_without_do) >= 0
"        return "\<CR>end\<C-O>O" 
"    elseif match(current_line, with_do) >= 0
"        return "\<CR>end\<C-O>O" 
"    else
"        return "\<CR>" 
"    endif
"endfunction
"
"function UseRubyIndent ()
"    setlocal tabstop=8
"    setlocal softtabstop=2
"    setlocal shiftwidth=2
"    setlocal expandtab
"
"    imap <buffer> <CR> <C-R>=RubyEndToken()<CR>
"endfunction
"
"
"autocmd FileType ruby,eruby call UseRubyIndent()
