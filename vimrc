" Setup vim
" =========

" use vim not vi
set nocompatible

" configure shell
set term=xterm-256color

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
Plugin 'marijnh/tern_for_vim'
" awesome auto-complete, when it works
Plugin 'Valloric/YouCompleteMe'

" Syntax
Plugin 'jelera/vim-javascript-syntax'
Plugin 'elzr/vim-json'
Plugin 'vim-ruby/vim-ruby'

" Done configuring vundle
call vundle#end()
" re-enable filetypes now that vundle is configured
filetype plugin indent on

" tell ycm where the python is or it will crash all the time
let g:ycm_path_to_python_interpreter = '/opt/boxen/pyenv/shims/python'

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

" set colors to hot themez
colorscheme molokai

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
set wildmode=longest,list,full
set wildignore+=*/node_modules/*,*.png,.DS_Store,Gemfile.lock,*/.bundle/*,*/.git/*,*/.sass-cache/*,*/.tmp/*,*/.gradle/*,*/build/*,*/tmp/*,*/bin/*
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
" auto reload files changed outside of vim
set autoread
" Change leader
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
syntax enable
set t_Co=256
" let lightline handle status
set noshowmode
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
" don't wrap lines
set nowrap
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
" open vertical splits right of current window
set splitright
" open horizontal splits below current window
set splitbelow
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
" create a new file and open in a new tab
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<CR>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<CR>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<CR>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<CR>

" custom tab widths per filetype
autocmd BufRead,BufNewFile *.rb,*.rake,Rakefile,Gemfile,*.scss setlocal shiftwidth=2 tabstop=2
