set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent

"set expandtab
"set shiftwidth=2
"set tabstop=2

set nocompatible
syntax on             " Enable syntax highlighting
" filetype on           " Enable filetype detection
" filetype indent on    " Enable filetype-specific indenting
" filetype plugin on    " Enable filetype-specific plugins

" Not wanted:
"filetype off

runtime bundle/vim-pathogen/autoload/pathogen.vim

" Load matchit library. This lets % match if/elsif/else/end, open/close
" XML tags, stuff like that, instead of just brackets and parens.
runtime macros/matchit.vim
"set ofu=syntaxcomplete#Complete

" Detect the OS
if has('unix')
    let s:uname = system('uname')
    if s:uname == "Darwin\n"
        let s:has_darwin = 1
    endif
endif

call pathogen#incubate()
call pathogen#helptags()
call pathogen#infect()

filetype plugin indent on

" syntax enable
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
set history=5000
set undolevels=5000
set term=screen-256color
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
" highlight matches, and use incremental search (like iTunes).
set hlsearch
set incsearch

" Ignore case in search patterns unless an uppercase character is used
" in the search, then pay attention to case.
set ignorecase
set smartcase
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
" noremap <C-X> :update<CR>
" vnoremap <C-X> <C-C>:update<CR>
" inoremap <C-X> <C-O>:update<CR>

" Clear the highlighted words from an hlsearch (can be visual clutter).
nnoremap <silent> <leader><space> :nohlsearch<cr>:call clearmatches()<cr>

" Turn hlsearch on or off.
nnoremap <leader>h :set hlsearch!<cr>

" how the current mode (INSERT, REPLACE, VISUAL, paste, etc.)
set showmode


" copy and paste {{{

" Key combo to toggle paste-mode
set pastetoggle=,p

" Duplicate current selection (best used for lines, but can be used
" with any selection). Pastes duplicate at end of select region.
vnoremap D y`>p

" Key combos to copy/paste using Mac clipboard
if exists('s:has_darwin')
    nnoremap <leader>c "*yy
    vnoremap <leader>c "*y
    nnoremap <leader>v "*p
    vnoremap <leader>v "*p
    " Variants that set paste first. How to preserve paste if it's
    " already set, though?
    " nnoremap <leader>v :set paste<cr>"*p:set nopaste<cr>
    " vnoremap <leader>v :set paste<cr>"*p:set nopaste<cr>
else
    nnoremap <leader>c :echoerr 'Only supported on Mac'<cr>
    vnoremap <leader>c :echoerr 'Only supported on Mac'<cr>
    nnoremap <leader>v :echoerr 'Only supported on Mac'<cr>
    vnoremap <leader>v :echoerr 'Only supported on Mac'<cr>
endif


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_use_bundler = 1

" inoremap <c-x><c-]> <c-a>

map <Leader>rt :!/usr/local/bin/ctags --language-force=ruby --exclude=.git --exclude=log --exclude=ext -R * `bundle show --paths`
map <silent><Leader>ry :!ctags --extra=+f --exclude=.git --exclude=log -R * `gem environment gemdir`/gems/*<CR><CR>

" Alt-right/left to navigate forward/backward in the tags stack
 map <M-Left> <C-T>
 map <M-Right> <C-]>

" glist
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
map <leader>ta :TlistToggle<cr>
map <leader>bta :!/usr/local/bin/ctags -R .<CR>
set tags=tags;/
map <m-j> <C-]>
map <m--> <c-]>
map <m-k> <C-T>

nnoremap <leader>. :CtrlPTag<cr>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation



" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

map <Leader>a :call RunAllSpecs()<CR>"
let g:ragtag_global_maps = 1




