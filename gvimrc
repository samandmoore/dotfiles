set guifont=Hack:h13
" Better line-height
set linespace=6
" hide scrollbars

" tab navigation like other apps
nmap <C-S-TAB> :tabprevious<CR>
nmap <C-TAB> :tabnext<CR>
map <C-S-TAB> :tabprevious<CR>
map <C-TAB> :tabnext<CR>

" Enable ESC to clear highlighting after search
nnoremap <silent><esc> :noh<return><esc>

set lines=999 columns=9999

" hide scrollbars on right and left
" and hide toolbar
set guioptions-=T
set guioptions-=r
set guioptions-=L
