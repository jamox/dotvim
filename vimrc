set expandtab
set shiftwidth=2
set tabstop=2

filetype off

runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#incubate()
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
set listchars=tab:>-,trail:-,nbsp:%
set nohlsearch
set incsearch
set history=1000
set undolevels=1000

autocmd BufWritePre * :call <SID>StripWhite()
fun! <SID>StripWhite()
    %s/[ \t]\+$//ge
    %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfun

inoremap <lt>/ </<C-X><C-O>

autocmd BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
highlight def link rubyRspec Function

let g:tex_flavor='latex'

" Haskell stuff
let g:haddock_browser="/usr/bin/firefox"
au BufEnter *.hs compiler ghc


" some modifications

" set nobackup
set nowritebackup
set noswapfile

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent

" Better copy & paste
"  When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" bind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" " it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


"  bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
 map <c-j> <c-w>j
 map <c-k> <c-w>k
 map <c-l> <c-w>l
 map <c-h> <c-w>h


" easier moving between tabs
 map <Leader>n <esc>:tabprevious<CR>
 map <Leader>m <esc>:tabnext<CR>

 " Quicksave command
 noremap <C-Z> :update<CR>
 vnoremap <C-Z> <C-C>:update<CR>
 inoremap <C-Z> <C-O>:update<CR>
