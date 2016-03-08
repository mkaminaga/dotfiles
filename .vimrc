"
"      __          __  ._.    .__.      .__.   ._______       ._____.
"      \ \        / /  | |    |   \    /   |   | .___. \     / .___. \
"       \ \      / /   | |    | |\ \  / /| |   | |    \ \   /_/     \_\
"        \ \    / /    | |    | | \ \/ / | |   | |____/ /   CC
"         \ \  / /     | |    | |  \  /  | |   | _____ /    CC       __
"          \ \/ /      | |    | |   \/   | |   | |    \ \   \ \_____/ /
"     []    \__/       |_|    |_|        |_|   |_|     \_\   \_______/
"
"
"                        Author   Mamoru Kaminaga
"
"                              Since  2015
"
"   Introduction:
"   Vim setting file.
"
"   Plugins:
"   https://github.com/itchyny/lightline
"   https://github.com/tomasr/molokai
"   https://github.com/tomtom/tcomment_vim

"========Pluginの管理========
colorscheme molokai                    "カラースキーマ"
source ~/.vim/tcomment.vim             "一瞬でコメントアウト"
source ~/.vim/lightline.vim            "ステータスラインの強化"
filetype plugin indent on

"========検索設定=======
"検索時に大文字小文字を無視（noignorecase：無視しない）
set ignorecase

"大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"インクリメンタルサーチ
set incsearch

"検索ハイライト
set hlsearch

"quickfixのあるファイルをargsに設定
"「実践Vim」p.302
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

"quickfixのキーバインド
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

"========文字コード設定========
"vim（utf-8, shift_jis, cp932, etc.）
set encoding=utf-8

"保存するファイル
set fileencoding=utf-8

"開くファイル
set fencs=iso-2022-jp,enc-jp,cp932

"改行文字の設定（CR LF: dos, FL: unix）
set fileformat=unix

"========編集設定========
" vi互換にしない
set nocompatible

" 最大タブ数
set tabpagemax=30

" タブの画面上での幅
set tabstop=4

" 自動インデントでずれる幅
set shiftwidth=4

" タブをスペースに展開する/ しない (expandtab:展開する)
set expandtab

" C言語形式でインデントする (noautoindent:インデントしない)
set cindent

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan

" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set noshowmatch

" コマンドライン補完
set wildmenu

" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" 手動でファイル形式を定義
autocmd BufRead *.ino set ft=c
autocmd BufRead README.* set ft=markdown

" 超えたら折り返す長さの設定
" autocmd BufRead *.txt setlocal textwidth=80

" ファイル検出を有効化
filetype on

" インデントの自動調整
autocmd FileType c,cpp,perl,html,ino set cindent

" エスケープシーケンスを伴う入力の誤作動防止(neocompleteとかとの兼ね合い)
set timeout timeoutlen=1000 ttimeoutlen=40

"カーソル移動
nnoremap j gj
nnoremap k gk
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"カーソル移動に十字キーを使用しない
inoremap <Down> <Nop>
inoremap <Up> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"編集中バッファの保存先を変更する
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

"binalyファイルはHEXスタイルで編集
augroup Binaly
    au!
    au BufReadPre   *.bin let &bin=1
    au BufReadPost  *.bin if &bin | %!xxd -g 1
    au BufReadPost  *.bin set ft=xxd | endif
    au BufWritePre  *.bin if &bin | %!xxd -r
    au BufWritePre  *.bin endif
    au BufWritePost *.bin if &bin | %!xxd -g 1
    au BufWritePost *.bin set nomod | end
augroup END

"========コマンド設定========
"コマンドラインのTab補完を有効にする
set wildmenu
set wildmode=longest:full,full

"履歴バッファ
set history=255

"「保存して閉じる」の無効化
nnoremap ZZ <Nop>

"「保存せず閉じる」の無効化
nnoremap ZQ <Nop>

"強制終了の無効化
nnoremap <C-z> <Nop>

"「exモードに入る」の無効化
nnoremap Q gq

"保存
nnoremap <Space>w :w<CR>

"終了
nnoremap <Space>q :q<CR>

"インクリメント(スクリーンコマンドとの衝突回避)
nnoremap <C-i> <C-a>

"指の位置と使用頻度から考えてマッピングしたいもの
nnoremap ! %

"========ウィンドウ・タブ========
"sを無効化
nnoremap s <Nop>

"ウィンドウの大きさをそろえる
nnoremap s= <C-w>=
"ウィンドウの幅を増やす
nnoremap s> <C-w>>
"ウィンドウの幅を減らす
nnoremap s< <C-w><
"ウィンドウの高さを増やす
nnoremap s+ <C-w>+
"ウィンドウの高さを減らす
nnoremap s- <C-w>-

"新規タブ
nnoremap st :<C-u>tabnew<CR>
"タブの一覧を表示
nnoremap ss :tabs<CR>
"次のタブに移動
nnoremap sn gt
"前のタブに移動
nnoremap sp gT
"タブの番号指定
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
"ウィンドウを閉じる
nnoremap sq :<C-u>q<CR>
"バッファを閉じる
nnoremap sQ :<C-u>bq<CR>
"別タブでhelpを開く
nnoremap <F1> :tab help<CR>

