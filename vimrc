""""" VUNDLE
set nocompatible " be iMproved, required
filetype off     " required
" set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugin 'davidhalter/jedi-vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'Raimondi/delimitMate'
Plugin 'Rip-Rip/clang_complete'
" Plugin 'git@github.com:kevincox/clang_complete.git'
Plugin 'kien/ctrlp.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'scrooloose/nerdtree'
" Plugin 'Shougo/neocomplete'
Plugin 'SirVer/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'tommcdo/vim-exchange'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'wlangstroth/vim-racket'

call vundle#end()

let s:uname = system('uname -s')
if s:uname == "Darwin\n"
	let s:os = 'mac'
else
	let s:os = 'linux'
endif

" execute pathogen#infect()
let mapleader = ";"

set hidden
set number
set display=lastline " Display as much of wrapped lines as possible.
if s:os == 'mac'
	set clipboard=unnamed " Use system clipboard.
else
	set clipboard=unnamedplus " Use system clipboard.
endif
set clipboard=unnamedplus " Use system clipboard.
set history=1000
set scrolloff=2
set updatetime=60000

" No swap files.
set nobackup nowritebackup noswapfile

set showcmd
set wildmode=list:longest
set showmatch
set autoread
set autochdir
set nofoldenable " Disable folding.
set completeopt=menuone,preview,longest
set whichwrap=b,s,<,>,[,]
set ffs=unix,dos,mac
set encoding=utf-8
set spell spelllang=en_us
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

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

set t_Co=256
syntax on
if has('gui_macvim')
	colorscheme kevincox_tomorrow
	highlight ColorColumn guibg=#EEEEEE ctermbg=235
elseif has('gui_running')
	colorscheme kevincox_mustang
	highlight ColorColumn guibg=#2D2D2D ctermbg=235
else
	colorscheme kevincox_mustang
	highlight ColorColumn guibg=#2D2D2D ctermbg=235
end
if s:os == 'linux'
	set guifont=Deja\ Vu\ Sans\ Mono\ 11
elseif s:os == 'mac'
	set guifont=Monaco:h12
endif

filetype on
filetype plugin on
"filetype indent on
set autoindent copyindent preserveindent

"set smarttab
set tabstop=4 shiftwidth=4 softtabstop=0

set omnifunc=syntaxcomplete#Complete

let g:clang_make_default_keymappings = 0
let g:clang_complete_copen = 1
let g:clang_periodic_quickfix = 0
let g:clang_snippets = 0
let g:clang_snippets_engine = 'ultisnips'
let g:clang_complete_macros = 1
let g:clang_user_options = '-std=c++11'

let g:jedi#auto_vim_configuration = 0 " Fuck off.
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_select_first = 0
let g:jedi#goto_definitions_command = '<C-]>'

let g:tern_show_argument_hints = 'on_move'
let g:tern_show_signature_in_pum = 1
let g:tern_request_timeout = 10

let g:ycm_filetype_whitelist = {'javascript':1,'python':1}
let g:ycm_filetype_blacklist = {}
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_allow_changing_updatetime = 0

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:neocomplete#sources#syntax#min_keyword_length = 2

inoremap <expr> <C-Space> strlen(&omnifunc)? '<C-x><C-o>' : '<C-x><C-u>'
" inoremap <expr> <C-n> pumvisible()? '<C-n>' : '<C-x><C-u><C-p>'
" inoremap <expr> <C-p> pumvisible()? '<C-p>' : '<C-x><C-u><C-p>'

" inoremap <Left>  <C-y><Left>
" inoremap <Right> <C-y><Right>
" inoremap <Up>    <C-y><Up>
" inoremap <Down>  <C-y><Down>

" inoremap <expr> <Left>  pumvisible()? '<C-y><Left>'  : '<Left>'
" inoremap <expr> <Right> pumvisible()? '<C-y><Right>' : '<Right>'
" inoremap <expr> <Up>    pumvisible()? '<C-y><Up>'    : '<Up>'
" inoremap <expr> <Down>  pumvisible()? '<C-y><Down>'  : '<Down>'
"
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:999'
let g:ctrlp_show_hidden = 0
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=999
nnoremap // :exec 'CtrlPLine '.buffer_name('%')<CR>

nnoremap <F1> :NERDTreeToggle<CR>
inoremap <F1> <Esc>:NERDTreeToggle<CR>
map  <Leader>t :NERDTreeToggle<CR>
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
\	'/': {'pattern': '//\+\|/\*\+\|\*\+/',
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

let g:UltiSnipsExpandTrigger       = '<C-j>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

let g:delimitMate_expand_cr    = 1
let g:delimitMate_expand_space = 1

set cpoptions+=I
imap <SID><CR> <Plug>delimitMateCR
inoremap <script> <CR> <SID><CR>?<BS>
nnoremap o od<BS>
nnoremap O Od<BS>

" Add closing brace.
" inoremap {<Cr> {<Cr>}<Esc>O

" Exec cmd in a function.  This saves the search register and other things.
function! Exec(cmd)
	execute a:cmd
endfunction

command! -nargs=? Tab call SetTabs(<args>)

function! SetTabs(...)
	if a:0
		let w = a:1
	else
		let w = 4
	end
	
	let &l:tabstop     = w
	let &l:shiftwidth  = w
	let &l:softtabstop = w
endfunction

" Super-simple indent calculation.
" 
" Returns a sting containing a single indent.
" 
" Does not handle shiftwidth != tabstop.  Don't use that anyways.
function! CalcIndent()
	if &expandtab " Handle space indents.
		return repeat(' ', &shiftwidth)
	endif
	
	return "\t"
endfunction

function! Indent(type)
	silent exec "normal! :'[,']s/\\v^/".CalcIndent()."/\<CR>'["
endfunction
function! UnIndent(type)
	silent exec "normal! :'[,']s/\\v^".CalcIndent()."//\<CR>'["
endfunction

nnoremap <silent> <SID>> :set opfunc=Indent<CR>g@
nnoremap <silent> <SID>< :set opfunc=UnIndent<CR>g@

nmap <script> >  <SID>>
nmap <script> >> <SID>>$
nmap <script> <  <SID><
nmap <script> << <SID><$

vmap <script> > <Esc>'<<SID>>'>
vmap <script> < <Esc>'<<SID><'>

set wrap linebreak
let &colorcolumn=join(range(81,100),",")
set list listchars=tab:→\ ,trail:·

map <Leader>b :setlocal list!<CR>

function! SetWrap(w)
	if a:w
		setlocal wrap colorcolumn=
	else
		let &l:colorcolumn=join(range(81,999),",")
		
		" Actually enable wrapping anyways.
		setlocal wrap
	endif
endfunction

function! StartOmni(str)
	let prefix = a:str[:-2]
	let char   = a:str[-1:]
	let len    = len(prefix)
	
	let ret = char
	
	let c = col('.')-1
	let before = getline('.')[(c-len):c]
	if before == prefix
		let ret .= "\<C-Space>"
	endif
	
	return ret
endfunction

function! OmniLeaders(strs)
	for str in a:strs
		exec 'imap <buffer> <expr> <silent> '.str[-1:].' StartOmni('.string(str).')'
	endfor
endfunction

augroup filetype
	autocmd!
	autocmd BufRead,BufNewFile *.jsm setlocal filetype=javascript
	autocmd BufRead,BufNewFile *.md  setlocal filetype=markdown
	autocmd BufRead,BufNewFile *.tc  setlocal filetype=javascript
	
	autocmd FileType c           setlocal commentstring=//%s
	autocmd FileType c,cpp       call OmniLeaders(['.', '->', '::'])
	autocmd FileType c,cpp       nnoremap <C-]> :call ClangGotoDeclaration()<CR>
	autocmd FileType haml        Tab 2
	autocmd FileType java       setlocal omnifunc=javacomplete#Complete
	" autocmd fileType java       call OmniLeaders(['.'])
	autocmd FileType lisp,scheme setlocal nolisp
	autocmd FileType lisp,scheme Tab 2
	autocmd FileType markdown    call SetWrap(1)
	autocmd FileType php         call OmniLeaders(['->', '::'])
	autocmd FileType python,rst  Tab 4
	autocmd FileType python,rst  setlocal noexpandtab
	autocmd FileType tex         Tab 2
	autocmd FileType tex         call SetWrap(1)
	autocmd FileType text        call SetWrap(1)
	autocmd FileType yaml        Tab 2
	autocmd FileType yaml        setlocal noexpandtab
	autocmd FileType xml         Tab 2
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
noremap  <Leader>t  :s/\v\s+$//<Cr>
nnoremap <Leader>c  :%s/\v\S\zs\s+$//

let g:Tex_DefaultTargetFormat = 'pdf'

call tcomment#DefineType("c", "//%s\n//")
