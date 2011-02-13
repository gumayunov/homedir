let g:CSApprox_loaded = 1

source ~/.vim/vimrc


let g:fuzzy_ignore = "gems/*;vendor/rails/*"

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

" Quick jumping between splits
map <C-J> <C-W>j
map <C-K> <C-W>k

" C-c and C-v - Copy/Paste в "глобальный клипборд"
vmap <C-C> "+gy
imap <C-V> <esc>"+gP
vmap <C-V> "+gP
vmap <C-X> "+gx

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

map <C-H> :Moccur<cr>

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

au FileType perl set iskeyword=@,48-57,_,192-255,:
au BufReadPost cd %:h

au FileType ruby set shiftwidth=2
au FileType ruby set softtabstop=2
au FileType ruby set tabstop=2

au BufRead,BufNewFile *.phps set filetype=php
au BufRead,BufNewFile *.thtml set filetype=php
au BufRead,BufNewFile *.pl set filetype=perl
au BufRead,BufNewFile *.pm set filetype=perl
au BufRead,BufNewFile *.rb set filetype=ruby
au BufRead,BufNewFile *.hrl set filetype=erlang
au BufNewFile,BufRead *.php let b:optionsset=0
au BufNewFile,BufRead *.php let b:PHP_autoformatcomment=0

let g:snippetsEmu_key = "<tab>"

" Настройки для Tlist (показвать только текущий файл в окне навигации по коду)
let g:Tlist_Show_One_File = 1

set completeopt-=preview
set completeopt+=longest
set mps-=[:]

set viminfo='10,\"100,:20,%,n~/.viminfo

hi clear

if exists("syntax_on")
    syntax reset
endif

"let colors_name = "textmate16"
"
"hi Normal ctermfg=Gray ctermbg=NONE
"hi Cursor ctermfg=Black ctermbg=Yellow
"hi Keyword ctermfg=Brown
"hi Define ctermfg=Brown
"hi Comment ctermfg=Darkmagenta
"hi Type ctermfg=White
"hi Identifier ctermfg=White
"hi Constant ctermfg=White
"hi Function ctermfg=White
"hi Include ctermfg=Brown
"hi Statement ctermfg=Brown
"hi String ctermfg=Darkgreen
"hi Search ctermbg=White
"
"hi rubySharpBang ctermfg=Darkmagenta
"hi rubySymbol ctermfg=Darkcyan
"hi rubyStringDelimiter ctermfg=Darkgreen
"hi rubyInterpolation ctermfg=White
"hi rubyPseudoVariable ctermfg=White
"hi RubyInteger ctermfg=Darkred
"hi RubyFloat ctermfg=Darkred
"hi RubyDocumentation ctermfg=White ctermbg=Darkgrey

"colorscheme vibrantink
colorscheme dark-ruby
"hi Normal ctermfg=White

" some fixes for dark-ruby theme
hi Pmenu ctermbg=blue ctermfg=yellow
hi Error ctermfg=white	guifg=white

function! s:FindEmAll(needle, path)
    cgetexpr system('find '.a:path.' -type f -not \( -iname "*.swp" -or -iname "*.jpg" -or -iname "*.png" -or -iname "*.gif" -or -iname "*.log" \) -print0 \| xargs -0 egrep -n "'.a:needle.'" \| sed -e "s/:(\d+)/\|$1\|/"' )
    copen
    wincmd L
endfunction

command! -complete=file -nargs=+ Find call s:FindEmAll(<f-args>)
