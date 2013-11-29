" Make vim more useful
set nocompatible
set term=xterm-256color

" required for vundle!
filetype off

" vundle config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'itchyny/lightline.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-expand-region'
Bundle 'mileszs/ack.vim.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'

" required for vundle
filetype plugin indent on

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
  \ }

set wildignore+=*/node_modules/*,*.png,.DS_Store,.rspec,Gemfile.lock,*/.bundle/*,*/.git/*,*/.sass-cache/*,*/.tmp/*,*/.gradle/*,*/build/*

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as four spaces
set tabstop=4
" Insert spaces instead of tabs
set expandtab
" Display tabs as four spaces
set shiftwidth=4
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Disabled visual bells
set visualbell t_vb=
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Autocomplete is the thing we want
set completeopt=menuone,longest
" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Enable Tab to indent and shift+tab to unindent
inoremap <TAB> <C-T>
inoremap <S-TAB> <C-D>
" Faster switching between split windows :split mode
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" Make it easier to navigate while in insert mode
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
imap <C-w> <C-o>w
imap <C-b> <C-o>b
imap <C-^> <C-o>^
imap <C-$> <C-o>$
" tab navigation like a boss
nmap th :tabprevious<CR>
nmap tl :tabnext<CR>
map <C-TAB> :tabnext<CR>
" NERDTree toggle
map <F2> :NERDTreeToggle<CR>
" easier esc and save
"imap <C-[> <ESC>:w!<CR>
nnoremap <leader>s :w<CR>
" insert lines without going into insert mode
"nnoremap <leader>O O<ESC>
"nnoremap <leader>o o<ESC>
" Ack like a boss
nnoremap <leader>f :Ack --smart-case<space>
" ctrlp keymaps
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>t :CtrlPTag<CR>
" faster command entry
nnoremap ; :

