" General Vim Settings

" Best remap i've ever done
nnoremap ; :
nnoremap : ;

" Gotta take this from Spacemacs - so good
let mapleader = "\<Space>"

" Enable folding with the spacebar
nnoremap <leader>fm :set foldmethod=manual<CR>
nnoremap <leader>fi :set foldmethod=indent<CR>
nnoremap <space><space> za

" Splits
nnoremap <leader>- :split<CR>
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>c :close<CR>
nnoremap <leader>_ <C-W>_
nnoremap <leader>= <C-W>=
nnoremap <C-J> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <bs> <C-W><C-H>
nnoremap <leader>1 <C-6>

" Tab Movement
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tx :tabclose<CR>
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
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

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
tnoremap <leader>jk <C-\><C-n>

" Indentation
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" Tools
nnoremap <leader>sp
      \ :<C-u>call vimrc#toggle_option('spell')<CR>
      \: set spelllang=en_us<CR>
      \: set spelllang+=cjk<CR>
nnoremap <leader>w
      \ :<C-u>call vimrc#toggle_option('wrap')<CR>

nnoremap <leader>ev :NERDTree ~/.config/nvim/<CR>

" This rewires n and N to do the highlighing...
nnoremap <silent> n nzz:call HLNext(0.2)<cr>
nnoremap <silent> N Nzz:call HLNext(0.2)<cr>

autocmd FileType python nnoremap <leader>py :0,$!yapf<Cr><C-o>
autocmd FileType python nnoremap <leader>pi :!isort %<CR><CR>
