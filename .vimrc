set background=dark


" Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
set nocompatible

" Показывать положение курсора всё время.
set ruler

" Показывать незавершённые команды в статусбаре
set showcmd

" Фолдинг по отсупам
"set foldmethod=indent

" Поиск по набору текста (очень полезная функция)
set incsearch

" Отключаем подстветку найденных вариантов, и так всё видно.
set nohlsearch

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolljump=7

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set scrolloff=7

" Выключаем надоедливый "звонок"
set novisualbell
set t_vb=

" Кодировка текста по умолчанию
set termencoding=utf-8

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

" Включить автоотступы
set autoindent

" Влючить подстветку синтаксиса
syntax on

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



" CTRL-F для omni completion
imap <C-F> <C-X><C-O>

" C-c and C-v - Copy/Paste в "глобальный клипборд"
vmap <C-C> "+y
imap <C-V> <esc>"+gP
vmap <C-V> "+gP
vmap <C-X> "+x

" Заставляем shift-insert работать как в Xterm
map <S-Insert> <MiddleMouse>

" C-y - удаление текущей строки
nmap <C-y> dd
imap <C-y> <esc>ddi

" Поиск и замена слова под курсором
"nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" F2 - быстрое сохранение
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>
imap <F2> <esc>:w<cr>

" F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F6 - предыдущий буфер
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>
imap <F6> <esc>:bp<cr>

" F7 - следующий буфер
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>
imap <F7> <esc>:bn<cr>


map <F8> :TlistToggle<cr>
vmap <F8> <esc>:TlistToggle<cr>
imap <F8> <esc>:TlistToggle<cr>

" F9 - "make" команда
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>
imap <F9> <esc>:make<cr>

" F10 - удалить буфер
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F11 - обозреватель файлов
map <F11> :Ex<cr>
vmap <F11> <esc>:Ex<cr>
imap <F11> <esc>:Ex<cr>

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
map <F3>        :emenu Encoding.<TAB>
map <C-e>       :emenu Encoding.<TAB>
imap <C-e>      <Esc>:emenu Encoding.<TAB>

" Меню для выбора типа файла (DOS, UNIX, Mac)
menu FileFormat.UNIX :e ++ff=unix
menu FileFormat.DOS :e ++ff=dos
menu FileFormat.Mac :e ++ff=mac
map <F4>        :emenu FileFormat.<TAB>

map <F12> :emenu Perl.Idioms.
imap <F12> <ESC>:emenu Perl.Idioms.

" С-q - выход из Vim
map <C-Q> <Esc>:qa<cr>

imap <C-S> <Esc>:w<CR>

" Автозавершение слов по tab =)
function g:InsertTabWrapper()
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k'
return "\<tab>"
else
return "\<space>\<backspace>\<c-p>"
endif
endfunction
"imap <tab> <space><backspace><c-r>=g:InsertTabWrapper()<cr>

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

" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype plugin on

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

let colors_name = "wombat"


" Vim >= 7.0 specific colors
if version >= 700
hi CursorLine guibg=#2d2d2d
hi CursorColumn guibg=#2d2d2d
hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
hi Pmenu guifg=#f6f3e8 guibg=#444444
hi PmenuSel guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor guifg=NONE guibg=#cccccc gui=none
hi Normal guifg=#cccccc guibg=#303030 gui=none
hi NonText guifg=#808080 guibg=#303030 gui=none
hi LineNr guifg=#857b6f guibg=#000000 gui=none
hi StatusLine guifg=#f6f3e8 guibg=#444444 gui=italic
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=none
hi VertSplit guifg=#444444 guibg=#444444 gui=none
hi Folded guibg=#384048 guifg=#a0a8b0 gui=none
hi Title guifg=#f6f3e8 guibg=NONE gui=bold
hi Visual guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey guifg=#808080 guibg=#343434 gui=none

" Syntax highlighting
hi Comment guifg=#99968b gui=italic
hi Todo guifg=#8f8f8f gui=italic
hi Constant guifg=#e5786d gui=none
hi String guifg=#95e454 gui=italic
hi Identifier guifg=#cae682 gui=none
hi Function guifg=#cae682 gui=none
hi Type guifg=#cae682 gui=none
hi Statement guifg=#8ac6f2 gui=none
hi Keyword guifg=#8ac6f2 gui=none
hi PreProc guifg=#e5786d gui=none
hi Number guifg=#e5786d gui=none
hi Special guifg=#e7f6da gui=none

