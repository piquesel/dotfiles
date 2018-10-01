set nocompatible	" required
filetype off		" required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Use SimplyFold
Plugin 'tmhedberg/SimpylFold'

" indentpython helps to fix issues conforming to PEP8
" standards in some cases
Plugin 'vim-scripts/indentpython.vim'

" Best plugin for Auto-complete
Bundle 'Valloric/YouCompleteMe'

" Syntax checking/highlighting
Plugin 'vim-syntastic/syntastic'

" PEP8 checking
Plugin 'nvie/vim-flake8'

" Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" File browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Ignore .pyc in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Super searching: Ctrl-P will allow to search for a file
Plugin 'kien/ctrlp.vim'

" Git integration
Plugin 'tpope/vim-fugitive'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" add all your plugins here (note older versions of Vundle
"
" used Bundle instead of Plugin)

"...

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required

" Define mapleader
:let mapleader = ","

" Configure how to split
set splitbelow
set splitright

" Enable folding with the spacebar
" nnoremap <space> za
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Want to see docstrings for folded code?
let g:SimpylFold_docstring_preview=1

" Add proper PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 | 
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" For full stack development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Flagging unnecessary whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UTF-8
set encoding=utf-8

" Auto-complete configuration
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Make your python code look pretty
let python_highlight_all=1
syntax on

" Color schemes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")

" Line numbering
set nu

" Allow to access system clipboard
set clipboard=unnamed

