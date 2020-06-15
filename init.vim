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

colorscheme wal

nnoremap Q <nop>

syntax enable
set nocompatible
set iskeyword+=-
set clipboard+=unnamedplus " global clipboard
set number
set ignorecase smartcase
set nobackup
set timeoutlen=100
set updatetime=300

" space -> tab + execution by f9 "
autocmd BufRead,BufNewFile *.py set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
