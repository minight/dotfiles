
" PLUGIN TIME

" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | nested source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')

    " Snippets
    " Plug 'SirVer/ultisnips', { 'on': [] }
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Syntax Checkers
    " Plug 'vim-syntastic/syntastic', { 'on': []}
    Plug 'vim-syntastic/syntastic'
    Plug 'vim-scripts/taglist.vim'

    " Fuzzy Finding
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'cbxsn/vim-gitmoji'

    " File Managers
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
    "Plug 'tpope/vim-vinegar'

    " Autocomplete Engines
    Plug 'davidhalter/jedi-vim', { 'on': [] }
    " Plug 'Valloric/YouCompleteMe', { 'dir': '~/.config/nvim/bundle/YouCompleteMe', 'do' : 'python3 install.py --clang-complete --tern-completer', 'on':[] }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
    Plug 'zchee/deoplete-jedi'
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'fszymanski/deoplete-emoji'

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/bundle/gocode/nvim/symlink.sh' }

    " New autocomplete engines
    " Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/echodoc.vim'
    " Plug 'roxma/nvim-completion-manager'
    " Plug 'dzhou121/gonvim-fuzzy'       " Vim plug
    " Plug 'equalsraf/neovim-gui-shim'       " Vim plug

    " Buffer Manager
    " Plug 'jeetsukumaran/vim-buffergator'

    " Utilities
    Plug 'craigemery/vim-autotag', { 'on': [] }
    Plug 'jiangmiao/auto-pairs'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'majutsushi/tagbar'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdcommenter'
    Plug 'rizzatti/dash.vim'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'mgedmin/coverage-highlight.vim'

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
    " Plug 'xuhdev/vim-latex-live-preview'
    " Plug 'vim-scripts/Latex-Text-Formatter'
    Plug 'vim-scripts/nginx.vim'
    " Magic Engines
    Plug 'jalvesaq/vimcmdline'

    " Autocomplete Engines
    Plug 'davidhalter/jedi-vim', { 'on': [] }
    " Plug 'Valloric/YouCompleteMe', { 'dir': '~/.config/nvim/bundle/YouCompleteMe', 'do' : 'python3 install.py --clang-complete --tern-completer', 'on':[] }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
    Plug 'zchee/deoplete-jedi'
    Plug 'zchee/deoplete-clang'
    Plug 'Shougo/neoinclude.vim'
    Plug 'neomake/neomake'

    " LSP
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'make release',
        \ }

    " Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() }}
    " Plug 'w0rp/ale'

    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    " Also add Glaive, which is used to configure codefmt's maktaba flags. See
    " " `:help :Glaive` for usage.
    Plug 'google/vim-glaive'



    Plug 'fatih/vim-go'
    " New autocomplete engines
    " Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/echodoc.vim'
    " Plug 'roxma/nvim-completion-manager'
    " Plug 'dzhou121/gonvim-fuzzy'       " Vim plug
    " Plug 'equalsraf/neovim-gui-shim'       " Vim plug

    " Make it pretty
    " Plug 'vim-airline/vim-airline', { 'on': [] }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes', { 'on': [] }
    " Plug 'bling/vim-bufferline'

    augroup load_insert
        autocmd!
        autocmd InsertEnter * call plug#load( 'ultisnips')
        " autocmd InsertEnter * call plug#load( 'YouCompleteMe')
        autocmd InsertEnter * call plug#load( 'jedi-vim')
        autocmd InsertEnter *.c call plug#load( 'vim-autotag')
        " autocmd InsertEnter * call plug#load( 'syntastic')
                             \| autocmd! load_insert
    augroup END
    augroup load_after_gui
        autocmd!
        autocmd Vimenter * call plug#load(  'vim-airline-themes')
                             \| autocmd! load_after_gui
    augroup END
call plug#end()
filetype plugin indent on

" vim-polyglot {
    let g:polyglot_disabled = ['go']
" Glaive {
    call glaive#Install()
    " Optional: Enable codefmt's default mappings on the <Leader>= prefix.
    Glaive codefmt plugin[mappings]
