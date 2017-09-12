
function! vimrc#on_filetype() abort "{{{
  if execute('filetype') =~# 'OFF'
    " Lazy loading
    silent! filetype plugin indent on
    syntax enable
    filetype detect
  endif
endfunction "}}}

function! vimrc#add_numbers(num) abort
  let prev_line = getline('.')[: col('.')-1]
  let next_line = getline('.')[col('.') :]
  let prev_num = matchstr(prev_line, '\d\+$')
  if prev_num != ''
    let next_num = matchstr(next_line, '^\d\+')
    let new_line = prev_line[: -len(prev_num)-1] .
          \ printf('%0'.len(prev_num . next_num).'d',
          \    max([0, substitute(prev_num . next_num, '^0\+', '', '')
          \         + a:num])) . next_line[len(next_num):]
  else
    let new_line = prev_line . substitute(next_line, '\d\+',
          \ "\\=printf('%0'.len(submatch(0)).'d',
          \         max([0, substitute(submatch(0), '^0\+', '', '')
          \              + a:num]))", '')
  endif

  if getline('.') !=# new_line
    call setline('.', new_line)
  endif
endfunction

function! vimrc#toggle_option(option_name) abort
  execute 'setlocal' a:option_name.'!'
  execute 'setlocal' a:option_name.'?'
endfunction
