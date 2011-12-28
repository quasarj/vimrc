" quasar-light
" vim color file for light background
" Currently supports gui mode only!
" This currently mirrors PyDev (Eclipse)'s Python highlightning

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "quasar-light"

hi Normal guifg=black guibg=white
hi Comment guifg=Grey
hi Constant guifg=#800000
hi String guifg=#00AA00 gui=italic
hi Special guifg=Magenta
hi Identifier guifg=Blue
hi Function gui=Bold guifg=Black
hi Statement gui=NONE guifg=#0000FF
hi PreProc guifg=#00AA00
hi Type gui=NONE guifg=Purple
hi Visual gui=NONE guifg=Black guibg=Grey
hi Search gui=NONE guifg=Black guibg=Yellow
hi Tag guifg=DarkGreen
hi Error guibg=Red guifg=White
hi Todo guifg=Blue guibg=Yellow
hi StatusLine gui=NONE guifg=Yellow guibg=DarkGray
hi LineNr guifg=Grey

hi! link MoreMsg        Comment
hi! link ErrorMsg       Visual
hi! link WarningMsg     ErrorMsg
hi! link Question       Comment
hi link Character	    Constant
hi link Number	        Constant
hi link Boolean	        Constant
hi link Float		    Number
hi link Conditional	    Statement
hi link Repeat	        Statement
hi link Label		    Statement
hi link Operator	    Statement
hi link Keyword	        Statement
hi link Exception	    Statement
hi link Include	        Identifier
hi link Define	        PreProc
hi link Macro		    PreProc
hi link PreCondit	    PreProc
hi link StorageClass	Type
hi link Structure	    Type
hi link Typedef	        Type
hi link SpecialChar	    Special
hi link Delimiter	    Special
hi link SpecialComment  Special
hi link Debug		    Special

" special mappings for python code
hi link pythonBuiltin   Statement
let python_space_error_highlight = 1
