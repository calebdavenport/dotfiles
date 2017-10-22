set history=500
syntax enable
filetype indent plugin on
" Show line number
set number

" Use 4 spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4

" Easy vertical movement thourgh word-wrapped lines
nnoremap k gk
nnoremap j gj

" Status Line Config
"""""""""""""""""""""""""
set laststatus=2
set ruler
set cc=80

" TODO: Create formatting of statusline below
" set statusline=

" Relative Number Toggle
"""""""""""""""""""""""""
noremap <F2> :call RelativeNumberOn()<CR>
inoremap <F2> <C-O>:call RelativeNumberOn()<CR>

function! RelativeNumberOn()
    noremap <F2> :call RelativeNumberOff()<CR>
    inoremap <F2> <C-O>:call RelativeNumberOff()<CR>
    set relativenumber 
endfunction

function! RelativeNumberOff()
    noremap <F2> :call RelativeNumberOn()<CR>
    inoremap <F2> <C-O>:call RelativeNumberOn()<CR>
    set norelativenumber 
endfunction
