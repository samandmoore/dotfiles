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
Plugin 'mileszs/ack.vim'
" comment and uncomment lines quickly
Plugin 'scrooloose/nerdcommenter'
" fast multi-cursor editing
Plugin 'terryma/vim-multiple-cursors'
" subl-like smart completion of braces
Plugin 'Raimondi/delimitMate'
" Gives smart completions for Javascript
"Plugin 'marijnh/tern_for_vim'
" awesome auto-complete, when it works
Plugin 'Valloric/YouCompleteMe'
" useful unix commands, move, remove, find, locate
Plugin 'tpope/vim-eunuch'
Plugin 'ReekenX/vim-rename2'

" Syntax
Plugin 'jelera/vim-javascript-syntax'
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
set shortmess=atI
" use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif


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
set wildignore+=*vim/backups*


" Plugin config
" =============

" YouCompleteMe
" tell ycm where the python is or it will crash all the time
let g:ycm_path_to_python_interpreter = '/opt/boxen/pyenv/shims/python'

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Custom commands
" ===============
" tab navigation like a boss
nmap th :tabprevious<CR>
nmap tl :tabnext<CR>
" faster saving
nnoremap <leader>s :w<CR>
" ctrlp keymaps
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <F3> :CtrlPClearCache<CR>
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

" NERDTree keymaps
nnoremap <F2> :NERDTreeToggle<CR>

" automatically strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Custom Formatting by filetype
" =============================
" Ruby
autocmd BufRead,BufNewFile *.rb,*.rake,Rakefile,Gemfile,*.scss,*.jbuilder setlocal shiftwidth=2 tabstop=2
