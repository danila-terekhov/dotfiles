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
Plug 'artur-shaik/vim-javacomplete2'
Plug 'vim-scripts/java_getset.vim'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'

call plug#end()

" deoplete
let g:deoplete#enable_at_startup = 1


"}}}

" Maps {{{

nnoremap Q @@
nnoremap Y y$
nnoremap ZW :w<cr>
nnoremap dD "_dd
imap <Left> <nop>
imap <Right> <nop>
imap <Up> <nop>
imap <Down> <nop>
nnoremap <leader>r <esc>:w<cr>:call RunScript() <cr>

" Configs
nnoremap <leader>cv :below split $MYVIMRC <cr>
nnoremap <leader>sv :source $MYVIMRC <cr>
nnoremap <leader>cb :below split ~/.bashrc <cr>
nnoremap <leader>cs :below split ~/.config/spectrwm/spectrwm.conf <cr>

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
set hidden " dont need to save buffer before switch to another
set lazyredraw " do not redraw screen after each macro command
"set wildmenu " default on
set path+=**


" }}}

" Autocmds {{{

augroup python
	autocmd!
	autocmd BufRead,BufNewFile *.py
	\ setlocal tabstop=4 |
	\ setlocal shiftwidth=4 |
	\ setlocal expandtab
	" prev unneded?
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

augroup bash
	autocmd!
	au FileType sh
	\ let b:script_command = "bash"
	iabbr <buffer> sb #!/usr/bin/env bash<cr>
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
	autocmd BufWritePost ~/.bashrc execute "!source ~/.bashrc"
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

" java {{{

autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable

" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Disable or enable loclist at the bottom of vim
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0


" Setup compilers for languages

let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \  'java': ['javac']
      \ }

" }}}

" vim:set fdm=marker:
