" Something to get python3 working
let g:python3_host_prog = '/Users/bytedance/.local/share/virtualenvs/nvim/bin/python3'
"let g:python2_host_prog = '/usr/local/bin/python2'
let g:python_host_prog = '/Users/bytedance/.local/share/virtualenvs/nvim/bin/python'
let g:pymode_python = 'python3'
"
" Don't use this method anymore of retrieving python. We want to always use
" this global venv for python. then we use the virtualenv to add in our extra
" paths
" if exists("$VIRTUAL_ENV")
"     let g:python_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
"     let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
" else
"     let g:python_host_prog=substitute(system("which python3"), "\n", '', 'g')
"     let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
" endif

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

" Helper Functions
function! HLNext (blinktime)
    highlight WhiteOnRed ctermfg=white ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
au BufRead,BufNewFile *.py,*.py match ErrorMsg '\%>95v.\+'

" No idea what these do but its there
augroup line_return
    au!
        au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"zvzz' |
        \ endif
augroup END

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END


set t_ti= t_te=
