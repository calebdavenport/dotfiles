set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'tpope/vim-repeat'
Plugin 'mbbill/undotree'
Plugin 'chikamichi/mediawiki.vim'
Plugin 'python-mode/python-mode'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'itchyny/lightline.vim'

call vundle#end()
filetype indent plugin on
"""""""""""""""""""""""""""""
" EVERYTHING ABOVE IS REQUIRED FOR VUNDLE
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""
syntax enable

set history=1000        " Increase command history
set cursorline          " Highlight the current line
set number              " Show line number

" Use 4 spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set autoindent          " Automatically indent new lines

set scrolloff=6         " Have cursor # lines away from edge when scrolling

set laststatus=2        " Always show statusline on all windows
set noshowmode          " Don't show mode on last statusline
set cc=80               " Set vertical line on column #

"""""""""""""""""""""""""""""
" Easy vertical movement thourgh word-wrapped lines
"""""""""""""""""""""""""""""
nnoremap k gk
nnoremap j gj

"""""""""""""""""""""""""""""
" Relative Number Toggle
"""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""
" Vundle Plugin Settings
"""""""""""""""""""""""""""""
colorscheme Tomorrow-Night
let g:lightline = {
    \ 'colorscheme': 'Tomorrow_Night',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \            [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }
