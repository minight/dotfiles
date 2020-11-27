set t_Co=16
syntax enable
filetype off
colorscheme Tomorrow-Night

set nu

set exrc
set secure
set noswapfile
set nobackup

set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" set relativenumber

" Tab stuff
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set smarttab
set smartindent

" Search stuff
set smartcase
set incsearch
set ignorecase
set hlsearch
set showmatch
set showmode
set formatoptions+=o    " Continue comment marker in new lines.

set autoread

" set clipboard=unnamed
set clipboard+=unnamedplus " so it works with ubuntu
let g:clipboard = {
        \   'name': 'tmuxclip',
        \   'copy': {
        \      '+': 'xclip -i',
        \      '*': 'xclip -i',
        \    },
        \   'paste': {
        \      '+': 'xclip -o',
        \      '*': 'xclip -o',
        \   },
        \   'cache_enabled': 1,
        \ }

set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
" set esckeys             " Cursor keys in insert mode.

set list listchars=tab:>-,trail:.,extends:>

" speed up syntax highlighting
set nocursorcolumn
set nocursorline
set nolazyredraw
set noshowcmd

" Able to switch buffers without saving
set hid

syntax sync minlines=256
set synmaxcol=180
set re=1

set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

set laststatus=2
" For when i dont have powerline
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
"function! HasPaste()
"    if &paste
"        return 'PASTE MODE '
"    endif
"    return ''
"endfunction

" Highlight Colours
let python_highlight_all=1
highlight BadWhitespace ctermbg=red guibg=red
highlight WhiteOnRed guifg=white guibg=red

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if !has('nvim') && exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif

" Folding
set foldmethod=indent
set foldlevel=99
