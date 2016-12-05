set t_Co=16
syntax enable
colorscheme Tomorrow-Night
set nu

set exrc
set secure
" Gotta take this from Spacemacs - so good
let mapleader = "\<Space>"

" Unite
nnoremap <leader>f :Unite -start-insert file_rec buffer<CR>
nnoremap <leader>/ :Unite -start-insert line<CR>
nnoremap <leader>a :Unite grep:.<CR>

" CtrlP
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>B :CtrlPMixed<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

" Window movement
"nnoremap <leader>j <C-W><C-J>
"nnoremap <leader>k <C-W><C-K>
"nnoremap <leader>l <C-W><C-L>
"nnoremap <leader>h <C-W><C-H>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <leader>1 <C-6>

" Fancy IPython
nnoremap <leader>p oimport IPython; shell = IPython.terminal.embed.InteractiveShellEmbed(); shell.mainloop()<ESC>

" Command output
nnoremap <leader>; :r!

" Scratch buffer
nnoremap <leader>s :e /tmp/scratch<CR>

" Kill buffers without having to kill the window
nnoremap <leader>bd :bp<CR>:bd#<CR>

nnoremap <leader>- :split<CR>
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>c :close<CR>

set noswapfile
set nobackup

inoremap jj <ESC>
inoremap jk <ESC>

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (default was alias for yy)
nnoremap Y y$

nnoremap <leader>vs :vsplit<CR>:Explore<CR>
nnoremap <leader>hs :split<CR>:Explore<CR>

" Write as sudo
cnoremap w!! w !sudo tee % >/dev/null

" BUffer movement
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprevious!<CR>

" Search Clearing
nnoremap <esc> :noh<return><esc>

" Syntastic Disabler
nnoremap <leader>ts :SyntasticToggleMode<CR>

set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set smarttab
set smartindent

set smartcase
set incsearch
set ignorecase
set hlsearch
set showmatch

set list listchars=tab:>-,trail:.,extends:>

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif

highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

let python_highlight_all=1
syntax on

au BufRead,BufNewFile *.py,*.py match ErrorMsg '\%>95v.\+'

" This rewires n and N to do the highlighing...
nnoremap <silent> n nzz:call HLNext(0.2)<cr>
nnoremap <silent> N Nzz:call HLNext(0.2)<cr>

" Treat JSON files like javascript
au BufNewFile,BufRead *.json set ft=javascript

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

function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction

highlight WhiteOnRed guifg=white guibg=red

let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_winsize=60

nnoremap ; :
nnoremap : ;

let g:incpy#Name = "internal-python"
let g:Program = ""
let g:WindowRatio = 1.0/8

execute pathogen#infect()

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Make vim play nice with my fonts
let g:airline_powerline_fonts = 1

" something soemthing ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" NERDTree hotkeys
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <leader>tn :NERDTreeToggle<CR>


" Cscope


nnoremap  <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR><Tab>
nnoremap  <leader>ci :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
nnoremap  <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR><Tab>
nnoremap  <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR><Tab>
nnoremap  <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR><Tab>
nnoremap  <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR><Tab>
nnoremap  <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR><Tab>
nnoremap  <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR><Tab>
nnoremap <F5> :!cscope -b<CR>:cs reset<CR><CR>

set autoread
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set relativenumber
set guifont=Meslo\ LG\ S\ for\ Powerline
set hlsearch
set incsearch
set showmatch

execute pathogen#infect()
syntax on
filetype plugin indent on
set mouse=a
set clipboard=unnamed

set showmode
set showmatch
set showcmd
set formatoptions+=o    " Continue comment marker in new lines.

set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set esckeys             " Cursor keys in insert mode.

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space><space> za

" Simply Fold
let g:SimpylFold_docstring_preview = 1

"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" YCM
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{syntasticstatuslineflag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set runtimepath^=~/.vim/bundle/ag
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
endif
