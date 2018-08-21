"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

set nocompatible              " be iMproved, required
filetype off                  " required

"---- Plugins ----"
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'dylanaraps/wal.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'junegunn/goyo.vim'
Plugin 'noahfrederick/vim-noctu'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chrisbra/colorizer'
Plugin 'evandotpro/nerdtree-chmod'
Plugin 'itchyny/calendar.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'zyedidia/vim-snake'

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

" tabular
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" ack
nnoremap <leader>s :Ack
nnoremap <leader>ms /def\s

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

"---- Key bindings ----"
nmap <C-p> :FZF<CR>
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
