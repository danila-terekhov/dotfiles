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


" usage "
set clipboard+=unnamedplus " global clipboard
set iskeyword-=_
set number relativenumber
set ignorecase smartcase
set undofile " save undo after exit
set hidden

" sped "
set lazyredraw " do not redraw screen after each macro command
set timeoutlen=100
set updatetime=300

" .py: space -> tab & execution by f9 "
au BufRead,BufNewFile *.py
	\ set tabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab
au FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
au FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" .rb"
au BufRead,BufNewFile *.rb
	\ set tabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab
au FileType ruby map <buffer> <F9> :w<CR>:exec '!ruby' shellescape(@%, 1)<CR>
au FileType ruby imap <buffer> <F9> <esc>:w<CR>:exec '!ruby' shellescape(@%, 1)<CR>

" hi trailing whitespaces "
highlight ExtraWhitespace ctermbg=white guibg=white
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
