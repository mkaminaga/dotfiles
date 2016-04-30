"
"      __          __    ._.    .__.      .__.   ._______       ._____.
"      \ \        / /    | |    |   \    /   |   | .___. \     / .___. \
"       \ \      / /     | |    | |\ \  / /| |   | |    \ \   /_/     \_\
"        \ \    / /      | |    | | \ \/ / | |   | |____/ /   CC
"         \ \  / /       | |    | |  \  /  | |   | _____ /    CC       __
"          \ \/ /        | |    | |   \/   | |   | |    \ \   \ \_____/ /
"     []    \__/         |_|    |_|        |_|   |_|     \_\   \_______/
"
"							Author	Mamoru Kaminaga
"							Since	2015
"
"	Plugins
"   Introduction:
"   Vim setting file.
"
"	Plugins:
"	https://github.com/itchyny/lightline
"	https://github.com/tomasr/molokai
"	https://github.com/tomtom/tcomment_vim

"========Plugin========
colorscheme molokai
source ~/.vim/tcomment.vim
source ~/.vim/lightline.vim
filetype plugin indent on

syntax on
filetype on

"=======Search========
set smartcase
set incsearch
set hlsearch

"quickfix arguments
"Vimp.302
"https://github.com/nelstrom/vim-qargs
command! -nargs=0 -bar Qargs execute 'args' QucikFixFileNames()
function! QucikFixFileNames()
	let buffer_numbers = {}
	for quickfix_item in getqflist()
		let buffer_numbers[quickfix_item['bufnr']]=
					\ bufname(quickfix_item['bufnr'])
	endfor
	return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

"quick fix list
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

"Unicode characters only remain
command! DeleteMultiByte call s:DeleteMultiByte()
function! s:DeleteMultiByte()
	:%s/[^\x01-\x7E]//g
endfunction

"========Encodings========
set encoding=utf-8 "default"
set fileencoding=utf-8 "save"
set fileencodings=utf-8,iso-2022-jp,enc-jp,cp932 "open"
set fileformat=unix "LF format"

"========Insert mode========
set nocompatible
set noexpandtab
autocmd InsertEnter * set list
autocmd InsertLeave * set nolist
set listchars=tab:>-,eol:$,trail:-

set tabstop=4
set shiftwidth=4
set softtabstop=4
set cindent
set backspace=indent,eol,start

set tabpagemax=30
set wrapscan
set noshowmatch

set wildmenu
set formatoptions+=mM

autocmd BufRead *.ino set ft=c
autocmd BufRead README.* set ft=markdown
" autocmd BufRead *.txt setlocal textwidth=80

autocmd FileType c,cpp,perl,html,ino set cindent
set timeout timeoutlen=1000 ttimeoutlen=40

nnoremap j gj
nnoremap k gk
inoremap <C-j>		<Down>
inoremap <C-k>		<Up>
inoremap <C-h>		<Left>
inoremap <C-l>		<Right>

inoremap <Down>		<Nop>
inoremap <Up>		<Nop>
inoremap <Left>		<Nop>
inoremap <Right>	<Nop>

set whichwrap=b,s,h,l,<,>,[,]

"Rename current buffer name"
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

"Binary editor vim"
augroup Binaly
	au!
	au BufReadPre	*.bin let &bin=1
	au BufReadPost	*.bin if &bin | %!xxd -g 1
	au BufReadPost	*.bin set ft=xxd | endif
	au BufWritePre	*.bin if &bin | %!xxd -r
	au BufWritePre	*.bin endif
	au BufWritePost *.bin if &bin | %!xxd -g 1
	au BufWritePost *.bin set nomod | end
augroup END

"========Command mode========
set wildmenu
set wildmode=longest:full,full
set history=255

"easy touch"
nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>
nnoremap ! %
vnoremap ! %

"avoid dangerous mapping"
nnoremap ZZ		<Nop>
nnoremap ZQ		<Nop>
nnoremap <C-z>	<Nop>

"========Window shortcut========
nnoremap s <Nop>
nnoremap s= <C-w>=
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-

nnoremap st :<C-u>tabnew<CR>
nnoremap ss :tabs<CR>
nnoremap sn gt
nnoremap sp gT

nnoremap s1 1gt
nnoremap s2 2gt
nnoremap s3 3gt
nnoremap s4 4gt
nnoremap s5 5gt
nnoremap s6 6gt
nnoremap s7 7gt
nnoremap s8 8gt
nnoremap s9 9gt
nnoremap sa 10gt
nnoremap sb 11gt
nnoremap sc 12gt
nnoremap sd 13gt
nnoremap se 14gt
nnoremap sf 15gt

nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bq<CR>

"========tags shortcut========
nnoremap <silent> <F4> :!Ctags -R<CR>

"========Small completion========
inoremap {<CR> {}<LEFT><CR><ESC><S-o>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
nnoremap <Esc>; <S-a>;<Esc>

"========Doxygen style comment========
inoremap @@F /**<CR>
			\@file<Space><C-r>=expand("%")<CR><CR>
			\@brief<Space><CR>
			\@author<Space><CR>
			\@date <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR><CR>
			\*/

inoremap @@f /**<CR>
			\@brief<Space><br><CR>
			\@param [in]<Space><CR>
			\@param [out]<Space><CR>
			\@param [in,out]<Space><CR>
			\@retval<Space><CR>
			\@return<Space><CR>
			\*/

nnoremap <F2> o/**<Space><Space>*/<Left><Left><Left>
nnoremap <F3> A<Space>/**<<Space><Space>*/<Left><Left><Left>
inoremap @F @file<Space><C-r>=expand("%")<CR><Space>
inoremap @f @fn<Space><CR>
inoremap @b @brief<Space>
inoremap @D @detail<Space>
inoremap @a @author<Space>
inoremap @d @date <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR><Space>
inoremap @p @param<Space>
inoremap @r @return<Space>
inoremap @R @retval<Space>
inoremap @S @sa<Space>
inoremap @c @class<Space>
inoremap @v @var<Space>
inoremap @s @struct<Space>
inoremap @e @enum<Space>

"========No doxygen style comment========
inoremap /* /*<Space><Space>*/<Left><Left><Left>

"========Window Looks========
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set title
set number
set ruler
set nolist

set wrap
set laststatus=2
set cmdheight=2
set showcmd
set showmode
set showbreak=>
set title
set scrolloff=3

"80 column visual
if (exists('+colorcolumn'))
	set colorcolumn=80
	highlight ColorColumn ctermbg=9
endif

set synmaxcol=300
set lazyredraw
set ttyfast

"========Editing mode========
set nobackup
set autoread
set writebackup
set clipboard+=unnamed,autoselect
set nobackup
set noswapfile
autocmd BufWritePre * :%s/\s\+$//ge "delete white spaces at $"

"========IDE vim========
"make
nnoremap <F5> :MakeCompile<CR>
command! MakeCompile call s:MakeCompile()
function! s:MakeCompile()
	:bufdo w
	:!make
endfunction

"gcc"
nnoremap <F6> :!gcc -c %<CR>

"Microsoft cl, Visual C++"
nnoremap <F7> :!cl /EHsc /c %<CR>

"========Completion========
set complete=".,w,b,u,t,i,d"
set tags=./tags
set path=.
set path+=~/.vim/dir/dxlib
set path+=~/.vim/dir/directx

"========Spell check========
set spelllang=en_us
setlocal spellfile=~/.vim/spell/en.utf-8.add
setlocal spellfile+=~/.vim/yui_p/pic.utf-8.add

