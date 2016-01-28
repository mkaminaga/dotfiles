"
"
"
"
"
"
"   00000000000000000000000000000000000000000000000000000000000000000000000
"   00000   00000   000    0000    000000    000         0000000      00000
"   000000  00000  00000  000000  0 0000 0  00000  0000   0000  000000  000
"   000000  00000  00000  000000  00 00 00  00000  0000   000  000000000000
"   0000000  000  000000  000000  00 00 00  00000       00000  000000000000
"   00  0000  0  0000000  000000  000  000  00000  0000  00000  000000  000
"   00  00000   0000000    0000    000000    000    000    00000      00000
"   00000000000000000000000000000000000000000000000000000000000000000000000
"
"
"                        Author   Mamoru Kaminaga
"
"                              Since  2015
"
"

"---------------------------------------------------------------------------
"検索設定
"---------------------------------------------------------------------------

"検索時に大文字小文字を無視（noignorecase：無視しない）
set ignorecase

"大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"インクリメンタルサーチ
set incsearch

"検索ハイライト
set hlsearch

"---------------------------------------------------------------------------
"文字コード設定
"---------------------------------------------------------------------------

"vim（utf-8, shift_jis, cp932, etc.）
set encoding=utf-8

"保存するファイル
set fileencoding=utf-8

"開くファイル
set fencs=iso-2022-jp,enc-jp,cp932

"改行文字の設定（CR LF: dos, FL: unix）
set fileformat=dos

"---------------------------------------------------------------------------
"編集設定
"---------------------------------------------------------------------------

"最大タブ数
set tabpagemax=30

"vi互換にしない
set nocompatible

"タブの画面上での幅
set tabstop=4

"自動インデントでずれる幅
set shiftwidth=4

"タブをスペースに展開する/ しない (expandtab:展開する)
set expandtab

"C言語形式でインデントする (noautoindent:インデントしない)
set cindent

"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

"検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan

"括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch

"コマンドライン補完するときに強化されたものを使う(参照 :help  wildmenu)
set wildmenu

"テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"ファイル検出を有効化
filetype on

"インデントの自動調整
autocmd FileType c,cpp,perl,html set cindent

"超えたら折り返す長さの設定
autocmd FileType txt setlocal textwidth=80

"エスケープシーケンスを伴う入力の誤作動防止(neocompleteとかとの兼ね合い)
set timeout timeoutlen=1000 ttimeoutlen=40

"
"autocloseの代替
"

"自動
inoremap {<CR> {}<LEFT><CR><ESC><S-o>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
"inoremap < <><Left> 負等号を打つときに邪魔
inoremap /* /*<Space><Space>*/<Left><Left><Left>
nnoremap <Esc>; <S-a>;<Esc>

"Insertモード時でもhjikでカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"編集中バッファの保存先を変更する
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

"---------------------------------------------------------------------------
"画面表示設定
"---------------------------------------------------------------------------

"カラースキーマ
set term=xterm
set t_Co=256
" set t_AB=^[[48;5;%dm
" set t_AF=^[[38;5;%dm
" source ~/dotfiles/.vim/colors/odonata.vim

"タイトルを表示する
set title

"行番号を表示 (nonumber:非表示)
set number

"ルーラーを表示 (noruler:非表示)
set ruler

"タブや改行を表示 (list:表示)
set nolist

"長い行を折り返して表示 (nowrap:折り返さない)
set wrap

"常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2

"コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2

"コマンドをステータス行に表示
set showcmd

"モードを表示する
set showmode

"タイトルを表示
set title

"シンタックスハイライト
syntax on

"80カラム
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

"カーソル位置のsyntaxを表示
nnoremap <F4> :echo synIDattr(synID(line('.'), col('.'), 0), 'name')

"余裕を持たせたスクロール
set scrolloff=3

"
"速度向上のための設定
"

"syntaxの読み込みバッファ上限（デフォルトは3000）
set synmaxcol=300

"コマンドとかがあるまで画面を更新しない
set lazyredraw

"terminalとの接続速度が上がりコピペしやすくなる
set ttyfast

"---------------------------------------------------------------------------
"ファイル操作設定
"---------------------------------------------------------------------------

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

"binalyファイルはHEXスタイルで編集
augroup Binaly
    au!
    au BufReadPre   *.bin let &bin=1
    au BufReadPost  *.bin if  &bin | %!xxd -g 1
    au BufReadPost  *.bin set ft=xxd | endif
    au BufWritePre  *.bin if  &bin | %!xxd -r
    au BufWritePre  *.bin endif
    au BufWritePost *.bin if  &bin | %!xxd -g 1
    au BufWritePost *.bin set nomod | end
augroup END

"---------------------------------------------------------------------------
"コマンド設定
"---------------------------------------------------------------------------

"
"デフォルトの解決
"

"コマンドラインのTab補完を有効にする
set wildmenu
set wildmode=longest:full,full

"履歴バッファ
set history=50

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

"
"ウィンドウ・タブのキーバインド
"

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

"
"ctagsのキーバインド
"

"tを無効化
nnoremap t <Nop>

"タブファイルの更新
nnoremap tn :!Ctags -R<CR>
"tagジャンプで複数の選択肢がある場合は表示
nnoremap tj g<C-]>
"tagジャンプから復帰
nnoremap tr <C-o>

