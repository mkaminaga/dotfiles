"
"     __          __    ._.    .__.      .__.   ._______       ._____.
"     \ \        / /    | |    |   \    /   |   | .___. \     / .___. \
"      \ \      / /     | |    | |\ \  / /| |   | |    \ \   / /     \_\
"       \ \    / /      | |    | | \ \/ / | |   | |____/ /   | |
"        \ \  / /       | |    | |  \  /  | |   | _____ /    | |      __
"         \ \/ /        | |    | |   \/   | |   | |    \ \   \ \_____/ /
"    [] g  \__/         |_|    |_|        |_|   |_|     \_\   \_______/
"
"            Author  Mamoru Kaminaga
"            Since 2020
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

" Encoding.
set fileencoding=utf-8 nobomb " default save.
set fileencodings=utf-8,iso-2022-jp,enc-jp,cp932 " default open.
set fileformat=unix " Return character is LF.

" Show white spaces in insert mode.
autocmd InsertEnter * set list
autocmd InsertLeave * set nolist
set listchars=tab:>-,eol:$,trail:-

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

set synmaxcol=1024
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

" ==================================================
" augroups
" ==================================================

" Binary editor mode.
augroup Binaly
  autocmd!
  autocmd BufReadPre *.bin let &bin=1
  autocmd BufReadPost *.bin if &bin | %!xxd -g 1
  autocmd BufReadPost *.bin set ft=xxd | endif
  autocmd BufWritePre *.bin if &bin | %!xxd -r
  autocmd BufWritePre *.bin endif
  autocmd BufWritePost *.bin if &bin | %!xxd -g 1
  autocmd BufWritePost *.bin set nomod | end
augroup END

" ==================================================
" Key mapping.
" ==================================================
source .vimrc.keymap

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
autocmd BufRead .vrapperrc set ft=vim

" ==================================================
" Settings that must be at end.
" ==================================================
filetype plugin indent on
