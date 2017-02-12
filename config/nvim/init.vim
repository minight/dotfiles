" General Vim Settings
set t_Co=16
syntax enable
colorscheme Tomorrow-Night
filetype plugin indent on
set nu

set exrc
set secure
set noswapfile
set nobackup

set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set relativenumber

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
set showcmd
set formatoptions+=o    " Continue comment marker in new lines.

set autoread

set clipboard=unnamed
set clipboard+=unnamedplus " so it works with ubuntu

set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set esckeys             " Cursor keys in insert mode.

set list listchars=tab:>-,trail:.,extends:>

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
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

" Best remap i've ever done
nnoremap ; :
nnoremap : ;

" Gotta take this from Spacemacs - so good
let mapleader = "\<Space>"

" Splits
nnoremap <leader>- :split<CR>
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>c :close<CR>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <leader>1 <C-6>

" Tab Movement
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 gt

" Command output
nnoremap <leader>; :r!

" Scratch buffer
nnoremap <leader>s :e /tmp/scratch<CR>

" Kill buffers without having to kill the window
nnoremap <leader>bd :bp<CR>:bd#<CR>

" Buffer movement
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprevious!<CR>

" Easy escape from insert mode
inoremap jj <ESC>
inoremap jk <ESC>

" Easier navigation
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

" More logical paste (does not copy contents of overwritten)
vnoremap p "_dP

" Write as sudo
cnoremap w!! w !sudo tee % >/dev/null

" Search Clearing
nnoremap <esc> :noh<return><esc>

" Clean spaces
nnoremap <leader>ds :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Most useful snippet binding i've ever made
nnoremap <leader>p oimport IPython; shell = IPython.terminal.embed.InteractiveShellEmbed(); shell.mainloop()<ESC>

" Toggle Paste mode
nnoremap <leader>pp :setlocal paste!<CR>

" Terminal mode escaping
tnoremap <Esc> <C-\><C-n>

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif

" Folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space><space> za

" Something to get python3 working
"let g:python3_host_prog = '/usr/local/bin/python3'
"let g:python2_host_prog = '/usr/local/bin/python2'
"let g:python_host_prog = '/usr/local/bin/python3'
"let g:pymode_python = 'python3'

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" This rewires n and N to do the highlighing...
nnoremap <silent> n nzz:call HLNext(0.2)<cr>
nnoremap <silent> N Nzz:call HLNext(0.2)<cr>

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

" PLUGIN TIME

" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | nested source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
    " Autocomplete Engines
    Plug 'davidhalter/jedi-vim'
    Plug 'Valloric/YouCompleteMe', { 'dir': '~/.config/nvim/bundle/YouCompleteMe', 'do' : 'python3 install.py --clang-complete --tern-completer'}

    " Syntax Checkers
    Plug 'vim-syntastic/syntastic'

    " Fuzzy Finding
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " File Managers
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

    " Utilities
    Plug 'craigemery/vim-autotag'
    Plug 'jiangmiao/auto-pairs'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'

    " Syntax & Highlighters
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'ap/vim-css-color'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'godlygeek/tabular'
    Plug 'junegunn/vim-emoji'
    Plug 'plasticboy/vim-markdown'
    Plug 'sheerun/vim-polyglot'
    Plug 'tmhedberg/SimpylFold'
    Plug 'majutsushi/tagbar'
    Plug 'airblade/vim-gitgutter'

    " Make it pretty
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'bling/vim-bufferline'
call plug#end()

" YCM {
    let g:ycm_python_binary_path = 'python3'
" }

" JediVim {
    " Use jedivim for movement. but not for autocomplete
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#popup_on_dot           = 0
    let g:jedi#popup_select_first     = 0
    let g:jedi#completions_enabled    = 0
    let g:jedi#completions_command    = ""
    let g:jedi#show_call_signatures   = "1"
    " On the other hand, jedivim does movement fucking amazing
    let g:jedi#goto_assignments_command = "<leader>pa"
    let g:jedi#goto_definitions_command = "<leader>pd"
    let g:jedi#documentation_command    = "<leader>pk"
    let g:jedi#usages_command           = "<leader>pu"
    let g:jedi#rename_command           = "<leader>pr"
    let g:jedi#force_py_version = 3
    if jedi#init_python()
      function! s:jedi_auto_force_py_version() abort
        let major_version = pyenv#python#get_internal_major_version()
        call jedi#force_py_version(major_version)
      endfunction
      augroup vim-pyenv-custom-augroup
        autocmd! *
        autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
        autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
      augroup END
    endif
