" Setup vim
" =========

" use vim not vi
set nocompatible

" Plugin config
" =============
" setup Vundle for package management

" turn off filetype temporarily for vundle configuration
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Themes
"Plugin 'altercation/vim-colors-solarized'

" git helpers, mostly useful for :GBlame
Plugin 'tpope/vim-fugitive'
" sexy stylish status line
Plugin 'itchyny/lightline.vim'
" shows git changes to the left of line numbers
Plugin 'airblade/vim-gitgutter'
" expand selections using + and -
Plugin 'terryma/vim-expand-region'
" semi-useful directory tree via F2
Plugin 'scrooloose/nerdtree.git'
" fuzzy search across all files in directory
Plugin 'kien/ctrlp.vim'
" smart search within all files
Plugin 'rking/ag.vim'
" comment and uncomment lines quickly
Plugin 'scrooloose/nerdcommenter'
" fast multi-cursor editing
Plugin 'terryma/vim-multiple-cursors'
" subl-like smart completion of braces
Plugin 'Raimondi/delimitMate'
" snips
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" Gives smart completions for Javascript
"Plugin 'marijnh/tern_for_vim'
Plugin 'Shougo/neocomplete.vim'
" useful unix commands, move, remove, find, locate
Plugin 'tpope/vim-eunuch'
Plugin 'ReekenX/vim-rename2'

" Syntax
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'vim-ruby/vim-ruby'
Plugin 'skwp/vim-rspec'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'editorconfig/editorconfig-vim'

" Done configuring vundle
call vundle#end()
" re-enable filetypes now that vundle is configured
filetype plugin indent on


" Appearance
" ==========
syntax on
syntax enable
set t_Co=256
set noshowmode
colorscheme molokai

" General Config
" ==============
let mapleader='\'
set encoding=utf-8 nobomb
" show line numbers
set number
" Allow backspace in insert mode
set backspace=indent,eol,start
" show incomplete commands at bottom
set showcmd
" reload files changed outside of vim
set autoread
" always show status line
set laststatus=2
" allow buffers to exist in background
set hidden
" open vertical splits to the right
set splitright
" open horizontal splits on the bottom
set splitbelow
" optimize for fast terminal connections
set ttyfast
" disable error bells
set noerrorbells
" disable visual bells
set visualbell t_vb=
" don’t show the intro message when starting Vim
" don't show "ATTENTION" warnings
set shortmess=atIA
" use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Centralize backups, swapfiles and undo history
silent !mkdir ~/.vim/backups > /dev/null 2>&1
silent !mkdir ~/.vim/swaps > /dev/null 2>&1
silent !mkdir ~/.vim/undo > /dev/null 2>&1
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo


" Mouse Config
" ============
set mouse=a     " Enable mouse in all modes


" Search Settings
" ===============
set incsearch        " Find the next match as we type the search
set ignorecase       " ignore case of searches
set gdefault         " Add the g flag to search/replace by default
set hlsearch         " Highlight searches by default
set viminfo='100,f1  " Save up to 100 marks, enable capital marks


" Indentation and Display
" =======================
" We want to replace tabs with spaces and have 4 space width indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set nowrap
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list


" Scrolling
" =========
" start scrolling three lines before the horizontal window border
set scrolloff=3


" Completion
" ==========
set wildmode=longest,list,full
set wildmenu                              " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=.DS_Store,*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*/.bundle/*,*/.git/*
set wildignore+=*/.sass-cache/*,*/tmp/*
set wildignore+=*/.tmp/*,*/.gradle/*,*/build/*
set wildignore+=*vim/backups*,argfile*,*/out/*


" Plugin config
" =============

" Neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" ag search
" bind K to grep word under cursor
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>
nnoremap <leader>f :Ag<space>

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" nerdtree
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapOpenSplit = 's'
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFind<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>

" CtrlP
" use ag for file listing
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>t :CtrlPTag<CR>

" Custom commands
" ===============
" tab navigation like a boss
nmap th :tabprevious<CR>
nmap tl :tabnext<CR>
" faster saving
nnoremap <leader>s :w<CR>
" faster command entry
nnoremap ; :

" create a new file and open in a new tab
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<CR>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<CR>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<CR>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<CR>

" remain in visual block mode after indent/outdent
vnoremap < <gv
vnoremap > >gv

" automatically strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Custom Formatting by filetype
" =============================
" Ruby
autocmd BufRead,BufNewFile *.rb,*.rake,Rakefile,Gemfile,*.scss,*.jbuilder setlocal shiftwidth=2 tabstop=2
autocmd FileType jbuilder setlocal shiftwidth=2 tabstop=2
autocmd FileType yml setlocal shiftwidth=2 tabstop=2
