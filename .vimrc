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

" EasyMotion auto installation.
" See also
" https://qiita.com/kawaz/items/ee725f6214f91337b42b
set nocompatible
let s:cache_home=empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir=s:cache_home . '/dein'
let s:dein_repo_dir=s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath=&runtimepath .",". s:dein_repo_dir

" Add the dein installation directory into runtimepath.
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " For the improvement of visual.
  call dein#add('tomasr/molokai')
  call dein#add('itchyny/lightline.vim')

  " For the improvement of editing experience.
  call dein#add('tomtom/tcomment_vim')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')

  " for C/C++ code formatting.
  call dein#add('rhysd/vim-clang-format')
  call dein#add('kana/vim-operator-user')

  call dein#end()
  call dein#save_state()
endif

" Installation check.
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" Color scheme.
" tomasr/molokai
colorscheme molokai

" Motion plugin.
" easymotion/vim-easymotion
let g:EasyMotion_do_mapping=1
let g:EasyMotion_leader_key="\<Leader>"
let g:EasyMotion_keys='asdfghjklgyuiopqwertnmzxcvb,./\@:[]'
let g:EasyMotion_smartcase=1
map <Leader> <Plug>(easymotion-prefix)
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

" Formatter plugin.
" rhysd/vim-clang-format
" kana/vim-operator-user
"
" Dependencies:
" C/C++ http://releases.llvm.org/download.html
let g:clang_format#code_style="google"
let g:clang_format#style_options = {
      \ "Standard" : "C++11"}
augroup ClangFormatSettings
  autocmd!
  autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :ClangFormat<CR>
  autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
augroup END

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
source ~/.vimrc.keymap

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
autocmd BufRead .vrapperrc set ft=vim

autocmd FileType tex source ~/dotfiles/.vim/tex.vim
autocmd FileType c,cpp,perl,html,ino,rc source ~/dotfiles/.vim/cpp.vim
autocmd FileType c,cpp,perl,html,ino,rc source ~/dotfiles/.vim/format.vim

" ==================================================
" Settings that must be at end.
" ==================================================
filetype plugin indent on