"========ctagsのキーバインド========
"tを無効化
nnoremap t <Nop>

"タブファイルの更新
nnoremap tn :!Ctags -R<CR>
"tagジャンプで複数の選択肢がある場合は表示
nnoremap tj g<C-]>
"tagジャンプから復帰
nnoremap tr <C-o>

"========括弧の補完========
inoremap {<CR> {}<LEFT><CR><ESC><S-o>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
nnoremap <Esc>; <S-a>;<Esc>

"========コメントルール（Doxygen）仕様========
"ファイルコメントテンプレート
inoremap @@F /**<CR>
            \@file<Space><C-r>=expand("%")<CR><CR>
            \@brief<Space><CR>
            \@author<Space><CR>
            \@date <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR><CR>
            \*/

"関数コメントテンプレート
inoremap @@f /**<CR>
            \@brief<Space><br><CR>
            \@param [in]<Space><CR>
            \@param [out]<Space><CR>
            \@param [in,out]<Space><CR>
            \@retval<Space><CR>
            \@return<Space><CR>
            \*/

"コメント
nnoremap <F2> o/**<Space><Space>*/<Left><Left><Left>
"メンバ変数へのコメント
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

"Doxygenに関知されないコメント
inoremap /* /*<Space><Space>*/<Left><Left><Left>

"全角文字、半角カタカナの削除
command! DeleteMultiByte call s:DeleteMultiByte()
function! s:DeleteMultiByte()
    :%s/[^\x01-\x7E]//g
endfunction

"========画面表示設定========
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" タイトルを表示する
set title

" 行番号を表示 (nonumber:非表示)
set number

" ルーラーを表示 (noruler:非表示)
set ruler

" タブや改行を表示 (list:表示)
set nolist

" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap

" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2

" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2

" コマンドをステータス行に表示
set showcmd

" モードを表示する
set showmode

" タイトルを表示
set title

" シンタックスハイライト
syntax on

" 80カラムの表示
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" 余裕を持たせたスクロール
set scrolloff=3

"========速度向上のための設定========
"syntaxの読み込みバッファ上限
set synmaxcol=300

"コマンドとかがあるまで画面を更新しない
set lazyredraw

"terminalとの接続速度
set ttyfast

"========ファイル操作設定========
"~ファイルの作成を無効化
set nobackup

"内容が変更されたら自動的に読み込み
set autoread

"書き成功時に~ファイルを削除
set writebackup

"クリップボードを共有
set clipboard+=unnamed,autoselect

"バックアップファイルを作成しない (次行の先頭の "を削除すれば有効になる)
set nobackup

"スワップファイルを作成しない (次行の先頭の "を削除すれば有効になる)
set noswapfile

"保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

"========IDEとしての設定========

"clコンパイラでの単体コンパイル
nnoremap <F4> :!cl /EHsc /c %<CR>

" make
nnoremap <F5> :MakeCompile<CR>
command! MakeCompile call s:MakeCompile()
function! s:MakeCompile()
    :bufdo w
    :!make
endfunction

" gcc
nnoremap <F6> :Run<CR>
command! Run call s:Run()
function! s:Run()
    :w
    let e = expand("%:e")
    if e == "c"
        :Gcc
    elseif e == "cpp"
        :Gpp
    elseif e == "f90" || e == "f95"
        :Gfortran
    endif
endfunction

"実行
nnoremap <F9> :Execute<CR>
command! Execute call s:Execute()
function! s:Execute()
    :w
    let e = expand("%:e")
    if e == "c"
        if has("win32") || has("win64") || has("win32unix")
            :!./%:r.exe
        else
            :!./%:r.out
        endif
    elseif e == "cpp"
        if has("win32") || has("win64") || has("win32unix")
            :!./%:r.exe
        else
            :!./%:r.out
        endif
    elseif e == "f90" || e == "f95"
        if has("win32") || has("win64") || has("win32unix")
            :!./%:r.exe
        else
            :!./%:r.out
        endif
    elseif e == "py"
        :!python ./%
    elseif e == "pl"
        :!perl ./%
    else
        :!cygstart %
    endif
endfunction

" c言語
command! Gcc call s:Gcc()
function! s:Gcc()
    if has("win32") || has("win64") || has("win32unix")
        :!gcc % -o %:r.exe
    else
        :!gcc % -o %:r.out
    endif
endfunction

" C++
command! Gpp call s:Gpp()
function! s:Gpp()
    if has("win32") || has("win64") || has("win32unix")
        :!g++ % -o %:r.exe
    else
        :!g++ % -o %:r.out
    endif
endfunction

" fortran
command! Gfortran call s:Gfortran()
function! s:Gfortran()
    if has("win32") || has("win64") || has("win32unix")
        :!gfortran % -o %:r.exe
    else
        :!gfortran % -o %:r.out
    endif
endfunction

"========補完設定========
set complete=".,w,b,u,t,i,d"
set tags=./tags
