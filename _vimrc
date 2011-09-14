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


" load the system-wide vimrc
source $VIM\_vimrc

" ------------------------
"  My settings here
" ------------------------

" Insert spaces instead of tabs (4)
set tabstop=4
set shiftwidth=4
set expandtab

" font
set guifont=DejaVu_Sans_Mono:h10:cANSI


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

