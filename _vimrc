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
Bundle 'majutsushi/tagbar'

" vim-script repos
Bundle 'snipMate'
Bundle 'The-NERD-tree'
Bundle 'pep8'
Bundle 'pyflakes'
Bundle 'pyflakes.vim'
Bundle 'SuperTab'
"Bundle 'TagBar'
Bundle 'YankRing.vim'
Bundle 'delimitMate.vim'
Bundle 'VimClojure'

" color scheme repos
Bundle 'tomasr/molokai'


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
set hlsearch    " highlight search matches
set incsearch   " immediately show matches while typing
set ignorecase  " ignore case by default
set smartcase   " override ignorecase if search has uppercase

" universal remappings

nmap ,src :source $MYVIMRC<CR>
nmap ,erc :e $MYVIMRC<CR>

" make esc disable highlightning in command mode
nmap <silent> <esc> :noh<CR>
" the above is causing some issue in console mode

" code commenting
map ,3 :s/^/#/<CR>:noh<CR>
map ,# :s/^#//<CR>:noh<CR>

" mappings

" make C-F1 toggle the menu bar
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>	

" make F1 display NERDTree
nnoremap <F1> :NERDTreeToggle<CR>

" make F2 close current file
nnoremap <F2> :bd<CR>

" make F3 go to previous buffer
map <F3> :bp<CR>
" make F4 go to next buffer
map <F4> :bn<CR>


" make F11 bring up the yankring
nnoremap <silent> <F11> :YRShow<CR>

" make F12 toggle TagBar
nnoremap <silent> <F12> :TagbarToggle<CR>

" map window movement keys
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-j> <c-w>j
map <c-k> <c-w>k

" some commands to help with slow pinkies!
command W w
command Q q

if has("gui_running")
    " font
    set guifont=DejaVu_Sans_Mono:h10:cANSI

	" hide menu and toolbar
	set go-=m
	set go-=T

	" set some other windows stuff
	set lines=35 columns=100
	"winpos 100 100
	winpos 432 329
	set number

	colo wombat
    " colo satori
    " colo zellner
    " colo quasar-light
endif 

" add some unicode detection stuff
if has("multi_byte")    " if not, we need to recompile
  if &enc !~? '^u'      " if the locale 'encoding' starts with u or U
                        " then Unicode is already set
    if &tenc == ''
      let &tenc = &enc  " save the keyboard charset
    endif
    set enc=utf-8       " to support Unicode fully, we need to be able
                        " to represent all Unicode codepoints in memory
  endif
  set fencs=ucs-bom,utf-8,latin1
  setg bomb             " default for new Unicode files
  setg fenc=latin1      " default for files created from scratch
else
  echomsg 'Warning: Multibyte support is not compiled-in.'
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
