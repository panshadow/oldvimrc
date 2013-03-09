set backspace=eol,start,indent
set autoindent      " always set autoindenting on
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set number
set softtabstop=4
set shiftwidth=4
set expandtab


" mapping {{{
"}}}

let mapleader = ","

set cpo-=<

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set background=dark
  syntax on
  set hlsearch
  set tabstop=4
endif

set listchars=extends:>,precedes:<


map         <C-J>   :nohl<CR>
imap        <C-J>   <ESC>:nohl<CR>i

noremap     <Up>    gk
noremap!    <Up>    <C-O>gk
noremap     <Down>  gj
noremap!    <Down>  <C-O>gj
cunmap      <Up>
cunmap      <Down>

nmap        <C-;>   :prev
nmap        <C-'>   :next

nmap        <silent> _w :e ++enc=cp1251<CR>
nmap        <silent> _k :e ++enc=koi8-u<CR>
nmap        <silent> _u :e ++enc=utf8<CR>


set highlight=@:Nontext
hi Nontext ctermfg=Red
hi MatchParen ctermfg=red ctermbg=black guifg=lightblue
set lbr
set sbr=>\ 
set brk=!@*+;:,/?
set nowrap
nmap <C-L> :set wrap!<CR>
imap <C-L> <Esc>:set wrap!<CR>i

set foldclose=all

"scrolloff
set so=7
set siso=2
set sidescroll=2

set spelllang=uk
let b:match_words = '<:>,<tbody>:</tbody>,<table:</table>,<div:</div>,<td:</td>,<tr:</tr>'

set list
set listchars=tab:›·,trail:␣,eol:‹
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ \ \ \ \ \{%{&encoding}\}\ %{fugitive#statusline()}
set laststatus=2
set viminfo='50,<1000,s10,h,n~/.viminfo
nmap <silent> <leader>s :set nolist!<CR>

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |  exe "normal g`\"" | endif
autocmd Syntax json runtime! syntax/javascript.vim


runtime! ftplugin/man.vim

set matchtime=20


"set makeprg=/opt/local/bin/php\ -l\ %
"set errorformat=%m\ in\ %f\ on\ line\ %l


"nnoremap <silent> <F8> :TlistToggle<CR>
"highlight TagListTagName guifg=DarkGreen ctermfg=DarkGreen


"autocmd FileType php compiler php
"autocmd FileType php map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>
"nnoremap <silent> <F7> :NERDTreeToggle<CR>


nnoremap <silent> <leader>~ :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TagbarOpenAutoClose<CR>
nnoremap <silent> <M-Left> :bprev<CR>
nnoremap <silent> <M-Right> :bnext<CR>

function! MakeAbb()
    let long=@s
    let short=input("short:")
    exe "iab ". short ." ".long
endfunction

vnoremap <silent> <C-A> "sy<Esc>:call MakeAbb()<CR>

"let g:Powerline_symbols='fancy'
