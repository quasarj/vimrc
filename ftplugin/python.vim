" Custom filetype plugin for python
" This should be used along side python-syntax.vim
"       https://github.com/hdima/python-syntax

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

" python_highlight_builtins              "Highlight builtin functions and objects
" python_highlight_builtin_objs          "Highlight builtin objects only
" python_highlight_builtin_funcs         "Highlight builtin functions only
" python_highlight_exceptions            "Highlight standard exceptions
" python_highlight_string_formatting     "Highlight % string formatting
" python_highlight_string_format         "Highlight str.format syntax
" python_highlight_string_templates      "Highlight string.Template syntax
" python_highlight_indent_errors         "Highlight indentation errors
let python_highlight_space_errors = 0    "Highlight trailing spaces
" python_highlight_doctests              "Highlight doc-tests
" python_print_as_function               "Highlight 'print' statement as
"                                        "function for Python 2
" python_highlight_file_headers_as_comments
"                                        "Highlight shebang and coding
"                                        "headers as comments

let python_highlight_all = 1                   "Enable all the options above
                                       "NOTE: This option don't override
                                       "any previously set options

" python_slow_sync                       "Can be set to 0 for slow machines




nmap <buffer> <F9> :!python2 %<CR>


setlocal cinkeys-=0#
setlocal indentkeys-=0#
setlocal include=\s*\\(from\\\|import\\)
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal suffixesadd=.py
setlocal comments-=:%
setlocal commentstring=#%s

setlocal omnifunc=pythoncomplete#Complete

set wildignore+=*.pyc

nnoremap <silent> <buffer> ]] :call <SID>Python_jump('/^\(class\\|def\)')<cr>
nnoremap <silent> <buffer> [[ :call <SID>Python_jump('?^\(class\\|def\)')<cr>
nnoremap <silent> <buffer> ]m :call <SID>Python_jump('/^\s*\(class\\|def\)')<cr>
nnoremap <silent> <buffer> [m :call <SID>Python_jump('?^\s*\(class\\|def\)')<cr>


if exists('*<SID>Python_jump') | finish | endif

fun! <SID>Python_jump(motion) range
    let cnt = v:count1
    let save = @/    " save last search pattern
    mark '
    while cnt > 0
	silent! exe a:motion
	let cnt = cnt - 1
    endwhile
    call histdel('/', -1)
    let @/ = save    " restore last search pattern
endfun
