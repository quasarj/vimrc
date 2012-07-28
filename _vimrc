set nocompatible

" ---------------------------
"  Vundle settings
" ---------------------------
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Todo: what is this?
Bundle 'majutsushi/tagbar'

" vim-script repos
"Bundle 'snipMate'
Bundle 'The-NERD-tree'
Bundle 'pep8'
Bundle 'pyflakes'
Bundle 'pyflakes.vim'

" pydoc --- provides "<leader>pw" to get python documentation on the
" word under the cursor.
" In order to get pydoc working with windows (with default Python27)
" First, ensure python is on the path, as well as c:\python27\Scripts
" Then, create a .bat file in c:\python27\scripts called pydoc.bat
" Place this line in the file: (without leading ", but *with* the @)
" @python c:\Python27\Lib\pydoc.py %*
Bundle 'pydoc.vim'

"Bundle 'SuperTab'
Bundle 'SuperTab-continued.'
Bundle 'YankRing.vim'
"Bundle 'VimClojure'

" Better undo support with Gundo
Bundle 'Gundo'

" Note that Command-T requires Ruby, and 
" the extention must be manually compiled
" after the Bundle is installed
Bundle 'Command-T'

" A simple Buffer Explorer, adds a line to the top
" of the screen when you have multiple buffers open.
" Bundle 'fholgado/minibufexpl.vim'

" html color coloring
Bundle 'skammer/vim-css-color'

" Zen Coding
Bundle 'mattn/zencoding-vim'

" commentary - quickly comment stuff out with \\\
Bundle 'tpope/vim-commentary.git'

" CtrlP - a pure Vimscript Command-T replacement
Bundle 'kien/ctrlp.vim'


" ColorScheme bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/Mustang2.git'
Bundle 'vim-scripts/BusyBee.git'
Bundle 'sjl/badwolf'
Bundle 'chriskempson/vim-tomorrow-theme.git'


" Enable full filetype plugin support
filetype plugin indent on
set modelines=0  " fully disable modelines

" SuperTab python settings
" Todo: This should possibly be moved into the python ftplugin?
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

set completeopt=menuone,longest,preview


" ------------------------
"  Syntax related stuff
" ------------------------

syntax on

set nowrap

" Disable backup and copy-on-save
" This is mainly useful for windows
" set nobackup
" set nowritebackup

" Insert spaces instead of tabs (4)
set tabstop=4
set shiftwidth=4    " shift four at a time with > <
set softtabstop=4   " backspace 4 spaces at a time
set expandtab       " replace tabs with spaces

" Search related
set hlsearch    " highlight search matches
set incsearch   " immediately show matches while typing
set ignorecase  " ignore case by default
set smartcase   " override ignorecase if search has uppercase
set scrolloff=3 " show 3 lines of contexte when moving to
                " the next search match



" Other stuff
set cursorline  " highlight the line the cursor is on
set wildmenu    " this menu is too wild to handle!
set hidden      " Allow switching away from unsaved buffers
set ruler       " display line number and % info
"set laststatus=2 " Always display window status bar
set colorcolumn=80 " Display a line at 80 characters


" ------------------------
"       Key bindings
" ------------------------

let mapleader = ","

" arrow keys are evil!
nmap <Right> :bn<CR>
nmap <Left>  :bp<CR>
nmap <Up>    :bfirst<CR>
nmap <Down>  :b

imap <Right> NO ARROW KEYS FOR YOU!
imap <Left>  NO ARROW KEYS FOR YOU!
imap <Up>    NO ARROW KEYS FOR YOU!
imap <Down>  NO ARROW KEYS FOR YOU!

" universal remappings
nmap <leader>src :source $MYVIMRC<CR>
nmap <leader>erc :e $MYVIMRC<CR>

" code commenting
map <leader>3 :s/^/#/<CR>:noh<CR>
map <leader># :s/^#//<CR>:noh<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" CommandT
nmap <silent> <leader>t :CommandT<CR>

" Gundo
nmap <leader>g :GundoToggle<CR>

" make esc disable highlightning in command mode
nmap <silent> <esc> :noh<CR>


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

if has("gui_running")
    " font
    set guifont="DejaVu Sans Mono 10"

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
    
    " Simpler saveas
    map :W :browse confirm saveas
    map :O :browse confirm open 

    " Use the same symbols as TextMate for tabstops and EOLs
    set listchars=tab:▸\ ,eol:¬
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
