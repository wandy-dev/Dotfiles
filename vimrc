"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

set nocompatible              " be iMproved, required
set encoding=UTF-8
filetype off                  " required

"---- Plugins ----"
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
set rtp+=~/Vim/bundle/netrw-browse-xdg
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'dylanaraps/wal.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'noahfrederick/vim-noctu'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chrisbra/colorizer'
Plugin 'evandotpro/nerdtree-chmod'
Plugin 'itchyny/calendar.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'zyedidia/vim-snake'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rhubarb'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ri-viewer'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'jremmen/vim-ripgrep'
Plugin 'mboughaba/i3config.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"---- Plugin configs ----"
" nerdtree
map <C-n> :NERDTreeToggle<CR>

" airline
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_atl_sep = ''
let g:airline_left_alt_sep = ''
let g:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1}'

" tabular
if exists(":Tabularize")
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t: :Tabularize /:\zs<CR>
  vmap <Leader>t: :Tabularize /:\zs<CR>
endif

" ack
nnoremap <leader>s :Ag
nnoremap <leader>ms /def\s

" ack
nnoremap <leader>G :GitGutterToggle<CR>

" calendar.vim
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" snake
let g:snake_rows = 20
let g:snake_cols = 50

"---- Color scheme ----"
colorscheme wal
set t_Co=256
syntax on

"---- Basic configs ----"
set hlsearch
set hidden
set background=dark
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set smarttab
set laststatus=2
set number
set path=$PWD/**
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
let mapleader=','

"---- Key bindings ----"
nmap <C-p> :FZF<CR>
nmap ; :Buffers<CR>
nmap <C-f> :NERDTreeFind<CR>
vnoremap <C-c> "*y :let @+=@*<CR>
nnoremap <leader>cf :let @+=expand("%")<CR>

"---- Vim Scripts ----"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
:noremap <leader>u :w<Home>silent <End> !urlview<CR>
:noremap <leader>g :Goyo<CR>

"---- View changes ----"
" 80 column highlight
:set colorcolumn=80
"let g:airline_powerline_fonts = 1

"---- Functions ----"
" Toggle relative numbering
function! ToggleRNU()
  :execute "set rnu!"
endfunction

command! Noh execute "noh"

nmap <leader>n :call ToggleRNU()<CR>

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()

" clean up trailing whitespace
map <leader>c :StripTrailingWhitespaces<cr>

function! LightlineFugitive()
  if &ft !~? 'Gundo\|NERD' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? 'â­  '._ : ''
  endif
    return ''
endfunction
:syntime on

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif
