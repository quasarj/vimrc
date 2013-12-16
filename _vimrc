set nocompatible

filetype off


" ---------------------------
"  Vundle settings
" ---------------------------

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Excellent completion plugin for many filetypes
" Note that it must be compiled outside of vim
Bundle 'Valloric/YouCompleteMe'

" vim-script repos
Bundle 'The-NERD-tree'
Bundle 'pep8'

Bundle 'YankRing.vim'

" Better undo support with Gundo
Bundle 'Gundo'

" Awesome fuzzy file searching
" Note that Command-T requires Ruby, and 
" the extention must be manually compiled
" after the Bundle is installed
Bundle 'Command-T'


" --------------------
"  HTML stuff
" --------------------

" html color coloring
Bundle 'skammer/vim-css-color'

" Zen Coding
Bundle 'mattn/zencoding-vim'

" --------------------


" commentary - quickly comment stuff out with \\\
Bundle 'tpope/vim-commentary.git'


" Enable full filetype plugin support
filetype plugin indent on

" SuperTab python settings
" Todo: This should possibly be moved into the python ftplugin?
" au FileType python set omnifunc=pythoncomplete#Complete
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

set completeopt=menuone,longest,preview


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
" nmap <silent> <esc> :noh<CR>


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

" map window movement keys
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-j> <c-w>j
map <c-k> <c-w>k

" some commands to help with slow pinkies!
command W w
command Q q


syntax on


if has("gui_running")
" ------------------------
"  GUI-specific settings
" ------------------------

    " Powerline
    " Note: This requires quasarj/dotfiles to be installed
    set rtp+=~/.dotfiles/submodules/powerline/powerline/bindings/vim

    " font
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11

    " hide menu and toolbar
    set go-=m
    set go-=T
    " hide the right scrollbar
    set go-=r

    " set some other windows stuff
    set lines=35 columns=100
    " winpos 100 100
    " winpos 432 329
    set number

    colo qdark
    " colo satori
    " colo zellner
    " colo quasar-light
    
    " Simpler saveas
    map :W :browse confirm saveas
    map :O :browse confirm open 

    " Use the same symbols as TextMate for tabstops and EOLs
    set listchars=tab:▸\ ,eol:¬


    " ------------------------
    "  SYNTAX RELATED STUFF
    " ------------------------

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
    set colorcolumn=80 " Display a line at 80 characters
    set wildmenu    " this menu is too wild to handle!
    set hidden      " Allow switching away from unsaved buffers
    " The following settings are for powerline.
    " If you remove powerline, you should adjust these
    set noruler       " display line number and % info
    set laststatus=2 " Always display window status bar
    set noshowmode   " do not show mode text in the bottom bar
    set modelines=0  " fully disable modelines

else
" ------------------------
"  Console-specific settings
" ------------------------

    " ------------------------
    "  SYNTAX RELATED STUFF
    " ------------------------

    set t_Co=256    " force 256 color mode. This really shouldn't be here :(
    colo qdark

    set wrap " scrolling will probably be hard on the console

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
    set colorcolumn=80  " Display a line at 80 characters
    set wildmenu        " this menu is too wild to handle!
    set ruler           " display line number and % info
    set laststatus=2    " Always display window status bar
    set number          " Line numbers on by default

endif 


" TODO: The following two sections need to be examined,
" I do not currently understand how they are working, or even
" if they are working (or are needed any longer).


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
