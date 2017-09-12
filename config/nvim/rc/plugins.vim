
" PLUGIN TIME

" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | nested source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
    " Autocomplete Engines
    " Plug 'davidhalter/jedi-vim'
    " Plug 'Valloric/YouCompleteMe', { 'dir': '~/.config/nvim/bundle/YouCompleteMe', 'do' : 'python3 install.py --clang-complete --tern-completer'}
    " Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    " Plug 'zchee/deoplete-jedi'
    " Plug 'fatih/vim-go'

    " Snippets
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'

    " Syntax Checkers
    " Plug 'vim-syntastic/syntastic'
    " Plug 'vim-scripts/taglist.vim'

    " Fuzzy Finding
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " Plug 'junegunn/fzf.vim'

    " File Managers
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    "Plug 'Xuyuanp/nerdtree-git-plugin'


    " Buffer Manager
    "Plug 'jeetsukumaran/vim-buffergator'

    " Utilities
    "Plug 'craigemery/vim-autotag'
    "Plug 'jiangmiao/auto-pairs'
    "Plug 'terryma/vim-multiple-cursors'
    "Plug 'vim-scripts/indentpython.vim'
    "Plug 'tpope/vim-surround'
    "Plug 'tpope/vim-fugitive'
    "Plug 'majutsushi/tagbar'
    "Plug 'airblade/vim-gitgutter'
    "Plug 'scrooloose/nerdcommenter'

    " Syntax & Highlighters
    "Plug 'Glench/Vim-Jinja2-Syntax'
    "Plug 'ap/vim-css-color'
    "Plug 'bronson/vim-trailing-whitespace'
    "Plug 'godlygeek/tabular'
    "Plug 'junegunn/vim-emoji'
    "Plug 'plasticboy/vim-markdown'
    "Plug 'sheerun/vim-polyglot'
    "Plug 'tmhedberg/SimpylFold'
    "Plug 'hdima/python-syntax'
    "Plug 'vim-scripts/promela.vim'
    "Plug 'lervag/vimtex'
    "Plug 'xuhdev/vim-latex-live-preview'
    "Plug 'vim-scripts/Latex-Text-Formatter'
    "Plug 'vim-scripts/nginx.vim'


    " Make it pretty
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'bling/vim-bufferline'
call plug#end()
