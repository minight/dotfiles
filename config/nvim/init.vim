" Disable builtin editorconfig (can add noticeable BufRead cost).
let g:editorconfig = v:false

" Configure python provider early (before providers load).
" Prefer the active virtualenv when launching nvim.
if has('nvim')
  let s:venv = exists('$VIRTUAL_ENV') ? $VIRTUAL_ENV : ''
  if !empty(s:venv) && executable(s:venv . '/bin/python3')
    let g:python3_host_prog = s:venv . '/bin/python3'
    if executable(s:venv . '/bin/python')
      let g:python_host_prog = s:venv . '/bin/python'
    endif
  else
    let g:python3_host_prog = expand('~/.local/share/virtualenvs/nvim/bin/python3')
    let g:python_host_prog = expand('~/.local/share/virtualenvs/nvim/bin/python')
  endif
endif

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/vimrc'
