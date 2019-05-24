"
"      __          __    ._.    .__.      .__.   ._______       ._____.
"      \ \        / /    | |    |   \    /   |   | .___. \     / .___. \
"       \ \      / /     | |    | |\ \  / /| |   | |    \ \   /_/     \_\
"        \ \    / /      | |    | | \ \/ / | |   | |____/ /   CC
"         \ \  / /       | |    | |  \  /  | |   | _____ /    CC       __
"          \ \/ /        | |    | |   \/   | |   | |    \ \   \ \_____/ /
"     []    \__/         |_|    |_|        |_|   |_|     \_\   \_______/
"
"             Author  Mamoru Kaminaga
"             Since 2015
"
" Plugins
"   Introduction:
"   Vim setting file.
"
" Plugins:
" https://github.com/tomasr/molokai
" https://github.com/tomtom/tcomment_vim
" https://github.com/mkaminaga/dotfiles
" https://github.com/easymotion/vim-easymotion

"======== General Settings ========
set nocompatible
set timeout timeoutlen=400 ttimeoutlen=50
let mapleader="\<Space>"
syntax on
filetype on

" Free keys for mapping.
nnoremap s <Nop>
nnoremap t <Nop>

" Move across lines.
nnoremap j gj
nnoremap k gk

" Do not use arrow keys as a Vimmer.
inoremap <Down> <Nop>
inoremap <Up> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"======== Plugins ========
colorscheme molokai
source ~/.vim/tcomment.vim  "autoload doesn't work
source ~/dotfiles/.my_vim/format.vim

filetype plugin indent on

" EasyMotion settings
let g:EasyMotion_do_mapping=1
let g:EasyMotion_leader_key="\<Leader>"
let g:EasyMotion_keys='asdfghjklgyuiopqwertnmzxcvb,./\@:[]'
let g:EasyMotion_smartcase=1
map <Leader> <Plug>(easymotion-prefix)

"nmap s <Plug>(easymotion-overwin-f)
"nmap s <Plug>(easymotion-overwin-f2)
"
"Find {char} to the right. See |f|.
  map sf <Plug>(easymotion-f)
"Find {char} to the left. See |F|.
  map sF <Plug>(easymotion-F)
"Till before the {char} to the right. See |t|.
  map st <Plug>(easymotion-t)
"Till after the {char} to the left. See |T|.
  map sT <Plug>(easymotion-T)
"Beginning of word forward. See |w|.
  map sw <Plug>(easymotion-w)
"Beginning of WORD forward. See |W|.
  map sW <Plug>(easymotion-W)
"Beginning of word backward. See |b|.
  map sb <Plug>(easymotion-b)
"Beginning of WORD backward. See |B|.
  map sB <Plug>(easymotion-B)
"End of word forward. See |e|.
  map se <Plug>(easymotion-e)
"End of WORD forward. See |E|.
  map sE <Plug>(easymotion-E)
"End of word backward. See |ge|.e)
  map sge <Plug>(easymotion-g)
"End of WORD backward. See |gE|.E)
  map sgE <Plug>(easymotion-g)
"Line downward. See |j|.
  map sj <Plug>(easymotion-j)
"Line upward. See |k|.
  map sk <Plug>(easymotion-k)
"Jump to latest "/" or "?" forward. See |n|.
  map sn <Plug>(easymotion-n)
"Jump to latest "/" or "?" backward. See |N|.
  map sN <Plug>(easymotion-N)
"Find(Search) {char} forward and backward. See |f| and |F|.
  map ss <Plug>(easymotion-s)

"=======IME========
let &t_SI .= "\e[<r"
let &t_EI .= "\e[<s\e[<0t"
let &t_te .= "\e[<0t\e[<s"

"=======Search========
set smartcase
set incsearch
set hlsearch

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

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
set fileencoding=utf-8 nobomb "save"
set fileencodings=utf-8,iso-2022-jp,enc-jp,cp932 "open"
set fileformat=unix "LF format"

