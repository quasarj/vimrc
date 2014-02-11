" QDark
" Maintainer:   Quasar Jarosz (quasar@ja.rosz.org)
" Last Change:  2014-02-07

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "qdark"

set numberwidth=4

" General colors
hi CursorLine       guibg=#2E3436
hi CursorColumn     guibg=#2d2d2d ctermbg=236
hi MatchParen       guifg=#8942D6 guibg=NONE gui=bold cterm=bold ctermfg=135 ctermbg=none
hi Pmenu            guifg=#f6f3e8 guibg=#444444
hi PmenuSel         guifg=#000000 guibg=#cae682
hi ColorColumn      guibg=#414a4d ctermbg=238

hi Cursor       guifg=NONE    guibg=#656565 gui=none 
hi Normal       guifg=#f6f3e8 guibg=#2E3436 gui=none ctermfg=255
hi NonText      guifg=#808080 guibg=#2E3436 gui=none "ctermbg=244
hi LineNr       guifg=#99968b guibg=#303030 gui=none ctermfg=238 ctermbg=233
hi StatusLine   guifg=#f6f3e8 guibg=#444444 gui=italic 
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=none ctermbg=8
hi VertSplit    guifg=#444444 guibg=#444444 gui=none
hi Folded       guibg=#384048 guifg=#a0a8b0 gui=none
hi Title        guifg=#f6f3e8 guibg=NONE    gui=bold cterm=bold
hi Visual       guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey   guifg=#808080 guibg=#343434 gui=none

" Syntax highlighting
hi Comment      guifg=#99968b gui=italic ctermfg=245
hi Todo         guifg=#8f8f8f gui=italic
hi Constant     guifg=#e5786d gui=none ctermfg=178
hi String       guifg=#95e454 gui=italic ctermfg=202
" Identifier: ???
hi Identifier   guifg=#cae682 gui=none ctermfg=14
" Function: None, built-in functions, and function names on def lines.
hi Function     guifg=#cae682 gui=none ctermfg=226
" Type: Exception() is a type, possibly other things.
hi Type         guifg=#cae682 gui=none ctermfg=227
" Statement: keywords (def, if, else, while, etc)
hi Statement    guifg=#8ac6f2 gui=bold ctermfg=33 cterm=bold 
" Keyword:  ???
hi Keyword      guifg=#8ac6f2 gui=none ctermfg=178
hi PreProc      guifg=#e5786d gui=none ctermfg=213
hi Include      ctermfg=213
hi Number       guifg=#e5786d gui=none ctermfg=51
hi Special      guifg=#e7f6da gui=none ctermfg=160


