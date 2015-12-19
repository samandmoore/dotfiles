" Setup vim
" =========

" use vim not vi
set nocompatible

" Plugin config
" =============
" setup Vundle for package management

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

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
" We want to replace tabs with spaces and have 2 space width indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set nowrap
" Show "invisible" characters
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
set wildignore+=*coverage/*


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
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>

" buffergator
let g:buffergator_suppress_keymaps = 1
nnoremap [b :BuffergatorMruCyclePrev<CR>
nnoremap ]b :BuffergatorMruCycleNext<CR>
nnoremap <leader>b :BuffergatorToggle<CR>

" CtrlP
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>t :CtrlPTag<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

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
autocmd BufRead,BufNewFile *.rb,*.rake,Rakefile,Gemfile,*.scss,*.jbuilder,*.yml setlocal shiftwidth=2 tabstop=2
autocmd FileType jbuilder setlocal shiftwidth=2 tabstop=2
autocmd FileType yml setlocal shiftwidth=2 tabstop=2

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
