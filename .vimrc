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
""""""""""""""""""""""""""""""
" EVERYTHING ABOVE IS REQUIRED FOR VUNDLE
"""""""""""""""""""""""""""""

set history=500
syntax enable
" Show line number
set number

" Use 4 spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent

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
set noshowmode

" Easy vertical movement thourgh word-wrapped lines
nnoremap k gk
nnoremap j gj

" Status Line Config
"""""""""""""""""""""""""
set laststatus=2
set ruler
set cc=80

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
