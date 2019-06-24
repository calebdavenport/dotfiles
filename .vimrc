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
" --------------------------------------- "
" EVERYTHING ABOVE IS REQUIRED FOR VUNDLE "
" --------------------------------------- "

" -------- "
" Settings "
" -------- "
try
    syntax enable       " Enable syntax if supported
catch
endtry

set history=1000        " Increase command history
set cursorline          " Highlight the current line
set number              " Show line number

"Have all swapfiles in a single directory
set directory^=$HOME/.swapfiles_vim//

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
set backspace=0         " Vi-behavior backspace

" ------------------ "
" Disable arrow keys "
" ------------------ "
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" ------------------------------------------------- "
" Easy vertical movement thourgh word-wrapped lines "
" ------------------------------------------------- "
nnoremap k gk
nnoremap j gj

" ------------------- "
" Move line(s) easily "
" ------------------- "

vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

nmap <C-k> ddkP
nmap <C-j> ddp

" ------------------------- "
" Leave Insert Mode with jk "
" ------------------------- "

inoremap <silent> jk <ESC>
inoremap <silent> kj <ESC>
set timeoutlen=50

" ---------------------- "
" Relative Number Toggle "
" ---------------------- "
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

" ---------------------- "
" Vundle Plugin Settings "
" ---------------------- "
try
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
catch
endtry

let g:pymode_folding = 0
