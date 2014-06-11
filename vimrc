""""" VUNDLE
set nocompatible " be iMproved, required
filetype off     " required
set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/vundle_bundles/')

Plugin 'gmarik/Vundle.vim', {'name': '../bundle/Vundle.vim'}

Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete'
Plugin 'sjl/gundo.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

call vundle#end()

" execute pathogen#infect()
let mapleader = ";"

set hidden
set number
set display=lastline " Display as much of wrapped lines as possible.
set clipboard=unnamedplus " Use system clipboard.
set history=1000
set scrolloff=2
set updatetime=120000

" No swap files.
set nobackup nowritebackup noswapfile

set showcmd
set wildmode=list:longest
set showmatch
set autoread
set autochdir
set nofoldenable " Disable folding.
set completeopt=longest
set whichwrap=b,s,<,>,[,]
set ffs=unix,dos,mac
set encoding=utf-8
set list listchars=tab:→\ ,trail:·
set linebreak
set spell spelllang=en_us

set hlsearch incsearch
set ignorecase smartcase infercase
function! SearchHlClear()
	let @/ = ''
endfunction
augroup searchhighlight
	autocmd!
	autocmd CursorHold,CursorHoldI * call SearchHlClear()
augroup END

set go-=T "Disable toolbar.

set guifont=Deja\ Vu\ Sans\ Mono\ 11
set t_Co=256
syntax on
if has('gui_running')
	colorscheme Mustang
else
	colorscheme Mustang
end
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn guibg=#2d2d2d ctermbg=235

filetype on
filetype plugin on
"filetype indent on
set autoindent copyindent preserveindent

"set smarttab
set tabstop=4 shiftwidth=4 softtabstop=0

set omnifunc=syntaxcomplete#Complete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:neocomplete#sources#syntax#min_keyword_length = 2

inoremap <expr> <C-Space> neocomplete#start_manual_complete()
inoremap <expr> <Nul>     neocomplete#start_manual_complete()
inoremap <expr> <Left>    neocomplete#close_popup() . "\<Left>"
inoremap <expr> <Right>   neocomplete#close_popup() . "\<Right>"
inoremap <expr> <Up>      neocomplete#close_popup() . "\<Up>"
inoremap <expr> <Down>    neocomplete#close_popup() . "\<Down>"

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=999

map  <F1> :NERDTreeToggle<CR>
map! <F1> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = [
\	'\.aux$',
\	'\.class$',
\	'^\.git$',
\	'\.log$',
\	'\.o$',
\	'\.out$',
\	'\.pyc$',
\	'^__pycache__$',
\]

vmap <Leader>a         <Plug>(EasyAlign)
vmap <Leader><Leader>a <Plug>(LiveEasyAlign)
nmap <Leader>a         <Plug>(EasyAlign)
nmap <Leader><Leader>a <Plug>(LiveEasyAlign)

let g:easy_align_delimiters = {
\	'n': {'pattern': '\<\d\+\>',
\		'delimeter_align': 'r',
\	},
\	'd': {'pattern': '\<\d\>'},
\	'\': {'pattern': '\\'},
\	
\	'/': {'pattern': '//\+\|/\*\|\*/',
\		'ignore_groups': ['String'],
\	},
\	'#': {'pattern': '#\+',
\		'delimiter_align': 'l',
\		'ignore_groups': ['String'],
\	},
\	'}': {'pattern': '}',
\		'left_margin':  0,
\		'right_margin': 0,
\	},
\}

set cpoptions+=I
inoremap <CR> <CR>d<BS>
nnoremap o od<BS>
nnoremap O Od<BS>

" Add closing brace.
inoremap {<Cr> {<Cr>}<Esc>O

function! SetTabs(w)
	let &l:tabstop     = a:w
	let &l:shiftwidth  = a:w
	let &l:softtabstop = a:w
endfunction

augroup filetype
	autocmd!
	autocmd BufRead,BufNewFile *.jsm setlocal filetype=javascript
	autocmd BufRead,BufNewFile *.md  setlocal filetype=markdown
	
	autocmd FileType c          setlocal commentstring=//%s
	autocmd FileType haml       call SetTabs(2)
	autocmd FileType java       setlocal omnifunc=javacomplete#Complete
	autocmd FileType lisp       setlocal nolisp
	autocmd FileType markdown   setlocal tw=80
	autocmd FileType python,rst call SetTabs(4)
	autocmd FileType python,rst setlocal noexpandtab
	autocmd FileType yaml       call SetTabs(2)
	autocmd FileType yaml       setlocal noexpandtab
	autocmd FileType xml        call SetTabs(2)
augroup END

noremap H ^
noremap H ^
noremap L $
noremap L $

noremap , @q

nnoremap <Leader>w  :w<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>ev :edit   $MYVIMRC<Cr>
nnoremap <Leader>rv :source $MYVIMRC<Cr>
nnoremap <Leader>s  :%s/\V\<<C-r><C-w>\>/<C-r><C-w>
nnoremap <Leader>y  :let @+ = expand("%:p")<Cr>
nnoremap <Leader>t  :s/\v\s+$//<Cr>
nnoremap <Leader>c  :%s/\v\S\zs\s+$//

let g:Tex_DefaultTargetFormat = 'pdf'

call tcomment#DefineType("c", "//%s\n//")
