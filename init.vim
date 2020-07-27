" poiza
call plug#begin("~/.config/nvim/plugged")

Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'ap/vim-css-color'
Plug 'dylanaraps/wal.vim'

call plug#end()

" deoplete "
let g:deoplete#enable_at_startup = 1
imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

syntax enable
colorscheme wal
set nocompatible

nnoremap Q @@
nnoremap Y y$


set clipboard+=unnamedplus " global clipboard
set iskeyword-=_
set number relativenumber
set ignorecase smartcase
set undofile " save undo after exit
set hidden
set lazyredraw " do not redraw screen after each macro command

"set timeoutlen=100
"set updatetime=300

" .py: space -> tab & execution by f9 "
au BufRead,BufNewFile *.py
	\ set tabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab
"au FileType python map <buffer> <F9> <esc>:w<cr>:exec '!python3' shellescape(@%, 1)<cr>

" .rb"
au BufRead,BufNewFile *.rb
	\ set tabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab
"au FileType ruby map <buffer> <F9> <esc>:w<cr>:exec '!ruby' shellescape(@%, 1)<cr>


" hi trailing whitespaces "
highlight ExtraWhitespace ctermbg=white guibg=white
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" learn vimscript the hard way ===============================================

let mapleader = ","
let maplocalleader = "\\"

echo ">^.^<"

" mappings for move line up/down
"nnoremap <leader>- ddp
"nno <leader>_ ddkkp
nm <localleader>- ddp
nm <leader>_ ddkkp
" uppcase current word in insert mod
" inormap <c-u> <esc>vawU<esc>ea
ino <c-u> <esc>vawU<esc>ea

nno <leader>cv :below split $MYVIMRC<cr>G
" TODO au source myvimrc
nno <leader>cb :below split ~/.bashrc <cr>
nno <leader>cs :below split ~/.spectrwm.conf <cr>
" TODO au on exit wm conf -> M-q
nnoremap <leader>sv :source $MYVIMRC<cr>

" ia[bbrev]
ia inc	#include 
ia @@	poiza@list.ru
ia ssig	-- <cr>Danila Terekhov<cr>poiza@list.ru

nmap H 0
nmap L $

vn <leader>' <esc>`<i'<esc>`>a'<esc>l
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

autocmd FileType python :iabbrev <buffer> iff if:<left><left>
im <Left> <nop>
im <Right> <nop>
im <Up> <nop>
im <Down> <nop>

au FileType python let g:Command = '!python3'
au FileType ruby let g:Command = '!ruby'
"nor <localleader>r <esc>:w<cr>:exec g:Command shellescape(@%, 1)<cr>

"TODO make list
autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType ruby nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType bash nnoremap <buffer> <localleader>c I#<esc>
autocmd BufNewFile,BufRead *.html setlocal nowrap
"asd

au FileType c :ia <buffer> return NOPENOPENOPE
au FileType c :ia <buffer> rr return
au FileType ruby :ia <buffer> init initialize<cr><tab>

augroup testgroup
	au BufWrite * :echom "Foo"
	au BufWrite * :echom "Bar"
augroup END

augroup testgroup
	au!
	au BufWrite * :echom "Qwe"
augroup END

" ono[remap]
ono an( :<c-u>normal! f(va(<cr>
ono al( :<c-u>normal! F)va(<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

ono an{ :<c-u>normal! f{va{<cr>
ono al{ :<c-u>normal! F}va{<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
