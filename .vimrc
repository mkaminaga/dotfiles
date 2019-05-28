"
"     __          __    ._.    .__.      .__.   ._______       ._____.
"     \ \        / /    | |    |   \    /   |   | .___. \     / .___. \
"      \ \      / /     | |    | |\ \  / /| |   | |    \ \   / /     \_\
"       \ \    / /      | |    | | \ \/ / | |   | |____/ /   | |
"        \ \  / /       | |    | |  \  /  | |   | _____ /    | |      __
"         \ \/ /        | |    | |   \/   | |   | |    \ \   \ \_____/ /
"    []    \__/         |_|    |_|        |_|   |_|     \_\   \_______/
"
"            Author  Mamoru Kaminaga
"            Since 2015
"

" ==================================================
" General Settings.
" ==================================================
set nocompatible
set timeout timeoutlen=400 ttimeoutlen=50
let mapleader="\<Space>"
syntax on
filetype on
filetype plugin indent on

" Free keys for mapping.
nnoremap s <Nop>
nnoremap t <Nop>

let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
let &t_SI .= "\e[<r"
let &t_EI .= "\e[<s\e[<0t"
let &t_te .= "\e[<0t\e[<s"

" Encoding.
set fileencoding=utf-8 nobomb " default save.
set fileencodings=utf-8,iso-2022-jp,enc-jp,cp932 " default open.
set fileformat=unix " Return character is LF.

" Show white spaces in insert mode.
autocmd InsertEnter * set list
autocmd InsertLeave * set nolist
set listchars=tab:>-,eol:$,trail:-

set term=xterm
set t_Co=256

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start

set wildmenu
set wildmode=longest:full,full
set history=256

set smartcase
set incsearch
set hlsearch

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
set scrolloff=3

set tabpagemax=128
set wrapscan
set noshowmatch

set formatoptions+=mM

set whichwrap=b,s,h,l,<,>,[,]

set synmaxcol=300
set lazyredraw
set ttyfast

set nobackup
set autoread
set writebackup
set clipboard+=unnamed,autoselect
set noswapfile

" Show 80 column vertical line.
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

autocmd BufWritePre * :%s/\s\+$//ge "delete white spaces at line ends.

" About completion.
set complete=".,w,b,u,t,i,d"
set tags=./tags
set path=.
" Add include file directories.
" Example:
" set path+=~/.vim/dir/dxlib

" Spell check
set spell
set spelllang=en_us,cjk
setlocal spellfile=~/dotfiles/.vim/spell/en.utf-8.add

" ==================================================
" Plugins
" ==================================================

" Add the dein installation directory into runtimepath.
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('tomasr/molokai')
  call dein#add('itchyny/lightline.vim')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('easymotion/vim-easymotion')

  call dein#end()
  call dein#save_state()
endif

" Installation check.
if dein#check_install()
  call dein#install()
endif

" Color scheme.
colorscheme molokai

" EasyMotion setting.
let g:EasyMotion_do_mapping=1
let g:EasyMotion_leader_key="\<Leader>"
let g:EasyMotion_keys='asdfghjklgyuiopqwertnmzxcvb,./\@:[]'
let g:EasyMotion_smartcase=1
map <Leader> <Plug>(easymotion-prefix)

" See also
" ~/.cache/dein/repos/github.com/easymotion/vim-easymotion/doc/easymotion.txt
map sf <Plug>(easymotion-f)
map sF <Plug>(easymotion-F)
map st <Plug>(easymotion-t)
map sT <Plug>(easymotion-T)
map sw <Plug>(easymotion-w)
map sW <Plug>(easymotion-W)
map sb <Plug>(easymotion-b)
map sB <Plug>(easymotion-B)
map se <Plug>(easymotion-e)
map sE <Plug>(easymotion-E)
map sge <Plug>(easymotion-g)
map sgE <Plug>(easymotion-g)
map sj <Plug>(easymotion-j)
map sk <Plug>(easymotion-k)
map sn <Plug>(easymotion-n)
map sN <Plug>(easymotion-N)
map ss <Plug>(easymotion-s)

" ==================================================
" augroups
" ==================================================

" Binary editor mode.
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

" ==================================================
" Common key mapping.
" ==================================================

" Ignore arrow key inputs.
inoremap <Down> <Nop>
inoremap <Up> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Stop highlighting of search result.
map <Esc><Esc> :noh<CR>

" ==================================================
" Key mappings for normal mode.
" ==================================================

" Show search result in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Move vertical across lines.
nnoremap j gj
nnoremap k gk

" Easy mapping for save and quit.
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

"avoid dangerous mapping"
nnoremap ZZ   <Nop>
nnoremap ZQ   <Nop>
nnoremap <C-z>  <Nop>

" Tab motion shortcuts
nnoremap tn gt
nnoremap tp gT

" Tags shortcut
nnoremap <silent> <F4> :!Ctags -R<CR>

" Compilation shortcut.
nnoremap <F6> :!gcc -c %<CR>
nnoremap <F7> :!cl /EHsc /c %<CR>

" Move among argument list.
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" ==================================================
" Key mappings for visual mode.
" ==================================================

" camel case -> snake case
" See also
" http://superuser.com/questions/271471/vim-macro-to-convert-camelcase-to-lowercase-with-underscores
vnoremap ,s :s/\<\@!\([A-Z]\)/\_\l\1/g<CR>gul

" snake case -> camel case
" See also
" http://superuser.com/questions/271471/vim-macro-to-convert-camelcase-to-lowercase-with-underscores
vnoremap ,c :s/_\([a-z]\)/\u\1/g<CR>gUl

" ==================================================
" Key mappings for insert mode.
" ==================================================

" Easy key binding for Ctrl+x sub mode.
" Ignore default Ctrl+e mapping.
inoremap <C-e> <C-x>

" ==================================================
" Functions and commands.
" ==================================================

" Delete blank lines.
command! Fit :v/\S/d

" Hack quickfix argument list.
" See also " https://github.com/nelstrom/vim-qargs
command! -nargs=0 -bar Qargs execute 'args' QucikFixFileNames()
function! QucikFixFileNames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']]=
          \ bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Rename the name of current buffer.the name of
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" Help build process.
nnoremap <F5> :MakeCompile<CR>
command! MakeCompile call s:MakeCompile()
function! s:MakeCompile()
  :bufdo w
  :!make
endfunction

" Remove non Unicode characters.
nnoremap <F4> :MakeCompile<CR>
command! DeleteMultiByte call s:DeleteMultiByte()
function! s:DeleteMultiByte()
  :%s/[^\x01-\x7E]//g
endfunction

" ==================================================
" filetype related settings.
" ==================================================
autocmd BufRead *.ino set ft=c
autocmd BufRead *.cc set ft=cpp
autocmd BufRead *.plt set ft=tex
autocmd BufRead README.* set ft=markdown
autocmd BufRead readme.* set ft=markdown
autocmd BufRead Readme.* set ft=markdown

autocmd FileType tex source ~/dotfiles/.vim/tex.vim
autocmd FileType c,cpp,perl,html,ino,rc source ~/dotfiles/.vim/cpp.vim

" ==================================================
" Settings that must be at end.
" ==================================================
filetype plugin indent on
