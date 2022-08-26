set nocompatible              " be iMproved, required

call plug#begin('~/vim/bundle')

Plug 'tpope/vim-fugitive'
Plug 'klen/python-mode'
"Plug 'nvie/vim-flake8'
Plug 'dense-analysis/ale'
"Plug 'tell-k/vim-autopep8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'rking/ag.vim'
Plug 'pangloss/vim-javascript'
Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/django.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'lifepillar/pgsql.vim'

"Plug 'gavocanov/vim-js-indent'
"Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'othree/yajs.vim'
Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/goyo.vim'

Plug 'tomasr/molokai'
Plug 'ratazzi/blackboard.vim'
Plug 'jthiard/vim-playskool'
"Plug 'Valloric/YouCompleteMe'
"Plug 'vim-scripts/Align'
"Plug 'vim-scripts/SQLUtilities'
Plug 'mitsuhiko/vim-jinja'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'

Plug 'szymonmaszke/vimpyter'

Plug 'lervag/vimtex'
Plug 'cespare/vim-toml'

Plug 'chr4/nginx.vim'
Plug 'alvan/vim-closetag'
Plug 'walkermatt/vim-mapfile'

"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

"Plug 'vim-syntastic/syntastic'

call plug#end()

set autoindent
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" https://github.com/vim/vim/issues/1671#issuecomment-299258728
" xfce terminal doesn't seem to support bracketed paste.
set t_BE=
"
" backup files
set directory=~/.backup
set backupdir=~/.backup

syntax on

set guicursor+=v:blinkon0

" add some file extensions to filetypes
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.html set filetype=htmldjango
au BufNewFile,BufRead *.twig set filetype=htmldjango

set number
set hlsearch
set mouse=a "Activate mouse on console mode
set nowrap
set colorcolumn=100
set backspace=indent,eol,start

set wildmenu
set wildmode=list:longest,full

set t_Co=256

set background=dark
colorscheme playskool

"No toolbar
set guioptions-=T
"No menu bar
set guioptions-=m
" GUI font
set guifont=Liberation\ Mono\ 10
 

set expandtab       " Use spaces instead of tabs
set tabstop=4       " Display \t as 4 spaces
set shiftwidth=4    " Number of spaces to use for each indent
set softtabstop=4   " Treat 4 spaces as a tab for editing purposes
set smarttab        " Insert blank space at beginning of line with tab

let mapleader = "," " Redéfinit la touche <Leader> à ',' au lieu de '\'
let maplocalleader = "_" " Redéfinit la touche <LocalLeader> à '_'

" always show statusline
set laststatus=2
:let g:airline_theme = 'luna'
:let g:airline#extensions#eclim#enabled = 1

" do not show default vim mode message
" (redondant with airline)
set noshowmode

" display cmd while typing
set showcmd

set nofoldenable

" virtualenv
"let g:virtualenv_directory="~/envs"

"Easy .vimrc editing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"spell lang
nnoremap <leader>fr :setlocal spell spelllang=fr<cr>
nnoremap <leader>en :setlocal spell spelllang=en<cr>



" Indentation guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
map <F4> :IndentGuidesToggle<CR>

map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$','__pycache__$']
let NERDTreeMinimalUI = 1
let NERDTreeShowBookmarks = 1
"let NERDTreeShowHidden = 1

map <F3> :TagbarToggle<CR>

map <F11> :Goyo<CR>

" js
let g:javascript_enable_domhtmlcss = 1
let g:javascript_fold = 0

"" python-mode
let g:pymode_folding = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_options_max_line_length=100

" pylint
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0

let g:pymode_rope = 0

" pandoc
let g:pandoc#biblio#sources = 'bg'
let g:pandoc#formatting#mode = 'ha'
let g:pandoc#syntax#conceal#use = 0

" pandoc:
" <localleader>t to open TOC in vertical split
autocmd Filetype pandoc nnoremap <buffer> <localleader>t :TOC<cr>
" <localleader>c compile to html 
autocmd Filetype pandoc nnoremap <buffer> <localleader>c :Pandoc html --katex -s --toc -H ~/.pandoc/css/github-pandoc.css.html --template=custom<cr>
" <localleader>c! to compile and open in browser
autocmd Filetype pandoc nnoremap <buffer> <localleader>c! :Pandoc! html --katex -s --toc -H ~/.pandoc/css/github-pandoc.css.html --template=custom<cr>

" navigation in wrapped lines
:map <up> gk
:map <down> gj

"visual blocks
set virtualedit=block

set listchars+=trail:·,nbsp:_

autocmd Filetype html setlocal sw=2
autocmd Filetype scss setlocal sw=2
autocmd Filetype css setlocal sw=2
autocmd Filetype htmldjango setlocal sw=2
autocmd Filetype javascript setlocal sw=2
autocmd Filetype json setlocal sw=2
autocmd Filetype vue setlocal sw=2
autocmd Filetype yaml setlocal sw=2

let g:closetag_filetypes = 'html,xhtml,phtml,vue'

runtime! macros/matchit.vim " Load matchit (% to bounce from do to end, etc.)

" json formatter
" :Formatjson
com! FormatJSON :execute '%!python3.9 -m json.tool --indent=2'

" xml formatter
" :FormatXML
com! FormatXML :execute '%!xmllint --format --recover -'


"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'


" abbreviations
ab logimport import logging; logger = logging.getLogger(__name__)
ab utf8coding # -*- coding: utf-8 -*-
ab lazygettext from django.utils.translation import ugettext_lazy as _
ab pdbtrace import pdb; pdb.set_trace()
ab ipdbtrace import ipdb; ipdb.set_trace()
ab qgistrace import pdb; from qgis.PyQt.QtCore import pyqtRemoveInputHook; pyqtRemoveInputHook(); pdb.set_trace()
ab cline # ------------------------------------------------------------------------------
ab jsdebugger debugger; // eslint-disable-line

let g:ale_linters_explicit = 1
let g:ale_linters = {'python': ['pycodestyle']}
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_filetype_changed = 0

" Write a file as root if forgotten to open it with
" the good rights
" :Sudow
command Sudow :execute ':silent w !sudo tee % > /dev/null' | :edit!

