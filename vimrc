" Setup vim
" =========

" use vim not vi
set nocompatible

" enable recursive finds
set path+=**

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
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
set background=dark
" colorscheme settings
colorscheme molokai
" colorscheme seoul256

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
" use neocomplete for now
" set omnifunc=syntaxcomplete#Complete
" set completeopt=longest,menuone

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
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
  " Used to be this...
  "return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" buffergator
let g:buffergator_suppress_keymaps = 1
nnoremap [b :BuffergatorMruCyclePrev<CR>
nnoremap ]b :BuffergatorMruCycleNext<CR>
nnoremap <leader>b :BuffergatorToggle<CR>

" editorconfig is slow sometimes, this used to help
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" vim-test
" let test#strategy = "dispatch"
let test#strategy = "vtr"
nnoremap <leader>tn :TestNearest<cr>
nnoremap <leader>ta :TestFile<cr>

" Use ripgrep https://github.com/BurntSushi/ripgrep
if executable('rg')
  " Use rg over Grep
  set grepprg=rg\ --no-heading\ --vimgrep
  " Use rg over ack
  let g:ackprg = 'rg --vimgrep --smart-case'
endif

" use 's' for horizontal splits
let g:ack_mappings = {
  \ "s": "<C-W><CR><C-W>K",
  \ "gs": "<C-W><CR><C-W>K<C-W>b"
  \ }

" fzf
" use less of the screen by default
let g:fzf_layout = { 'down': '~25%' }
" open fzf with ctrl+p
nmap <C-p> :Files<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in .git/ and node_modules/)
" --color: Search color options
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ --glob "!{.git,node_modules}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" helper functions
" ===============
" from: https://github.com/amix/vimrc/blob/768c72a3edf3825e7fd5c64a460b7cd6b7e475d5/vimrcs/basic.vim#L374
function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'find'
    call CmdLine("Ack \"" . l:pattern . "\" ")
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
" end helper functions


" Custom commands
" ===============
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" faster saving
nnoremap <leader>s :w<CR>
" faster command entry
nnoremap ; :
" disable highlight
noremap <silent> <leader><CR> :noh<CR>
" hit space to clear search
nnoremap <silent> <Space> :noh<Bar>:echo<CR>""

" create a new file and open in a new tab
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<CR>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<CR>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<CR>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<CR>

" copy current path
map <silent> <leader>C :let @* = expand("%:p")<CR>:echo "Copied: ".expand("%:p")<CR>

" remain in visual block mode after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Ack search
" bind K to grep word under cursor
nnoremap K :Ack! -w "<C-R><C-W>"<CR>
nnoremap <leader>f :Ack<space>
" When you grep, display your results in cope by doing:
map <silent> <leader>co :botright cope<CR>
map <silent> <leader>cc :ccl<CR>
" To go to the next search result do:
map <silent> <leader>n :cn<CR>
" To go to the previous search results do:
map <silent> <leader>p :cp<CR>

" When you press <leader>f you Ack after the selected text
vnoremap <silent> <leader>f :call VisualSelection('find')<CR>
" search now!
vnoremap <silent> <leader>F :call VisualSelection('find')<CR><CR>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" automagical directory changing for big repos and ruby testing
function! s:setVimTestRubyProjectRoot()
  let parts = split(expand("%:p"), "/")
  let test_dir_idx = index(parts, "spec")

  if test_dir_idx < 0
    let test_dir_idx = index(parts, "test")
  endif

  if test_dir_idx < 0
    return
  endif

  let root_parts = parts[0:test_dir_idx-1]
  let g:test#project_root = "/".join(root_parts, "/")
endfunction

function! s:resetVimTestRubyProjectRoot()
  unlet g:test#project_root
endfunction
autocmd BufEnter *_spec.rb,*_test.rb silent! call s:setVimTestRubyProjectRoot()
autocmd BufLeave *_spec.rb,*_test.rb silent! call s:resetVimTestRubyProjectRoot()

" automatically strip whitespace on save
autocmd BufWritePre * if index(leave_trailing_white_space, &ft) < 0 | :%s/\s\+$//e
" except in markdown
let leave_trailing_white_space = ['md', 'markdown']

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
