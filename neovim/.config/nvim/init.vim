" poiza
echo ">^.^<"

let mapleader = ","
let maplocalleader = "\\"

function! RunScript()
    silent !clear
    execute "!" . b:script_command . " " . bufname("%")
endfunction

" hi trailing whitespaces {{{

hi ExtraWhitespace ctermbg=yellow
augroup whitespaces
	au!
	autocmd ColorScheme * highlight ExtraWhitespace ctermbg=yellow
	match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd BufWinLeave * call clearmatches()
augroup END

" }}}

" Plugins {{{

call plug#begin("~/.config/nvim/plugged")

Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
"Plug 'fishbullet/deoplete-ruby'
Plug 'dylanaraps/wal.vim'
Plug 'ap/vim-css-color'

call plug#end()

" deoplete 
let g:deoplete#enable_at_startup = 1

imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

augroup deoplete
	autocmd!
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

"}}}

" Maps {{{

nnoremap Q @@
nnoremap Y y$
imap <Left> <nop>
imap <Right> <nop>
imap <Up> <nop>
imap <Down> <nop>
nnoremap <leader>r <esc>:w<cr>:call RunScript()<cr>

" Configs
nnoremap <leader>cv :below split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>cb :below split ~/.bashrc <cr>
nnoremap <leader>cs :below split ~/.spectrwm.conf <cr>

" }}}

" Setters {{{

syntax enable
colorscheme wal

set nocompatible
set clipboard+=unnamedplus " global clipboard
set iskeyword-=_
set number relativenumber
set ignorecase smartcase
set undofile " save undo after exit
set hidden
set lazyredraw " do not redraw screen after each macro command

" }}}

" Autocmds {{{

augroup vim
	autocmd!
	autocmd FileType vim
	\ setlocal foldmethod=marker
augroup END

augroup python
	autocmd!
	autocmd BufRead,BufNewFile *.py
	\ setlocal tabstop=4 |
	\ setlocal shiftwidth=4 |
	\ setlocal expandtab
	au FileType python
	\ let b:script_command = "python3" |
	\ setlocal makeprg=pylint\ --output-format=parseable
augroup END

augroup ruby
	autocmd!
	au BufRead,BufNewFile *.rb
	\ setlocal tabstop=2 |
	\ setlocal shiftwidth=2 |
	\ setlocal expandtab |
	\ setlocal makeprg=standardrb
	au FileType ruby 
	\ let b:script_command = "ruby" |
	\ iabbr <buffer> init initialize<cr><tab>
augroup END

augroup c
	autocmd!
	autocmd Filetype c,cpp
	\ iabbr <buffer> rr return| 
	\ iabbr <buffer> return NOPENOPENOPE 
augroup END

augroup markdown
	autocmd!
	autocmd BufNewFile,BufRead *.md set filetype=markdown
	autocmd FileType markdown 
	\ setlocal cursorline |
	\ set conceallevel=2
augroup END

augroup html
	autocmd!
	autocmd BufNewFile,BufRead *.html
	\ setlocal nowrap
augroup END

augroup source
	au!
	autocmd BufWritePost $MYVIMRC :source $MYVIMRC
	autocmd BufWritePost *spectrwm.conf execute "!pkill --signal SIGHUP scrotwm"
	autocmd BufWritePost ~.bashrc execute "!. ~/.bashrc"
	" prev au doesn't worck((9
	" mb bc of dedicated shell instance ?!?
augroup END

" }}}

" misc from lthw {{{

"vn <leader>' <esc>`<i'<esc>`>a'<esc>l
"nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

"autocmd BufNewFile,BufRead *.html setlocal nowrap

"" ono[remap]
"ono an( :<c-u>normal! f(va(<cr>
"ono al( :<c-u>normal! F)va(<cr>
"onoremap in( :<c-u>normal! f(vi(<cr>
"onoremap il( :<c-u>normal! F)vi(<cr>
"
"ono an{ :<c-u>normal! f{va{<cr>
"ono al{ :<c-u>normal! F}va{<cr>
"onoremap in{ :<c-u>normal! f{vi{<cr>
"onoremap il{ :<c-u>normal! F}vi{<cr>

" }}}
