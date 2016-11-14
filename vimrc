" Use Pathogen as package manager
" call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

" Automatically reload the .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
let mapleader=","

" Quick save command whatever mode vim is in
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" Easier moving between tabs
map <Leader>b <esc>:tabprevious<CR>
map <Leader>n <esc>:tabnext<CR>

" Bind Ctrl+<movement> keys to move around the windows
" instead of using c-w
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Easier moving of code blocks
" Just use greater than or less than to indent code
vnoremap < <gv " Better indentation
vnoremap > >gv

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

" Encoding set to utf-8
set encoding=utf-8

" Color scheme
set rtp+=C:\Users\Bruno\dotvim\vim\bundle\wombat256.vim
set rtp+=C:\Users\Bruno\dotvim\vim\bundle\badwolf
set background=dark
set t_Co=256
"color wombat256mod
"color badwolf


" Better with syntax highlight
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number " Show line numbers
set tw=79  " Width of document (used by gd)
set nowrap " Don't automatically wrap on load
set fo-=t  " Don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Easier formatting of paragraphs
" DOESN'T SEEM TO WORK ON WINDOWS!
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Configure the status line
" It will tell you the filename, type of file, encoding, position in file
" If file type has been guessed wrongly, use :set ft=python to correct
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
  \ [%l/%L\ (%p%%)
filetype plugin indent on
" Turn on nice indentation with au commands
" They are automatically run for a give file type
" Autoindent will indent the next line when you start a new line
au FileType py set autoindent
" Smartindent also indents after things like a colon
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

" Syntax for multiple tag files are
" set tags=/my/dir1/tags, /my/dir2/tags
set tags=tags;$HOME/.vim/tags/

" TagList Plugin Configuration
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
map <F7> :TlistToggle<CR>

" Viewport Controls
" ie moving between split panes
map <silent>,h <C-w>h
map <silent>,j <C-w>j
map <silent>,k <C-w>k
map <silent>,l <C-w>l


"====[ Ideal configuration for Python ]====
set tabstop=4    " A tab equals 4 spaces
set softtabstop=4
set shiftwidth=4 " Controls the depth of autoindentation
set shiftround
set expandtab    " Converts all tabs into spaces

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" We can disable backup and swap files
" They trigger too many events
set nobackup
set nowritebackup
set noswapfile

" Setting for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.get
set rtp+=$HOME/dotvim/vim/bundle/vim-powerline
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts=1
let g:pymode_rope_goto_def_newwin="vnew"
let g:pymode_rope_extended_complete=1
let g:pymode_breakpoint=0
let g:pymode_syntax=1
let g:pymode_syntax_builtin_objs=0
let g:pymode_syntax_builtin_funcs=0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim
" https://github.com/vim-scripts/Efficient-python-folding/blob/master/ftplugin/python_editing.vim
" set nofoldenable

set foldmethod=indent
set foldlevel=99

nnoremap <space> za