" }

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
    nnoremap <leader>pa :call jedi#goto_assignments()<CR>
    nnoremap <leader>pd :call jedi#goto_definitions()<CR>
    nnoremap <leader>pk :call jedi#documentation()<CR>
    nnoremap <leader>pu :call jedi#usages()<CR>
    nnoremap <leader>pr :call jedi#rename()<CR>

	nnoremap <leader>pytt :let g:jedi#force_py_version=3 <bar> :call jedi#reinit_python()<CR>
	nnoremap <leader>pytw :let g:jedi#force_py_version=2 <bar> :call jedi#reinit_python()<CR>

    "let g:jedi#goto_assignments_command = "<leader>pa"
    "let g:jedi#goto_definitions_command = "<leader>pd"
    "let g:jedi#documentation_command    = "<leader>pk"
    "let g:jedi#usages_command           = "<leader>pu"
    "let g:jedi#rename_command           = "<leader>pr"

    "let g:jedi#force_py_version(3)      = "<leader>pytt"
    "let g:jedi#force_py_version(2)      = "<leader>pytw"

    "let g:jedi#force_py_version = 3
    "if g:jedi#init_python()
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
    nnoremap <leader>fh :History<CR>
    nnoremap <leader>fs :Snippets<CR>
    nnoremap <c-s> :Snippets<CR>
    inoremap <expr> <c-s> :Snippets<CR>

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

    let $FZF_DEFAULT_COMMAND = 'ag -g ""'
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
"
" NERDTree-Git {
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "?",
    \ "Renamed"   : ">",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "x",
    \ "Dirty"     : "?",
    \ "Clean"     : "v",
    \ 'Ignored'   : '-',
    \ "Unknown"   : "?"
    \ }
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
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_loc_list_height = 5
    let g:syntastic_python_checkers = ['flake8']
    let g:syntastic_php_checkers = ['php']
    let g:syntastic_mode_map = { 'mode': 'passive',
                                \ 'active_filetypes': [],
                                \ 'passive_filetypes': ['html', 'javascript'] }
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
    let Tlist_Ctags_Cmd='/usr/local/bin/exctags'

    nnoremap <leader>tl :Tlist<cr>
" }

" UltiSnips {
    let g:UltiSnipsExpandTrigger="<c-a>"
    " let g:UltiSnipsListSnippets="<c-s>"
    let g:UltiSnipsJumpForwardTrigger="<c-a>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
    let g:UltiSnipsSnippetDirectories = ['UltiSnips', '~/.config/nvim/bundle/vim-snippets/snippets', '~/.config/nvim/bundle/vim-snippets/UltiSnips']
" }

" Python Syntax {
    let python_highlight_all = 1
    let python_version_2 = 1
" }

" Deoplete {
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_refresh_always = 1
    " let g:deoplete#sources = {}
    " call deoplete#custom#option('sources', {
    " \ '_': ['buffer', 'tag'],
    " \ 'cpp': ['buffer', 'tag'],
    "
    " \})
    call deoplete#custom#option('ultisnips',{'matchers': ['matcher_fuzzy']})

    let g:deoplete#sources#jedi#show_docstring = 1
    " nnoremap <expr><leader>td deoplete#toggle()
    "
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#manual_complete()
    function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
    endfunction"}}}
    "
    " " <S-TAB>: completion back.
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
    "
    " " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
    "
    inoremap <expr><C-g> deoplete#undo_completion()
    " " <C-l>: redraw candidates
    inoremap <expr><C-g>       deoplete#refresh()
    inoremap <silent><expr><C-l>       deoplete#complete_common_string()
    "
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

" Language Server {

    let g:LanguageClient_autoStart = 1
    "
    " let g:LanguageClient_serverCommands = {
    "     \ 'python': ['pyls'],
    "     \ }
    "
    let g:LanguageClient_serverCommands = {
    \ 'cpp': ['/usr/local/bin/cquery',
    \ '--log-file=/tmp/cq.log',
    \ '--init={"cacheDirectory":"/tmp/cquery/"}'],
    \ 'python': ['pyls'],
    \ 'javascript': ['tcp://127.0.0.1:2089'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ }
    " let g:LanguageClient_serverCommands = {
    "     \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
    "     \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
    "     \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
    "     \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
    "     \ }

    " set cacheDirectory to /var/cquery may cause permission problem on linux
    " set it to /tmp/cquery/ can fix it


    set hidden
    " nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    nnoremap <silent> gn :call LanguageClient_textDocument_rename()<CR>
    nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
    nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
    nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<CR>
    set formatexpr=LanguageClient_textDocument_rangeFormatting()
    "
" }
"
" " nvim completion manager {
"     inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"     inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"     inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"     let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
"     let $NVIM_NCM_LOG_LEVEL="DEBUG"
"     let $NVIM_NCM_MULTI_THREAD=0
" " }
"
" Vim Airline settings {
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''

" }

" echodoc settings {
    set cmdheight=1
    set noshowmode
    let g:echodoc#enable_at_startup = 1
    "
" }

" vimcmdline {

    " vimcmdline mappings
    let cmdline_map_start          = '<Leader>ml'
    let cmdline_map_send           = '<Leader>m'
    let cmdline_map_send_and_stay  = '<Leader>ms'
    let cmdline_map_source_fun     = '<Leader>mf'
    let cmdline_map_send_paragraph = '<Leader>mp'
    let cmdline_map_send_block     = '<Leader>mb'
    let cmdline_map_quit           = '<Leader>mq'

    " vimcmdline options
    let cmdline_vsplit      = 1      " Split the window vertically
    let cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
    let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
    let cmdline_term_height = 15     " Initial height of interpreter window or pane
    let cmdline_term_width  = 80     " Initial width of interpreter window or pane
    let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
    let cmdline_outhl       = 1      " Syntax highlight the output
" }
"
" vim-go {
    " run :GoBuild or :GoTestCompile based on the go file
    function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
    endfunction

    let g:go_highlight_build_constraints = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_types = 1
    let g:go_auto_sameids = 1
    let g:go_auto_type_info = 1

    autocmd FileType go nmap <leader>gb <Plug>(go-build)
    autocmd FileType go nmap <leader>gt <Plug>(go-test)
    autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
    autocmd FileType go nmap <leader>grr <Plug>(go-run)
    autocmd FileType go nmap <leader>grn <Plug>(go-rename)
    autocmd FileType go nmap <Leader>gi <Plug>(go-info)
    autocmd FileType go nmap <Leader>gd <Plug>(go-def)
    autocmd FileType go nmap <Leader>gh <Plug>(go-describe)
    autocmd FileType go nmap <Leader>gf <Plug>(go-freevars)
    autocmd Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
    autocmd Filetype go nmap <leader>gah <Plug>(go-alternate-split)
    autocmd Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)

    noremap <C-w> :cnext<CR>
    noremap <C-e> :cprevious<CR>
    nnoremap <leader>a :cclose<CR>

    "let g:go_auto_sameids = 1
    set updatetime=100
