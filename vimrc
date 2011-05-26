set expandtab
set shiftwidth=4
set tabstop=4

filetype off

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set number
set cursorline
set title
set list
set listchars=tab:▸\ ,trail:-,nbsp:%
set nohlsearch
set incsearch
