"{{{ -- Plugins
" Install vim plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !echo "No vim-plug detected, downloading..."
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Initialize vim plug
call plug#begin()
" Source vimrc to pick up added/removed plugins from configuration and install
" plugins
nnoremap <leader>pi :so $MYVIMRC<CR>:PlugInstall<CR>
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot', { 'do': './build' }

"{{{ -- emmet-vim
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
"}}}

"{{{ -- vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
"}}}

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"{{{ --fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :Ag<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fb :Windows<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>ft :Filetypes<CR>

"}}}

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

"{{{ -- vim-fugitive
Plug 'tpope/vim-fugitive'

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gm :Gmove<CR>
nnoremap <leader>gg :Ggrep<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdelete<CR>
"}}}

call plug#end()

"}}}

"{{{ -- GUI 
"  Disable beeping
set noeb vb t_vb=
autocmd GUIEnter * set vb t_vb= " The visual bell needs to be set after the gui has been initialized for gvim


" Adjust colors to dark theme
set background=dark
silent! colorscheme solarized

if has('gui_running')
	set guifont=Fira_Mono_for_Powerline:h12

	set go+=c " Use console dialogs instead of GUI
	set go-=m " Remove menu bar
	set go-=T " Remove toolbar
	set go-=R " Remove right vertical toolbar
	set go-=L " Remove left vertical toolbar
endif

set rnu nu " Enable relative numbers with current line showing absolute line number

set laststatus=2 " Use a status bar even if only one window is opened

set wildmenu

set ttimeout
set ttimeoutlen=100

set showcmd " Show partial command in last line of the screen

"}}}

"{{{ -- Mappings
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
"}}}

if has('autocmd')
	" Enable file type detection, load filetype plugins and indent files
	filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
	" Enable syntax highlighting
	syntax enable
endif

" Set encoding to utf-8 if possible
if &encoding ==# 'latin1' && has('gui_running')
	set encoding=utf-8
endif

if &listchars ==# 'eol:$'
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
	set formatoptions+=j "Delete comment character when joining commented lines
endif

set modeline " Enable modelines (e.g. at the end of this file :))
set autoindent " Use indentation from previous line
set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert

set complete-=i " Don't use loaded files content for completion

set incsearch " Search for the pattern while typing
set ignorecase " Ignore case when searching for the pattern
set smartcase " Ignore case when searching for the pattern if the pattern doesn't contain uppercase characters
set autoread " Automatically read file when changed outside of editor

set nobackup " Don't create backup files
set noswapfile " Don't create swap files for opened buffers
" vim: sw=2 ts=2 foldmethod=marker
