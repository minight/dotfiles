
" PLUGIN TIME

" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | nested source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
    " Autocomplete Engines
    Plug 'davidhalter/jedi-vim', { 'on': [] }
    Plug 'Valloric/YouCompleteMe', { 'dir': '~/.config/nvim/bundle/YouCompleteMe', 'do' : 'python3 install.py --clang-complete --tern-completer', 'on':[] }
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
    Plug 'zchee/deoplete-jedi'
    " Plug 'fatih/vim-go'

    " Snippets
    Plug 'SirVer/ultisnips', { 'on': [] }
    Plug 'honza/vim-snippets'

    " Syntax Checkers
    Plug 'vim-syntastic/syntastic', { 'on': []}
    Plug 'vim-scripts/taglist.vim'

    " Fuzzy Finding
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " File Managers
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }


    " Buffer Manager
    Plug 'jeetsukumaran/vim-buffergator'

    " Utilities
    Plug 'craigemery/vim-autotag'
    Plug 'jiangmiao/auto-pairs'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'majutsushi/tagbar'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdcommenter'

    " Syntax & Highlighters
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'ap/vim-css-color'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'godlygeek/tabular'
    Plug 'junegunn/vim-emoji'
    Plug 'plasticboy/vim-markdown'
    Plug 'sheerun/vim-polyglot'
    Plug 'tmhedberg/SimpylFold'
    Plug 'hdima/python-syntax'
    Plug 'vim-scripts/promela.vim'
    Plug 'lervag/vimtex'
    Plug 'xuhdev/vim-latex-live-preview'
    Plug 'vim-scripts/Latex-Text-Formatter'
    Plug 'vim-scripts/nginx.vim'


    " Make it pretty
    Plug 'vim-airline/vim-airline', { 'on': [] }
    Plug 'vim-airline/vim-airline-themes', { 'on': [] }
    Plug 'bling/vim-bufferline'

    augroup load_insert
        autocmd!
        autocmd InsertEnter * call plug#load( 'ultisnips', 'YouCompleteMe', 'syntastic', 'jedi-vim')
        " autocmd InsertEnter * call plug#load( 'ultisnips', 'syntastic', 'jedi-vim')
                            \| autocmd! load_insert
    augroup END
    augroup load_after_gui
        autocmd!
        autocmd Vimenter * call plug#load( 'vim-airline', 'vim-airline-themes')
                            \| autocmd! load_after_gui
    augroup END
call plug#end()
filetype plugin indent on

" YCM {
    let g:ycm_python_binary_path = 'python'
    let g:ycm_complete_in_comments = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
" }
"

" JediVim {
    " Use jedivim for movement. but not for autocomplete
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#popup_on_dot           = 0
    let g:jedi#popup_select_first     = 0
    let g:jedi#completions_enabled    = 0
    let g:jedi#completions_command    = ""
    let g:jedi#show_call_signatures   = "1"
    let g:jedi#show_call_signatures_delay = 0
    " On the other hand, jedivim does movement fucking amazing
    let g:jedi#goto_assignments_command = "<leader>pa"
    let g:jedi#goto_definitions_command = "<leader>pd"
    let g:jedi#documentation_command    = "<leader>pk"
    let g:jedi#usages_command           = "<leader>pu"
    let g:jedi#rename_command           = "<leader>pr"
    "let g:jedi#force_py_version = 3
    "if jedi#init_python()
    "  function! s:jedi_auto_force_py_version() abort
    "    let major_version = pyenv#python#get_internal_major_version()
    "    call g:jedi#force_py_version(major_version)
    "  endfunction
    "  augroup vim-pyenv-custom-augroup
    "    autocmd! *
    "    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    "    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
    "  augroup END
    "endif
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
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | wincmd p | ene | endif
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    let NERDTreeShowHidden=1
    let NERDTreeIgnore=['\~$', '\.git$', '.DS_Store', '\.pyc$']
    let NERDTreeMinimalUI = 1
    let NERDTreeAutoDeleteBuffer = 1
    let NERDTreeDirArrows = 1
    let NERDTreeQuitOnOpen = 1
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

" Syntastic {
    nnoremap <leader>st :SyntasticToggleMode<CR>
    nnoremap <leader>sc :SyntasticCheck<CR>
    set statusline+=%#warningmsg#
    set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
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

" Taglist {
    let Tlist_Use_Right_Window=1
    let Tlist_Auto_Open=0
    let Tlist_Enable_Fold_Column=0
    let Tlist_Compact_Format=0
    let Tlist_WinWidth=28
    let Tlist_Exit_OnlyWindow=1
    let Tlist_File_Fold_Auto_Close = 1
    nnoremap <leader>tl :Tlist<cr>
" }

" UltiSnips {
    let g:UltiSnipsExpandTrigger="<c-a>"
    let g:UltiSnipsListSnippets="<c-s>"
    let g:UltiSnipsJumpForwardTrigger="<c-a>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsSnippetsDir = '~/.config/nvim/snippets'
    let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/snippets', '~/.config/nvim/bundle/vim-snippets/snippets', '~/.config/nvim/bundle/vim-snippets/UltiSnips']
" }

" Python Syntax {
    let python_highlight_all = 1
    let python_version_2 = 1
" }

" Deoplete {
    " let g:deoplete#enable_at_startup = 1
    " let g:deoplete#enable_refresh_always = 1
    " " let g:deoplete#sources = {}
    " " let g:deoplete#sources._ = ['buffer', 'tag']
    " let g:deoplete#sources#jedi#show_docstring = 1
    " nnoremap <expr><leader>td deoplete#toggle()
    "
    " inoremap <silent><expr> <TAB>
    "     \ pumvisible() ? "\<C-n>" :
    "     \ <SID>check_back_space() ? "\<TAB>" :
    "     \ deoplete#manual_complete()
    " function! s:check_back_space() abort "{{{
    " let col = col('.') - 1
    " return !col || getline('.')[col - 1]  =~ '\s'
    " endfunction"}}}
    "
    " " <S-TAB>: completion back.
    " inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
    "
    " " <C-h>, <BS>: close popup and delete backword char.
    " inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    " inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
    "
    " " inoremap <expr><C-g> deoplete#undo_completion()
    " " <C-l>: redraw candidates
    " inoremap <expr><C-g>       deoplete#refresh()
    " inoremap <silent><expr><C-l>       deoplete#complete_common_string()

" }

" Nerd Commenter {
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'

    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1

    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1
" }

" Buffergator {
    " nnoremap <leader>bb :BuffergatorToggle<CR>
    " nnoremap <leader>bt :BuffergatorTabsToggle<CR>
" }