"---------------------------------------------------------------------------
"IDE的な設定
"---------------------------------------------------------------------------

"GNUツールを用いたmakeコマンド
nnoremap <F5> :MakeCompile<CR>
command! MakeCompile call s:MakeCompile()
function! s:MakeCompile()
    :bufdo w
    :!make
endfunction

"Microsoftツールのnmakeコマンド
nnoremap <F6> :NMakeCompile<CR>
command! NMakeCompile call s:NMakeCompile()
function! s:NMakeCompile()
    if has("win32") || has("win64") || has("win32unix")
        :bufdo w
        :!nmake
    endif
endfunction

"Microsoftツールのclコンパイラ
nnoremap <F8> :Cl<CR>
command! Cl call s:Cl()
function! s:Cl()
    if has("win32") || has("win64") || has("win32unix")
        :w
		:!cl % -o %:r.exe
    endif
endfunction

"コンパイル
nnoremap <F7> :Run<CR>
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

"----

"c言語
command! Gcc call s:Gcc()
function! s:Gcc()
    if has("win32") || has("win64") || has("win32unix")
        :!gcc % -o %:r.exe
    else
        :!gcc % -o %:r.out
    endif
endfunction

"C++
command! Gpp call s:Gpp()
function! s:Gpp()
    if has("win32") || has("win64") || has("win32unix")
        :!g++ % -o %:r.exe
    else
        :!g++ % -o %:r.out
    endif
endfunction

"fortran
command! Gfortran call s:Gfortran()
function! s:Gfortran()
    if has("win32") || has("win64") || has("win32unix")
        :!gfortran % -o %:r.exe
    else
        :!gfortran % -o %:r.out
    endif
endfunction

"----

"実行コマンド
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
    elseif e == "ttl"
        if has("win32") || has("win64") || has("win32unix")
			:!cygstart %
        endif
    endif
endfunction

"---------------------------------------------------------------------------
"Neobundleでプラグインを管理する
"---------------------------------------------------------------------------

set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('$HOME/.vim/bundle'))

"キャッシュの読込み
call neobundle#load_cache()

"
"NeoBundleで管理するプラグインをここに記述する
"

"neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

"カラースキーマ
NeoBundle 'tomasr/molokai'

"統合ユーザーインターフェース
NeoBundle 'Shougo/unite.vim'

"高速検索（grep強化版的な?）
NeoBundle 'rking/ag.vim'

"バックグラウンドで非同期処理を実行
NeoBundle 'Shougo/vimproc', {
\   'build' : {
\      'windows' : 'make -f make_mingw32.mak',
\      'cygwin' : 'make -f make_cygwin.mak',
\      'mac' : 'make -f make_mac.mak',
\      'unix' : 'make -f make_unix.mak',
\    },
\}

"ステータスラインの表示を強化
NeoBundle 'itchyny/lightline.vim'

"自動かっこ閉じ(neocompleteと相性が悪いらしい)
"NeoBundle 'Townk/vim-autoclose'

"コード補完
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'

"コード補完の強化
NeoBundle 'Shougo/neocomplete'

"コメントのON/OFF
NeoBundle 'tomtom/tcomment_vim'

"キャッシュの書込み
NeoBundleSaveCache

call neobundle#end()

filetype plugin indent on

"未インストールのプラグインがある場合、インストールするかどうかを尋ねる
NeoBundleCheck

"---------------------------------------------------------------------------
"プラグイン毎の設定

"
"vimprocの設定
"
if has('mac')
     let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
elseif has('win32')
     let g:vimproc_dll_path
         \= $HOME . '.vim/bundle/vimproc/autoload/vimproc_win32.dll'
elseif has('win64')
     let g:vimproc_dll_path
         \= $HOME . '.vim/bundle/vimproc/autoload/vimproc_win64.dll'
endif

"
"uniteの設定
"
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_max_candidates = 200

"大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

try
    let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
    "let g:unite_source_rec_async_command='ag --nogroup -g ""'
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry

"ファイルツリーからファイルを選択
nnoremap <space><space><space> :tabe<cr>
\:<C-u>Unite -start-insert file_rec/async<cr>

"uniteのリセット
:nnoremap <space>r <Plug>(unite_restart)

"
"neosnippetの設定
"
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>": "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

"For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

"
"neocompleteの設定
"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!

"競合解決のためAutoComplPopを無効化（AutoComplPopがない場合には不要）
let g:acp_enableAtStartup = 0

"neocompleteを起動時に有効化
let g:neocomplete#enable_at_startup = 1

"大文字が入力されるまで大文字・小文字を無視.
let g:neocomplete#enable_smart_case = 1

"大文字を区切りとしたワイルドカード機能（Javaなどで有効, 重いので無効化）
let g:neocomplcache_enable_camel_case_completion = 0

"'_'区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

"syntaxをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 4

"neocompleteを自動的にロックするバッファ名のパターンを指定
let g:neocomplcache_dictionary_filetype_lists = '*.txt'

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"
"キーバインド
"

"前回行われた補完をキャンセル
inoremap <expr><C-g>     neocomplete#undo_completion()

"補完候補の中から共通する部分を補完
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  "For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"ポップアップを削除する
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

"
"オムニ補完を有効化する
"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"  For perlomni.vim setting.
"  https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
