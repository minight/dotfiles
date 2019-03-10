" PLUGIN TIME

" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | nested source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')
    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " "
    " " " Syntax Checkers
    Plug 'vim-syntastic/syntastic'
    " Plug 'vim-scripts/taglist.vim'
    " "
    " " " Fuzzy Finding
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'cbxsn/vim-gitmoji'
    " "
    " " " File Managers
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
    " "Plug 'tpope/vim-vinegar'
    "
    " Autocomplete Engines
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
    Plug 'Shougo/echodoc.vim'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    "
    " " Language Engines
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Plug 'davidhalter/jedi-vim', { 'on': [] }
    "
    Plug 'Shougo/neoinclude.vim'
    Plug 'neomake/neomake'
    " " Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/bundle/gocode/nvim/symlink.sh' }
    "
    " "
    " Plug 'zchee/deoplete-jedi'
    " Plug 'zchee/deoplete-clang'
    Plug 'fszymanski/deoplete-emoji'
    " " Plug 'Valloric/YouCompleteMe', { 'dir': '~/.config/nvim/bundle/YouCompleteMe', 'do' : 'python3 install.py --clang-complete --tern-completer', 'on':[] }
    " " Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() }}
    " " Plug 'w0rp/ale'
    "
    " " Code Formatter
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    " Also add Glaive, which is used to configure codefmt's maktaba flags. See
    " " `:help :Glaive` for usage.
    Plug 'google/vim-glaive'
    " "
    " " " Buffer Manager
    " Plug 'jeetsukumaran/vim-buffergator'
    " "
    " " " Utilities
    Plug 'craigemery/vim-autotag', { 'on': [] }
    Plug 'jiangmiao/auto-pairs'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'majutsushi/tagbar'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdcommenter'
    " " " Plug 'rizzatti/dash.vim'
    " " " Plug 'AndrewRadev/splitjoin.vim'
    " Plug 'mgedmin/coverage-highlight.vim'
    " "
    " " " Syntax & Highlighters
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'ap/vim-css-color'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'godlygeek/tabular'
    Plug 'junegunn/vim-emoji'
    Plug 'plasticboy/vim-markdown'
    Plug 'sheerun/vim-polyglot'
    Plug 'tmhedberg/SimpylFold'
    Plug 'hdima/python-syntax'
    Plug 'lervag/vimtex'
    Plug 'vim-scripts/nginx.vim'
    " Plug 'vim-scripts/promela.vim'
    " Plug 'xuhdev/vim-latex-live-preview'
    " Plug 'vim-scripts/Latex-Text-Formatter'
    "
    " " Magic Engines
    Plug 'jalvesaq/vimcmdline'
    "
    " " Make it pretty
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes', { 'on': [] }

    augroup load_insert
        autocmd!
        autocmd InsertEnter * call plug#load( 'ultisnips')
        " autocmd InsertEnter * call plug#load( 'jedi-vim')
        autocmd InsertEnter *.c call plug#load( 'vim-autotag')
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
" }

" Glaive {
    call glaive#Install()
    " Optional: Enable codefmt's default mappings on the <Leader>= prefix.
    Glaive codefmt plugin[mappings]
" }

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
    "
    nnoremap <leader>pytt :let g:jedi#force_py_version=3 <bar> :call jedi#reinit_python()<CR>
    nnoremap <leader>pytw :let g:jedi#force_py_version=2 <bar> :call jedi#reinit_python()<CR>
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
    let g:UltiSnipsListSnippets="<c-s>"
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

" Nerd Commenter {
    let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
    let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
    let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
" }

" Buffergator {
    nnoremap <leader>bb :BuffergatorToggle<CR>
    nnoremap <leader>bt :BuffergatorTabsToggle<CR>
" }

" Language Server {
    let g:LanguageClient_autoStart = 1
    " set completefunc=LanguageClient#complete

    let g:LanguageClient_serverCommands = {
    \ 'cpp': ['/usr/local/bin/cquery',
    \ '--log-file=/tmp/cq.log',
    \ '--init={"cacheDirectory":"/tmp/cquery/"}'],
    \ 'python': ['pyls'],
    \ 'javascript': ['tcp://127.0.0.1:2089'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'go': ['bingo'],
    \ }
    " let g:LanguageClient_rootMarkers = {
    "     \ 'go': ['.git', 'go.mod'],
    "     \ }

    set hidden
    " nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
    nnoremap <F5> :call LanguageClient_contextMenu()<CR>

    nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    nnoremap <silent> gn :call LanguageClient_textDocument_rename()<CR>
    nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
    nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
    nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<CR>
    set formatexpr=LanguageClient_textDocument_rangeFormatting()
" }
"
" Vim Airline settings {
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
" }

" echodoc settings {
    set cmdheight=1
    set noshowmode
    let g:echodoc#enable_at_startup = 1
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
    run :GoBuild or :GoTestCompile based on the go file
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
" }
"
" deoplete-go {
    " let g:deoplete#sources#go#pointer = 1
    " let g:deoplete#sources#go#source_importer = 0
    " let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
    " let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" }
"
" cxzbnzb gitmoji  {
    inoremap <expr> <C-W><C-E> gitmoji#complete()
"
" Neomake {
    " call neomake#configure#automake('w') " When writing a buffer (no delay).
    " call neomake#configure#automake('nw', 750) " When writing a buffer (no delay), and on normal mode changes (after 750ms).
    " call neomake#configure#automake('rw', 1000) " When reading a buffer (after 1s), and when writing (no delay).
    " call neomake#configure#automake('nrwi', 500) " Full config: when writing or reading a buffer, and on changes in insert and normal mode (after 1s; no delay when writing).
    let g:neomake_open_list = 2
" }

" Neo Snippet {
    " Plugin key-mappings.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <expr><TAB>
    \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For conceal markers.
    if has('conceal')
    set conceallevel=2 concealcursor=niv
    endif
" }

" Deoplete {
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#sources = {}
    " call deoplete#custom#option('sources', {
    " \ '_': ['buffer', 'tag'],
    " \ 'cpp': ['buffer', 'tag'],
    " \})
    call deoplete#custom#option('ultisnips',{'matchers': ['matcher_fuzzy']})
    call deoplete#custom#source('LanguageClient','mark', 'ℰ')
    call deoplete#custom#source('omni',          'mark', '⌾')
    call deoplete#custom#source('flow',          'mark', '⌁')
    call deoplete#custom#source('ternjs',        'mark', '⌁')
    call deoplete#custom#source('go',            'mark', '⌁')
    call deoplete#custom#source('jedi',          'mark', '⌁')
    call deoplete#custom#source('vim',           'mark', '⌁')
    call deoplete#custom#source('ultisnips',     'mark', '⌘')
    call deoplete#custom#source('around',        'mark', '↻')
    call deoplete#custom#source('buffer',        'mark', 'ℬ')
    call deoplete#custom#source('tmux-complete', 'mark', '⊶')
    call deoplete#custom#source('syntax',        'mark', '♯')
    call deoplete#custom#source('member',        'mark', '.')


    " let g:deoplete#sources#jedi#show_docstring = 1
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
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function() abort
      return deoplete#close_popup() . "\<CR>"
    endfunction

    " <S-TAB>: completion back.
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
    "
    " " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

    inoremap <expr><C-g> deoplete#undo_completion()
    " " <C-l>: redraw candidates
    inoremap <expr><C-g>       deoplete#refresh()
    inoremap <silent><expr><C-l>       deoplete#complete_common_string()
" }

