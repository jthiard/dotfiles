set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'klen/python-mode.git'
Plugin 'vim-flake8'
Plugin 'vim-airline/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree.git'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
Plugin 'rking/ag.vim'
"Plugin 'pangloss/vim-javascript'
Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/django.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

Plugin 'gavocanov/vim-js-indent'
Plugin 'mxw/vim-jsx'
Plugin 'othree/yajs.vim'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'junegunn/goyo.vim'

Plugin 'tomasr/molokai.git'
Plugin 'ratazzi/blackboard.vim'
Plugin 'jthiard/vim-playskool'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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

" backup files
set directory=~/.backup
set backupdir=~/.backup

syntax on

" add some file extensions to filetypes
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.html set filetype=htmldjango
au BufNewFile,BufRead *.twig set filetype=htmldjango


set number
set hlsearch
set mouse=a "Activate mouse on console mode
set nowrap
set colorcolumn=100


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
set tabstop=4       " Display \t as 2 spaces
set shiftwidth=4    " Number of spaces to use for each indent
set softtabstop=4   " Treat 2 spaces as a tab for editing purposes
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
:let g:virtualenv_directory="~/envs"

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

let g:pymode_syntax_space_errors = 0
let g:pymode_options_max_line_length=100

" pylint
let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0

let g:pymode_rope = 0

" pandoc
let g:pandoc#formatting#mode = 'ha'
let g:pandoc#syntax#conceal#use = 0

" pandoc:
" <localleader>t to open TOC in vertical split
autocmd Filetype pandoc nnoremap <buffer> <localleader>t :TOC<cr>
" <localleader>c compile to html 
autocmd Filetype pandoc nnoremap <buffer> <localleader>c :Pandoc -s -S --toc -H ~/.pandoc/css/github-pandoc.css.html --template=autoreload html<cr>
" <localleader>c! to compile and open in browser
autocmd Filetype pandoc nnoremap <buffer> <localleader>c! :Pandoc! -s -S --toc -H ~/.pandoc/css/github-pandoc.css.html --template=autoreload html<cr>

" navigation in wrapped lines
:map <up> gk
:map <down> gj

"visual blocks
set virtualedit=block

set listchars+=trail:·,nbsp:_

autocmd Filetype html setlocal sw=2
autocmd Filetype scss setlocal sw=2
autocmd Filetype htmldjango setlocal sw=2
autocmd Filetype javascript setlocal sw=2

runtime! macros/matchit.vim " Load matchit (% to bounce from do to end, etc.)


" abbreviations
ab logimport import logging; logger = logging.getLogger(__name__)
ab utf8coding # -*- coding: utf-8 -*-
ab lazygettext from django.utils.translation import ugettext_lazy as _
ab pdbtrace import pdb; pdb.set_trace()
ab ipdbtrace import ipdb; ipdb.set_trace()
ab cline # ------------------------------------------------------------------------------

