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

set nobackup nowritebackup
set noswapfile
set noundofile
set autoread
set clipboard+=unnamed,autoselect

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
" filetype related settings.
" ==================================================
autocmd BufRead *.cc set ft=cpp
autocmd BufRead *.ino set ft=c
autocmd BufRead *.plt set ft=tex
autocmd BufRead .vrapperrc set ft=vim
autocmd BufRead README.* set ft=markdown
autocmd BufRead Readme.* set ft=markdown
autocmd BufRead readme.* set ft=markdown
autocmd BufRead surfaces.txt set ft=dot

" ==================================================
" Plugins
" ==================================================
if has("gui_running")
  " None for gVim
else
  source ~/.vimrc.plugins
endif

" ==================================================
" Functions and commands.
" See also .vimrc.util
" ==================================================
command! Fit :v/\S/d
command! -nargs=0 -bar Qargs execute 'args' QucikFixFileNames()
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
command! DeleteMultiByteChars call DeleteMultiByteChars()
nnoremap <F5> :MakeCompile<CR>

" TODO : Not working in gVim
nnoremap \s :call ToSnakeCase()<CR>
nnoremap \p :call ToPascalCase()<CR>
nnoremap \c :call ToCamelCase()<CR>

" ==================================================
" External files
" ==================================================
if has("gui_running")
  source C:\cygwin64\home\Mamoru\dotfiles\.vimrc.keymap
  source C:\cygwin64\home\Mamoru\dotfiles\.vimrc.util
  setlocal spellfile=C:\cygwin64\home\Mamoru\.vim\spell\en.utf-8.add
else
  source ~/.vimrc.keymap
  source ~/.vimrc.util
  setlocal spellfile=~/.vim/spell/en.utf-8.add
endif

" ==================================================
" Filetype
" ==================================================
if has("gui_running")
  autocmd FileType c,cpp,perl,html,ino,rc source C:\cygwin64\home\Mamoru\dotfiles\my_vim\c.vim
  autocmd FileType cs source C:\cygwin64\home\Mamoru\dotfiles\my_vim\cs.vim
  autocmd FileType tex source C:\cygwin64\home\Mamoru\dotfiles\my_vim\tex.vim
else
  autocmd FileType c,cpp,perl,html,ino,rc source ~/dotfiles/my_vim/c.vim
  autocmd FileType cs source ~/dotfiles/my_vim/cs.vim
  autocmd FileType tex source ~/dotfiles/my_vim/tex.vim
endif

" ==================================================
" Graphics
" ==================================================
if has("gui_running")
  "silent! source C:\cygwin64\home\Mamoru\.vim\colors\molokai.vim
  colorscheme desert " TODO Unable to load external colorscheme from gVim
  set guifont=MS_Gothic:h10
  set spell
  set spelllang=en_us,cjk
else
  set term=xterm
  set t_Co=256
  colorscheme molokai
endif

" ==================================================
" Settings that must be at end.
" ==================================================
filetype plugin indent on