" }
"
" fugitive {
    nnoremap <leader>gp :Gpush<CR>
    nnoremap <leader>gs :Gstatus<CR>
"
" }
"
" deoplete-go {
    let g:deoplete#sources#go#pointer = 1
    let g:deoplete#sources#go#source_importer = 0
    let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
    let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" }
"
" cxzbnzb gitmoji  {
    inoremap <expr> <C-W><C-E> gitmoji#complete()
"
" Neomake {

    " When writing a buffer (no delay).
    call neomake#configure#automake('w')
    " When writing a buffer (no delay), and on normal mode changes (after 750ms).
    call neomake#configure#automake('nw', 750)
    " When reading a buffer (after 1s), and when writing (no delay).
    call neomake#configure#automake('rw', 1000)
    " Full config: when writing or reading a buffer, and on changes in insert and
    " normal mode (after 1s; no delay when writing).
    call neomake#configure#automake('nrwi', 500)
    let g:neomake_open_list = 2


" }
"
" coc {
"
    " Use <c-space> for trigger completion.
    " inoremap <silent><expr> <c-space> coc#refresh()
    "
    " " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
    " " Coc only does snippet and additional edit on confirm.
    " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    "
    " " Use `[c` and `]c` for navigate diagnostics
    " nmap <silent> [c <Plug>(coc-diagnostic-prev)
    " nmap <silent> ]c <Plug>(coc-diagnostic-next)
    "
    " " Remap keys for gotos
    " nmap <silent> gd <Plug>(coc-definition)
    " nmap <silent> gy <Plug>(coc-type-definition)
    " nmap <silent> gi <Plug>(coc-implementation)
    " nmap <silent> gr <Plug>(coc-references)
    "
    " " Use K for show documentation in preview window
    " nnoremap <silent> K :call <SID>show_documentation()<CR>
    "
    " function! s:show_documentation()
    " if &filetype == 'vim'
    "     execute 'h '.expand('<cword>')
    " else
    "     call CocAction('doHover')
    " endif
    " endfunction
    "
    " " Highlight symbol under cursor on CursorHold
    " autocmd CursorHold * silent call CocActionAsync('highlight')
    "
    " " Remap for rename current word
    " nmap <leader>rn <Plug>(coc-rename)
    "
    " " Remap for format selected region
    " vmap <leader>f  <Plug>(coc-format-selected)
    " nmap <leader>f  <Plug>(coc-format-selected)
    "
    " augroup mygroup
    " autocmd!
    " " Setup formatexpr specified filetype(s).
    " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " " Update signature help on jump placeholder
    " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " augroup end
    "
    " " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    " vmap <leader>a  <Plug>(coc-codeaction-selected)
    " nmap <leader>a  <Plug>(coc-codeaction-selected)
    "
    " " Remap for do codeAction of current line
    " nmap <leader>ac  <Plug>(coc-codeaction)
    " " Fix autofix problem of current line
    " nmap <leader>qf  <Plug>(coc-fix-current)
    "
    " " Use `:Format` for format current buffer
    " command! -nargs=0 Format :call CocAction('format')
    "
    " " Use `:Fold` for fold current buffer
    " command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    "
    " autocmd User CocQuickfixChange :call fzf_quickfix#run()
" }
"
" ALE {

" let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1

" }
