execute pathogen#infect()

set hidden
set display=lastline " Display as much of wrapped lines as possible.
set clipboard=unnamedplus
set history=1000
set scrolloff=3
set nobackup
set nowritebackup
set noswapfile
set showcmd
set wildmode=list:longest
set showmatch
set linebreak
set autochdir
set nofoldenable " Disable folding.
let g:Tex_DefaultTargetFormat = 'pdf'
set completeopt=longest
set whichwrap=b,s,<,>,[,]
set nowrap

set ffs=unix,dos,mac

au BufRead,BufNewFile *.jsm set filetype=javascript

set linebreak
set nolist " Wrap on word boundary.

if has('gui_running')
"	set lines=48
end

set go-=T "Disable toolbar.
set number

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

set spell spelllang=en_us

set guifont=Deja\ Vu\ Sans\ Mono\ 11

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
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

set hlsearch  " Highlight search terms...
set incsearch " ...dynamically as they are typed.
set ignorecase
set smartcase
set infercase

"set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=0

set nolisp

autocmd BufRead *.md setlocal filetype=markdown

autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype lisp setlocal nolisp
autocmd Filetype python setlocal noexpandtab tabstop=4

" Delete fugitive special buffers rather than closing.
autocmd BufReadPost fugitive://* set bufhidden=delete

set cpoptions+=I
inoremap <CR> <CR>d<BS>
nnoremap o od<BS>
nnoremap O Od<BS>

set autoindent
set copyindent
set preserveindent

set encoding=utf-8
set list listchars=tab:→\ ,trail:·