"========Insert mode========
set noexpandtab
autocmd InsertEnter * set list
autocmd InsertLeave * set nolist
set listchars=tab:>-,eol:$,trail:-

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start

set tabpagemax=128
set wrapscan
set noshowmatch

set wildmenu
set formatoptions+=mM

set whichwrap=b,s,h,l,<,>,[,]

"Rename current buffer name"
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

"Binary editor vim"
augroup Binaly
  au!
  au BufReadPre *.bin let &bin=1
  au BufReadPost  *.bin if &bin | %!xxd -g 1
  au BufReadPost  *.bin set ft=xxd | endif
  au BufWritePre  *.bin if &bin | %!xxd -r
  au BufWritePre  *.bin endif
  au BufWritePost *.bin if &bin | %!xxd -g 1
  au BufWritePost *.bin set nomod | end
augroup END

"========Command mode========
set wildmenu
set wildmode=longest:full,full
set history=256

"easy touch"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap ! %
vnoremap ! %

"avoid dangerous mapping"
nnoremap ZZ   <Nop>
nnoremap ZQ   <Nop>
nnoremap <C-z>  <Nop>

"======== Tab mode shortcuts ========
"nnoremap t= <C-w>= "Disabled for few opportunity
"nnoremap t> <C-w>> "Disabled for few opportunity
"nnoremap t< <C-w>< "Disabled for few opportunity
"nnoremap t+ <C-w>+ "Disabled for few opportunity
"nnoremap t- <C-w>- "Disabled for few opportunity
"nnoremap tq :<C-u>q<CR> "Disabled for few opportunity
"nnoremap tQ :<C-u>bq<CR> "Disabled for few opportunity

"nnoremap tt :<C-u>tabnew<CR> "Disabled for few opportunity and conflict.
"nnoremap ts :tabs<CR> "Disabled for few opportunity and conflict.
nnoremap tn gt
nnoremap tp gT

"nnoremap t1 1gt "Disabled for few opportunity
"nnoremap t2 2gt "Disabled for few opportunity
"nnoremap t3 3gt "Disabled for few opportunity
"nnoremap t4 4gt "Disabled for few opportunity
"nnoremap t5 5gt "Disabled for few opportunity
"nnoremap t6 6gt "Disabled for few opportunity
"nnoremap t7 7gt "Disabled for few opportunity
"nnoremap t8 8gt "Disabled for few opportunity
"nnoremap t9 9gt "Disabled for few opportunity
"nnoremap ta 10gt "Disabled for few opportunity
"nnoremap tb 11gt "Disabled for few opportunity
"nnoremap tc 12gt "Disabled for few opportunity
"nnoremap td 13gt "Disabled for few opportunity
"nnoremap te 14gt "Disabled for few opportunity
"nnoremap tf 15gt "Disabled for few opportunity

"========tags shortcut========
nnoremap <silent> <F4> :!Ctags -R<CR>

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
command! Fit :v/\S/d

"CamelCase -> snake_case
"http://superuser.com/questions/271471/vim-macro-to-convert-camelcase-to-lowercase-with-underscores
vnoremap ,s :s/\<\@!\([A-Z]\)/\_\l\1/g<CR>gul
"snake_case -> CamelCase
"http://superuser.com/questions/271471/vim-macro-to-convert-camelcase-to-lowercase-with-underscores
vnoremap ,c :s/_\([a-z]\)/\u\1/g<CR>gUl

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
set spelllang=en_us,cjk
setlocal spellfile=~/.vim/spell/en.utf-8.add
setlocal spellfile+=~/.vim/yui_p/pic.utf-8.add
set spell

"========Specific file plugins========"
autocmd BufRead *.ino set ft=c

autocmd BufRead README.* set ft=markdown
autocmd BufRead *.tex source ~/dotfiles/.my_vim/tex.vim
autocmd BufRead *.plt source ~/dotfiles/.my_vim/tex.vim
autocmd FileType c,cpp,perl,html,ino,rc source ~/dotfiles/.my_vim/cpp.vim
