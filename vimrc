execute pathogen#infect()
let mapleader = ","

set hidden
set number
set display=lastline " Display as much of wrapped lines as possible.
set clipboard=unnamedplus " Use system clipboard.
set history=1000
set scrolloff=2

" No swap files.
set nobackup
set nowritebackup
set noswapfile

set showcmd
set wildmode=list:longest
set showmatch
set autoread
set linebreak
set autochdir
set nofoldenable " Disable folding.
let g:Tex_DefaultTargetFormat = 'pdf'
set completeopt=longest
set whichwrap=b,s,<,>,[,]
set nowrap
set ffs=unix,dos,mac
set encoding=utf-8
set list listchars=tab:→\ ,trail:·
set linebreak
set spell spelllang=en_us
set guifont=Deja\ Vu\ Sans\ Mono\ 11
"set hlsearch  " Highlight search terms...
set incsearch " ...dynamically as they are typed.
set ignorecase
set smartcase
set infercase

set go-=T "Disable toolbar.

syntax on
if has('gui_running')
	colorscheme Mustang
else
	colorscheme relaxedgreen
end

set t_Co=256

let &colorcolumn=join(range(81,999),",")
highlight ColorColumn guibg=#2d2d2d ctermbg=235

filetype on
filetype plugin on
"filetype indent on
set autoindent
set copyindent
set preserveindent

"set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=0

set omnifunc=syntaxcomplete#Complete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:neocomplete#sources#syntax#min_keyword_length = 2

inoremap <expr><C-Space> neocomplete#start_manual_complete()
inoremap <expr><Nul>     neocomplete#start_manual_complete()
inoremap <expr><Left>    neocomplete#close_popup() . "\<Left>"
inoremap <expr><Right>   neocomplete#close_popup() . "\<Right>"
inoremap <expr><Up>      neocomplete#close_popup() . "\<Up>"
inoremap <expr><Down>    neocomplete#close_popup() . "\<Down>"

map  <F1> :NERDTreeToggle<CR>
map! <F1> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = [
\	'\.aux',
\	'\.class',
\	'\.git',
\	'\.log',
\	'\.o',
\	'\.out',
\	'\.pyc',
\	'__pycache__',
\]

set cpoptions+=I
inoremap <CR> <CR>d<BS>
nnoremap o od<BS>
nnoremap O Od<BS>

autocmd BufRead,BufNewFile *.jsm set filetype=javascript
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown

autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype lisp setlocal nolisp
autocmd Filetype python setlocal noexpandtab tabstop=4
autocmd FileType c setlocal commentstring=//%s

nnoremap ; :
nnoremap <Leader>w :w<CR>

let g:loaded_commentary = 1
call tcomment#DefineType("c", "//%s\n//")
