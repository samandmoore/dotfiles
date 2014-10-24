" Use the excellent Railscat theme by Jeff Kreeftmeijer (gVim-only)
" Use 13pt Menlo
set guifont=Menlo:h13
" Better line-height
set linespace=8
" Enable ESC to clear highlighting after search
" Can't do this in regular vimrc because the arrow keys go bananas
nnoremap <silent> <esc> :noh<return><esc>
" tab navigation like other apps
nmap <C-S-TAB> :tabprevious<CR>
nmap <C-TAB> :tabnext<CR>
map <C-S-TAB> :tabprevious<CR>
map <C-TAB> :tabnext<CR>

set lines=999 columns=9999
