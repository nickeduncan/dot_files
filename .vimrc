syntax on
set autoindent
set number
set showmode
set encoding=utf-8

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
" git interface
Plug 'tpope/vim-fugitive'
" filesystem
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'

"html
Plug 'jtratner/vim-flavored-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'nelstrom/vim-markdown-preview'
"python syntax checker
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/Pydiction'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'

"auto-completion stuff
Plug 'Valloric/YouCompleteMe'
Plug 'klen/rope-vim'
Plug 'ervandew/supertab'
" code folding
Plug 'tmhedberg/SimpylFold'

" colors
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'

" ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'

call plug#end()

filetype plugin indent on " enables filetype detection
let g:SimplyFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

call togglebg#map("<F5>")
"colorsheme zenburn
"set guifont=Monaco:h14

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeShowHidden=1 "show dot files
map <C-n> :NERDTreeToggle<CR> 

"I don't like swap files
set noswapfile

" python with virtualenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" it would b enice to set tag files by the active virtualenv here
" :set tags=~/mytags "for ctags and tagslist
" omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------

" pydiction setup
filetype plugin on
let g:pydiction_location = '~/.vim/plugged/Pydiction/complete-dict'
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"Ruby stuff"
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set softtabstop=2
autocmd FileType ruby set expandtab
autocmd FileType ruby set autoindent

" auto open NERDTree
autocmd vimenter * NERDTree

colors zenburn
