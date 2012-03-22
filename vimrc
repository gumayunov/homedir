let g:CSApprox_loaded = 1

source ~/.vim/vimrc


set nowrap

" Поиск будет учитывать регистр только если в строке поиска присутствую
" заглавные буквы
set ignorecase
set smartcase

set nobackup
set history=50
set ve=all

set background=dark


" Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
set nocompatible

" Показывать положение курсора всё время.
set ruler

" Показывать незавершённые команды в статусбаре
set showcmd

" Включаем нумерацию строк
set number

" Фолдинг по отсупам
"set foldmethod=indent

" Поиск по набору текста (очень полезная функция)
set incsearch

" Отключаем подстветку найденных вариантов, и так всё видно.
set hlsearch

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolljump=1

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set scrolloff=1

" Выключаем надоедливый "звонок"
set novisualbell
set t_vb=

" Кодировка текста по умолчанию
set encoding=utf8
set fileencoding=utf8
set termencoding=utf8

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" Скрыть панель в gui версии ибо она не нужна
set guioptions-=T

" Сделать строку команд высотой в одну строку
set ch=1

" Скрывать указатель мыши, когда печатаем
set mousehide

" allow to use backspace instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Преобразование Таба в пробелы
set expandtab

" Размер табулации по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2

" Включаем "умные" отспупы ( например, автоотступ после {)
set smartindent

" Fix <Enter> for comment
set fo+=cr

" Опции сесссий
set sessionoptions=curdir,buffers,tabpages

" Комманды в режиме кириллицы
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >

" Заставляем shift-insert работать как в Xterm
map <S-Insert> <MiddleMouse>

" Поиск и замена слова под курсором
"nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

map <F8> :TlistToggle<cr>
vmap <F8> <esc>:TlistToggle<cr>
imap <F8> <esc>:TlistToggle<cr>

" F10 - удалить буфер
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

" Выключаем ненавистный режим замены
imap <Ins> <Esc>i

" Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
map <F3>       :emenu Encoding.<TAB>

" Меню для выбора типа файла (DOS, UNIX, Mac)
menu FileFormat.UNIX :e ++ff=unix
menu FileFormat.DOS :e ++ff=dos
menu FileFormat.Mac :e ++ff=mac
map <F4>        :emenu FileFormat.<TAB>

:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Слова откуда будем завершать
set complete=""
" Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов
set complete+=t

au BufRead,BufNewFile *.phps set filetype=php
au BufRead,BufNewFile *.thtml set filetype=php
au BufRead,BufNewFile *.pl set filetype=perl
au BufRead,BufNewFile *.pm set filetype=perl
au BufRead,BufNewFile *.rb set filetype=ruby
au BufRead,BufNewFile *.hrl set filetype=erlang
au BufRead,BufNewFile *.scss set filetype=sass
au BufNewFile,BufRead *.php let b:optionsset=0
au BufNewFile,BufRead *.php let b:PHP_autoformatcomment=0

au FileType perl set iskeyword=@,48-57,_,192-255,:
au BufReadPost cd %:h

au FileType ruby,scss,cucumber set shiftwidth=2
au FileType ruby,scss,cucumber set softtabstop=2
au FileType ruby,scss,cucumber set tabstop=2

set completeopt-=preview
set completeopt+=longest
set mps-=[:]

set viminfo='10,\"100,:20,%,n~/.viminfo

hi clear

if exists("syntax_on")
    syntax reset
endif

set t_Co=256
"let g:solarized_termcolors=256

set background=dark

"colorscheme vibrantink
"colorscheme dark-ruby
colorscheme solarized
"hi Normal ctermfg=White

" Some fixes for solarized theme
hi rubyDefine ctermbg=none
hi rubyRailsMethod cterm=bold ctermfg=33
hi rubyInstanceVariable cterm=bold CTermfg=33
hi rubySymbol ctermfg=red

" some fixes for theme
hi Pmenu ctermfg=11 ctermbg=none
hi Error ctermfg=white	guifg=white

function! s:FindEmAll(needle, path)
    cgetexpr system('find '.a:path.' -type f -not \( -iname "*.swp" -or -iname "*.jpg" -or -iname "*.png" -or -iname "*.gif" -or -iname "*.log" \) -print0 \| xargs -0 egrep -n "'.a:needle.'" \| sed -e "s/:(\d+)/\|$1\|/"' )
    copen
    wincmd L
endfunction

command! -complete=file -nargs=+ Find call s:FindEmAll(<f-args>)

" Highlight whitespace problems.
" flags is '' to clear highlighting, or is a string to
" specify what to highlight (one or more characters):
"   e  whitespace at end of line
"   i  spaces used for indenting
"   s  spaces before a tab
"   t  tabs not at start of line
function! ShowWhitespace(flags)
  let bad = ''
  let pat = []
  for c in split(a:flags, '\zs')
    if c == 'e'
      call add(pat, '\s\+$')
    elseif c == 'i'
      call add(pat, '^\t*\zs \+')
    elseif c == 's'
      call add(pat, ' \+\ze\t')
    elseif c == 't'
      call add(pat, '[^\t]\zs\t\+')
    else
      let bad .= c
    endif
  endfor
  if len(pat) > 0
    let s = join(pat, '\|')
    exec 'syntax match ExtraWhitespace "'.s.'" containedin=ALL'
  else
    syntax clear ExtraWhitespace
  endif
  if len(bad) > 0
    echo 'ShowWhitespace ignored: '.bad
  endif
endfunction

function! ToggleShowWhitespace()
  if !exists('b:ws_show')
    let b:ws_show = 0
  endif
  if !exists('b:ws_flags')
    let b:ws_flags = 'est'  " default (which whitespace to show)
  endif
  let b:ws_show = !b:ws_show
  if b:ws_show
    call ShowWhitespace(b:ws_flags)
  else
    call ShowWhitespace('')
  endif
endfunction

nnoremap <Leader>ws :call ToggleShowWhitespace()<CR>
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" Поддержка мыши
set mouse=a
set mousemodel=popup

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

map <Leader>o :CtrlP<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.scssc,*.sassc


" Fix vimfiles mappings

nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" User vim as it supposed to deal with

"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

