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
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
set background=dark
" colorscheme settings
" colorscheme molokai
let g:seoul256_background = 236
silent! colorscheme seoul256

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
set shortmess=atIAc
" use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Centralize backups, swapfiles and undo history
silent !mkdir ~/.vim/backups > /dev/null 2>&1
silent !mkdir ~/.vim/swaps > /dev/null 2>&1
silent !mkdir ~/.vim/undo > /dev/null 2>&1
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
set redrawtime=10000

" fugutive used to do this for me, now it's my job
set tags^=./.git/tags;

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
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" Plugin config
" =============

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" editorconfig is slow sometimes, this used to help
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" vim-test
" test runner load results to quickfix
" let test#strategy = "dispatch"
" test runer in tmux pane
" let test#strategy = "vtr"
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
" ctrl-p / ctrl-n cycle fzf history
let g:fzf_history_dir = '~/.local/share/fzf-history'

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

" coc.nvim
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" ale syntax linting
let g:ale_sign_column_always = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_linters = {
\   'ruby': ['ruby', 'rubocop', 'brakeman', 'rails_best_practices'],
\   'typescript': ['eslint', 'tsserver'],
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'typescript': ['prettier'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

" ===== TypeScript =====
" let g:tsuquyomi_use_vimproc = 1
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_completion_preview = 1
let g:tsuquyomi_completion_detail = 1

" adjust colors
highlight link ALEError Error
highlight link ALEStyleError Error
highlight ALEErrorSign guifg=#1E0010
highlight link ALEWarning WarningMsg
highlight link ALEStyleWarning WarningMsg
highlight ALEWarningSign guifg=#FFFFFF

" ===== GO =====
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_command="goimports"
" let g:go_auto_type_info=1
" let g:go_snippet_engine="neosnippet"

" ===== terraform =====
let g:terraform_fmt_on_save = 1

" helper functions
" ===============
" from: https://github.com/amix/vimrc/blob/768c72a3edf3825e7fd5c64a460b7cd6b7e475d5/vimrcs/basic.vim#L374
" changed based on issues explained here: https://github.com/vim/vim/issues/2310
function! VisualSelection(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'find'
    let @g="Ack \"" . l:pattern . "\" "
  elseif a:direction == 'replace'
    let @g="%s" . '/'. l:pattern . '/'
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
" disable highlight and clear search
nnoremap <silent> <Space> :noh<Bar>:echo<CR>""
" overcome the touchbar
inoremap jj <ESC>

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

" up and down by visual line
nnoremap j gj
nnoremap k gk

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
vnoremap <leader>f :call VisualSelection('find')<CR>:<C-U><C-R>=@g<CR>
" search now!
vnoremap <leader>F :call VisualSelection('find')<CR>:<C-U><C-R>=@g<CR><CR>
" When you press <leader>r you can search and replace the selected text
vnoremap <leader>r :call VisualSelection('replace')<CR>:<C-U><C-R>=@g<CR>

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

" filetyle overrides
autocmd BufRead,BufNewFile *Dockerfile.template set filetype=dockerfile

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish silent! unmap <buffer> <C-p>
augroup END

" automatically strip whitespace on save
autocmd BufWritePre * if index(leave_trailing_white_space, &ft) < 0 | :%s/\s\+$//e
" except in markdown
let leave_trailing_white_space = ['md', 'markdown']

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