" }

" Vim-Airline {
    let g:airline_powerline_fonts = 1
    let g:airline_theme='dark'
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
    " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'
" }

" FZF {
    nnoremap <leader>ff :Files<CR>
    nnoremap <leader>fg :GFiles<CR>
    nnoremap <leader>fb :Buffers<CR>
    nnoremap <leader>fl :Lines<CR>
    nnoremap <leader>ft :Tags<CR>
    nnoremap <leader>fh :History:<CR>

    " This is the default extra key bindings
    let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

    " Default fzf layout
    " - down / up / left / right
    let g:fzf_layout = { 'down': '~40%' }

    " In Neovim, you can set up fzf window using a Vim command
    let g:fzf_layout = { 'window': 'enew' }
    let g:fzf_layout = { 'window': '-tabnew' }

    " Customize fzf colors to match your color scheme
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

    " Enable per-command history.
    " CTRL-N and CTRL-P will be automatically bound to next-history and
    " previous-history instead of down and up. If you don't like the change,
    " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
    let g:fzf_history_dir = '~/.local/share/fzf-history'

    " [Files] Extra options for fzf
    "   e.g. File preview using Highlight
    "        (http://www.andre-simon.de/doku/highlight/en/highlight.html)
    let g:fzf_files_options =
    \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1

    " [[B]Commits] Customize the options used by 'git log':
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'

    " [Commands] --expect expression for directly executing the command
    let g:fzf_commands_expect = 'alt-enter,ctrl-x'

    " Augmenting Ag command using fzf#vim#with_preview function
    "   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
    "   * Preview script requires Ruby
    "   * Install Highlight or CodeRay to enable syntax highlighting
    "
    "   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
    "   :Ag! - Start fzf in fullscreen and display the preview window above
    autocmd VimEnter * command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)

    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
" }

" Tabularize {
    nnoremap <leader>a= :Tabularize /=<CR>
    vnoremap <leader>a= :Tabularize /=<CR>
    nnoremap <leader>a: :Tabularize /:\zs<CR>
    vnoremap <leader>a: :Tabularize /:\zs<CR>
" }

" NERDTree {
    nnoremap <leader>tn :NERDTreeToggle<CR>
    nnoremap <leader>tf :NERDTreeFind<CR>
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe NERDTree argv()[0] | wincmd p | ene | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    let NERDTreeShowHidden=1

    let NERDTreeIgnore=['\~$', '\.git$', '.DS_Store', '\.pyc$']
" }

" vim-markdown {
    let g:vim_markdown_fenced_languages = ['csharp=cs', 'python=py', 'py=py', 'js=js']
" }

" vim-multicursor {
    " put here because its hard to remember
    let g:multi_cursor_next_key = '<C-n>'
    let g:multi_cursor_prev_key = '<C-p>'
    let g:multi_cursor_skip_key = '<C-x>'
    let g:multi_cursor_quit_key = '<Esc>'
" }

" SimpylFold {
    let g:SimpylFold_docstring_preview = 1
" }

" YAPF {
    autocmd FileType python nnoremap <leader>py :0,$!yapf<Cr><C-o>
" }

" Syntastic {
    nnoremap <leader>st :SyntasticToggleMode<CR>
    nnoremap <leader>sc :SyntasticCheck<CR>
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_checkers = ['flake8']
    let g:syntastic_php_checkers = ['php']
" }

" Tagbar {
    nnoremap <leader>tb :TagbarToggle<CR>
" }

" File types {
    au BufNewFile,BufRead *.json,*.js,*.jsx setlocal expandtab ts=2 sw=2
    au BufNewFile,BufRead *.html,*.htm setlocal expandtab ts=2 sw=2
    au BufNewFile,BufRead *.css,*.less,*.scss setlocal expandtab ts=2 sw=2
    au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2

" }
