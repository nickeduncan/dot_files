syntax on
set autoindent
set number
set showmode
set encoding=utf-8
set colorcolumn=100

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
Plug 'dkprice/vim-easygrep'

"html
Plug 'jtratner/vim-flavored-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'nelstrom/vim-markdown-preview'

"python syntax checker
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/Pydiction'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'

"general syntax checker
Plug 'skywind3000/asyncrun.vim'

" colors
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'

" ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

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

"html suff"
:filetype indent on
:set filetype=html
autocmd FileType html set shiftwidth=2
autocmd FileType html set softtabstop=2
autocmd FileType html set autoindent
set et ""
set sts=2
set sw=2

"css stuff"
autocmd FileType scss set shiftwidth=2
autocmd FileType scss set softtabstop=2
autocmd FileType scss set autoindent

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"Ruby stuff"
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set softtabstop=2
autocmd FileType ruby set expandtab
autocmd FileType ruby set autoindent

" auto open NERDTree
autocmd vimenter * NERDTree

" use Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" don't open first result in Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" CTRL-P config
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Ale config
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" Remove trailing whitespace
autocmd FileType c,cpp,java,php,ruby,html,scss,javascript autocmd BufWritePre <buffer> %s/\s\+$//e

colors zenburn

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
