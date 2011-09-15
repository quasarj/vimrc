set nocompatible

" ---------------------------
"  Vundle settings
" ---------------------------
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" github repos
Bundle 'tpope/vim-fugitive'


" vimscript repos?
Bundle 'snipMate'
Bundle 'The-NERD-tree'
Bundle 'pep8'
Bundle 'pyflakes'
Bundle 'pyflakes.vim'


" this is something for the pyflakes-vim plugin?
filetype plugin indent on

" some windows settings
source $HOME/mswin.vim

" ------------------------
"  My settings here
" ------------------------

syntax on

" Disable backup and copy-on-save
" This is mainly useful for windows
set nobackup
set nowritebackup

" Insert spaces instead of tabs (4)
set tabstop=4
set shiftwidth=4
set expandtab

" Search related
set hlsearch    " when there is a previous search pattern, match all matches
set incsearch   " immediately show matches while typing
set ignorecase  " ignore case by default
set smartcase   " override ignorecase if search has uppercase

" font
set guifont=DejaVu_Sans_Mono:h10:cANSI

" universal remappings

nmap ,src :source $MYVIMRC<CR>
nmap ,erc :e $MYVIMRC<CR>

" code commenting
map ,3 :s/^/#/<CR>:noh<CR>
map ,# :s/^#//<CR>:noh<CR>


if has("gui_running")
	" mappings
	
	" make C-F1 toggle the menu bar
	nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>	

	" make F1 display NERDTree
	nnoremap <F1> :NERDTree<CR>

	" make F2 close current file
	nnoremap <F2> :q<CR>

	" make F3 cycle through open windows
	map <F3> <c-w>w

	" map window movement keys
	map <c-h> <c-w>h
	map <c-l> <c-w>l
	map <c-j> <c-w>j
	map <c-k> <c-w>k

	" hide menu and toolbar
	set go-=m
	set go-=T


	" set some other windows stuff
	set lines=35 columns=100
	"winpos 100 100
	winpos 432 329
	set number
	colorscheme wombat
endif 

if has("autocmd")

 " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

endif " has("autocmd")



