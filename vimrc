"dein関連のpathの設定
let s:vimdir = $HOME . "/.vim"
let s:dein_dir = s:vimdir . '/dein'
let s:dein_github = s:dein_dir . '/repos/github.com'
let s:dein_repo_name = "Shougo/dein.vim"
let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name

"deinがインストールされているかのチェック
if !isdirectory(s:dein_repo_dir)
    echo "dein is not installed, install now "
    let s:dein_repo = "https://github.com/" . s:dein_repo_name
    echo "git clone " . s:dein_repo . " " . s:dein_repo_dir
    call system("git clone " . s:dein_repo . " " . s:dein_repo_dir)
endif
let &runtimepath = &runtimepath . "," . s:dein_repo_dir

call dein#begin(s:dein_dir)
""""""""プラグインを以下に記述""""""""""""""""""""""""""""""""
call dein#add('Shougo/dein.vim')
call dein#add('vim-jp/vimdoc-ja')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tomtom/tcomment_vim')
call dein#add('tyru/open-browser.vim')
call dein#add('tpope/vim-surround')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/neossh.vim')
call dein#add('Shougo/vimfiler')
call dein#add('LeafCage/yankround.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('t9md/vim-textmanip')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('rhysd/clever-f.vim')
call dein#add('haya14busa/incsearch.vim')
call dein#add('junegunn/vim-easy-align')
call dein#add('Shougo/vimshell')
call dein#add('tomasr/molokai')
call dein#add('fuenor/im_control.vim')
call dein#add('haya14busa/incsearch-migemo.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('w0rp/ale')
call dein#add('ryanoasis/vim-devicons')
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('mattn/emmet-vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('lordm/vim-browser-reload-linux')
call dein#add('Yggdroot/indentLine', {'on_path' : '.*'})
call dein#add('cohama/lexima.vim', {'on_i': 1})
call dein#add('Shougo/neocomplete.vim', {'on_i': 1})
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call dein#end()
"プラグインのインストールを確認
if dein#check_install()
    call dein#install()
endif

""""""""""""""注意"""""""""""""""""""""""""""""""""
"migemo検索を利用するためにcmigemoが必要
"Ubuntuなら
"sudo apt-get install cmigemo
"Archなら
"AURからnkfとcmigemo-gitをダウンロードしてmakepkg

"vimfilerでゴミ箱を利用するためにtrashcliが必要
"Ubuntuなら
"sudo apt-get install trash-cli
"Archなら
"sudo pacman -S trash-cli

"browser-reload-linuxを利用するためにxdotoolが必要
"Ubuntuなら
"sudo apt-get install xdotool
"Archなら
"sudo pacman -S xdotool
""""""""""""""""""""""""""""""""""""""""""""""""""""

"vimのhelpを日本語で開く
set helplang=ja,en

"カラースキームの設定
syntax on
colorscheme molokai
set t_Co=256

"ファイルタイプを認識しないバクの回避
setf text
if !did_filetype()
  setlocal filetype=
endif

"ステータスバーの表示
set laststatus=2

"検索周りの設定
set incsearch
set hlsearch
set ignorecase
set smartcase

"コマンド履歴の設定
set history=200

"行番号を表示
set number

"ファイル変更中に他のファイルを表示可能にする
set hidden

"非常に長い行を表示
set display=lastline

"ビープ音を無効にする
set visualbell t_vb=

"バックアップ、スワップファイルを取らない
set nowritebackup
set nobackup
set noswapfile

"OSのクリップボードを使用
if has('clipboard')
    set clipboard=unnamed,unnamedplus
endif

"括弧のハイライトの色
hi MatchParen ctermfg = darkred ctermbg = grey

"タブの設定
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

"htmlファイルのインデント幅は2に設定
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.html,*htm setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

"新しいwindowを開く時、右もしくは下に新しいwindowを開く
set splitbelow
set splitright

"バックスペースの範囲を拡張
set backspace=indent,eol,start

"変更のあったファイルを自動でリロード
set autoread
augroup vimrc-checktime
    autocmd!
    autocmd WinEnter * checktime
augroup END

"開いたファイルからディレクトリを遡り.vimrc.localを読み込むオートコマンド
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END
function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

"キーバイド
noremap <space>h ^
noremap <space>l $
noremap <space>p %
noremap k gk
noremap j gj
noremap gk k
noremap gj j
nnoremap <space>w :<C-u>w<CR>
nnoremap <space>q :<C-u>q<CR>
nnoremap <space>Q :<C-u>q!<CR>
nnoremap <space>/ *<C-o>
nnoremap g<space>/ g*<C-o>
nnoremap + <C-a>
nnoremap - <C-x>
inoremap jk <Esc>
inoremap ｊｋ <Esc>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
nnoremap gs :<C-u>%s///g<Left><Left><Left>
vnoremap gs :<C-u>'<,'>s///g<Left><Left><Left>
vnoremap a ggoG$
onoremap ap a)
onoremap ip i)
onoremap aa a>
onoremap ia i>
onoremap am a}
onoremap im i}
onoremap al a]
onoremap il i]
onoremap ad a"
onoremap id i"
onoremap as a'
onoremap is i'
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l
nnoremap <S-j> <C-w>j
nnoremap <S-k> <C-w>k
nnoremap <S-h> <C-w>h
nnoremap <S-l> <C-w>l
nnoremap <silent><space>c :<C-u>only<CR>
nnoremap <silent><space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <silent><Esc><Esc> :<C-u>noh<CR>
nnoremap <silent><space>du :<C-u>call dein#update()<CR>

"入力モードで全角数字を半角数字に変換
inoremap １ 1
inoremap ２ 2
inoremap ３ 3
inoremap ４ 4
inoremap ５ 5
inoremap ６ 6
inoremap ７ 7
inoremap ８ 8
inoremap ９ 9
inoremap ０ 0

"ノーマルモードのまま空行を挿入
nnoremap <silent><space>o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent><space>O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

"Encode
set encoding=UTF-8
set fileencodings=UTF-8,cp932,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac

"fortran90用の設定
let fortran_free_source=1
let fortran_fold=1
au! BufRead,BufNewFile *.f90,*f03 let b:fortran_do_enddo=1

"tex用の設定
let g:tex_flavor = "latex"
let g:tex_conceal = ''

"前方検索と後方検索のキーバインドを一致させる
noremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
noremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
function! s:search_forward_p()
    return exists('v:searchforward') ? v:searchforward : 1
endfunction

"""""""""""better-whitespaceの設定"""""""""""""""
let g:better_whitespace_filetypes_blacklist=
    \['vimshell', 'vimfiler', 'unite', 'neosnippet', 'help']
nnoremap <space>ds :StripWhitespace<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""fugitiveの設定""""""""""""""""""""""""
nnoremap <silent><space>gs :<C-u>Gstatus<CR>
nnoremap <silent><space>gw :<C-u>Gwrite<CR>
nnoremap <silent><space>gr :<C-u>Gread<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""easymotionの設定""""""""""""""""""""""
"デフォルトのキーマッピングを廃止
let g:EasyMotion_do_mapping = 0
"move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)
"ライン移動
nmap <C-l> <Plug>(easymotion-overwin-line)
vmap <C-l> <Plug>(easymotion-bd-jk)
omap <C-l> <Plug>(easymotion-bd-jk)
"easymotionでmigemo検索を可能に
let g:EasyMotion_use_migemo = 1
"大文字を入力したとき以外は大文字、小文字を無視
let g:EasyMotion_smartcase = 1
"""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""clever-fの設定""""""""""""""""""""""""
let g:clever_f_smart_case=1
let g:clever_f_use_migemo=1
let g:clever_f_across_no_line=1
let g:clever_f_fix_key_direction=1
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""incsearchの設定"""""""""""""""""""""""
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"migemo検索
map m/ <Plug>(incsearch-migemo-stay)
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""vim-textmanipの設定"""""""""""""""
vmap <S-j> <Plug>(textmanip-move-down)
vmap <S-k> <Plug>(textmanip-move-up)
vmap <S-h> <Plug>(textmanip-move-left)
vmap <S-l> <Plug>(textmanip-move-right)
""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""tcomment_vimの設定""""""""""""""""""""
if !exists('g:tcomment_types')
    let g:tcomment_types = {}
endif
let g:tcomment_types['fortran'] = '! %s'
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""open-browserの設定""""""""""""""""""""
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"""""""""""""""""""""""""""""""""""""""""""""""""

"""browser-reload-linuxの設定""""""""""""""""""""
command! Chr ChromeReload
command! Chstart ChromeReloadStart
command! Chstop ChromeReloadStop
au! BufRead,BufNewFile *htm,*html execute(':Chstart')
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""emmet-vimの設定"""""""""""""""""""""""
let g:user_emmet_settings = {
    \ 'variables':{
    \ 'lang':"ja"
    \},
    \ 'indentation':'  '
\}
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""スニペットの設定"""""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory='~/.dotfiles/snippets/'
nnoremap <silent><space>, :<C-u>NeoSnippetEdit<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""単語補完(neocomplete)"""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 1
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""aleの設定"""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_column_always   = 1
let g:ale_echo_msg_error_str   = nr2char(0xf421)
let g:ale_echo_msg_warning_str = nr2char(0xf420)
let g:ale_statusline_format    = [g:ale_echo_msg_error_str.' %d', g:ale_echo_msg_warning_str.' %d', '']
let g:ale_echo_msg_format      = '%severity% %linter% - %s'
let g:ale_sign_error           = g:ale_echo_msg_error_str
let g:ale_sign_warning         = g:ale_echo_msg_warning_str
let g:ale_linters              = {
\    'c' : ['clang'],
\    'cpp' : ['clang'],
\}
nmap <silent><C-k> <Plug>(ale_previous_wrap)
nmap <silent><C-j> <Plug>(ale_next_wrap)
highlight link ALEErrorSign ErrorMsg
highlight link ALEWarningSign MoreMsg
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""lightlineの設定"""""""""""""""""""""""""""""""""""
let g:lightline = {
    \ 'colorscheme' : 'wombat',
    \ 'active' : {
    \    'left' : [['mode', 'imstate'],
    \    ['fugitive', 'filename', 'ale_warning', 'ale_error'],],
    \    'right' : [['lineinfo'],
    \    ['percent'],
    \    ['fileformat', 'fileencoding', 'filetype']],
    \},
    \ 'component_function' : {
    \    'imstate' : 'LightLineIMStatus',
    \    'fugitive' : 'LightLineFugitive',
    \    'filename' : 'LightLineFilename',
    \    'filetype' : 'LightLineFileType',
    \    'fileformat' : 'LightLineFileFormat',
    \},
    \ 'component_expand' : {
    \    'ale_error' : 'ALEGetError',
    \    'ale_warning' : 'ALEGetWarning',
    \},
    \ 'component_type' : {
    \    'ale_error' : 'error',
    \    'ale_warning' : 'warning',
    \},
    \ 'separator': { 'left': nr2char(0xe0b0), 'right': nr2char(0xe0b2) },
    \ 'subseparator': { 'left': nr2char(0xe0b1), 'right': nr2char(0xe0b3) },
\}

function! LightLineIMStatus()
    return IMStatus('JpFix')
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let branch = fugitive#head()
        return &ft == 'unite' ? '' :
        \ &ft == 'vimfiler' ? '' :
        \ &ft == 'vimshell' ? '' :
        \ branch != '' ? nr2char(0xe0a0).' '.branch : ''
    endif
    return ''
endfunction

function! LightLineFilename()
    return ('' != expand('%:t') ? expand('%:t') : '[No Nome]').LightLineModefied()
endfunction

function! LightLineModefied()
    if &modified
        return " +"
    elseif &modifiable
        return ""
    else
        return " -"
endfunction

function! ALEGetError()
    let l:buffer = bufnr('%')
    let l:error_count = ale#statusline#Count(l:buffer)['error']
    return l:error_count == 0 ? '' : printf(g:ale_statusline_format[0], l:error_count)
endfunction

function! ALEGetWarning()
    let l:buffer = bufnr('%')
    let l:warning_count = ale#statusline#Count(l:buffer)['warning']
    return l:warning_count == 0 ? '' : printf(g:ale_statusline_format[1], l:warning_count)
endfunction

function! LightLineFileType()
  return strlen(&filetype) ? &filetype.' '.WebDevIconsGetFileTypeSymbol() : 'no ft'
endfunction

function! LightLineFileFormat()
  return &fileformat.' '.WebDevIconsGetFileFormatSymbol()
endfunction

augroup LightLineOneALE
autocmd!
autocmd User ALELint call lightline#update()
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""uniteの設定"""""""""""""""""""""""""""""""""""""""""""""
let g:unite_force_overwrite_statusline=0
nnoremap <silent> <space>u :<C-u>Unite -buffer-name=buffer buffer<CR>
nnoremap <silent> <space>m :<C-u>Unite -buffer-name=history file_mru<CR>
nnoremap <silent> <space>y :<C-u>Unite -buffer-name=yankround history/yank<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""vimfilerの設定""""""""""""""""""""""""
"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer=1
"vimfilerにステータスラインを上書きさせない
let g:vimfiler_force_overwrite_statusline=0
"現在開いているバッファのディレクトリを開く
nnoremap <silent> <space>e :<C-u>VimFilerBufferDir -buffer-name=explorer<CR>
"vimfilerをIDE風に開く
nnoremap <silent> <C-e> :<C-u>VimFilerBufferDir -split -simple -winwidth=30 -toggle -no-quit -buffer-name=tree<CR>
"デフォルトのキーマッピングを変更
augroup vimfiler
    autocmd!
    autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
    nnoremap <buffer><S-l> <C-w>l
endfunction

"VimFilerでリモートのファイルをIDE風に開くためのコマンド
command! -nargs=1 SshFilerTree call SshFilerTree(<f-args>)
function! SshFilerTree(host)
    if bufnr('vimfiler:explorer') != -1
        execute ':bw vimfiler:explorer'
    endif
    let l:vimfiler_options = '-split -simple -winwidth=30 -no-quit -buffer-name=explorer ssh://'.a:host.'/'
    execute ':VimFiler '.l:vimfiler_options
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""yankroundの設定"""""""""""""""""""""""""""
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 100
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""alignの設定"""""""""""""""""""""""""""""""""""""""""""
"ヴィジュアルモードで選択し、easy-alignを呼んで整形
vmap <Enter> <Plug>(EasyAlign)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""im_control.vim""""""""""""""""""""""""""
" fcitx
let IM_CtrlMode = 6
" 「日本語入力固定モード」切替キー
inoremap <silent><C-a> <C-r>=IMState('FixMode')<CR>
set timeout timeoutlen=3000 ttimeoutlen=100
"ファイルがunite,vimshell,vimfilerの場合、日本語入力固定モードを個別制御
au! FileType unite,vimshell,vimfiler let b:IM_CtrlBufLocal=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""VimShellの設定""""""""""""""""""""""
"PopupでVimShellを開く
nnoremap <silent><space>s :<C-u>VimShellPop -buffer-name=terminal<CR>
"動的プロンプトを適用
let g:vimshell_prompt_expr =
\ 'escape(fnamemodify(getcwd(), ":~")."$", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+$ '
"VimShellの高さを調整
let g:vimshell_popup_height = '25'
"normalモードでvimShellを開く
let g:vimshell_enable_start_insert = 0
"デフォルトのキーマッピングを変更
augroup vimshell
    autocmd!
    autocmd FileType vimshell call s:vimshell_my_settings()
augroup END
function! s:vimshell_my_settings()
    inoremap <buffer><c-l> <Esc>zta
endfunction
"バッファのカレントディレクトリに移動
command! ChCurrentDir call s:CdCurrentDir()
nnoremap <silent><F4> :<C-u>ChCurrentDir<CR>
function! s:CdCurrentDir()
    call vimshell#interactive#send('cd '.expand("%:p:h"))
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""句読点の変換を切り替えるtoggle""""""""""""""
let g:toggle_conv_punc=1
inoremap 、 ，
inoremap 。 ．
command! ToggleConvPunc call s:ToggleConvPunc()
nnoremap <silent><space>tp :<C-u>ToggleConvPunc<CR>
function! s:ToggleConvPunc()
    if g:toggle_conv_punc == 0
        inoremap 、 ，
        inoremap 。 ．
        let g:toggle_conv_punc=1
        echo 'Convert:ON'
    else
        inoremap 、 、
        inoremap 。 。
        let g:toggle_conv_punc=0
        echo 'Convert:OFF'
    endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:toggle_caps_lock=0
command! ToggleCapsLock call ToggleCapsLock()
nnoremap <silent><space>tc :<C-u>ToggleCapsLock<CR>
inoremap <silent><C-c> <C-r>=ToggleCapsLock()<CR>
function! ToggleCapsLock()
    if g:toggle_caps_lock == 0
        " 小文字->大文字
        inoremap a A
        inoremap b B
        inoremap c C
        inoremap d D
        inoremap e E
        inoremap f F
        inoremap g G
        inoremap h H
        inoremap i I
        inoremap j J
        inoremap k K
        inoremap l L
        inoremap m M
        inoremap n N
        inoremap o O
        inoremap p P
        inoremap q Q
        inoremap r R
        inoremap s S
        inoremap t T
        inoremap u U
        inoremap v V
        inoremap w W
        inoremap x X
        inoremap y Y
        inoremap z Z
        " 大文字->小文字
        inoremap A a
        inoremap B b
        inoremap C c
        inoremap D d
        inoremap E e
        inoremap F f
        inoremap G g
        inoremap H h
        inoremap I i
        inoremap J j
        inoremap K k
        inoremap L l
        inoremap M m
        inoremap N n
        inoremap O o
        inoremap P p
        inoremap Q q
        inoremap R r
        inoremap S s
        inoremap T t
        inoremap U u
        inoremap V v
        inoremap W w
        inoremap X x
        inoremap Y y
        inoremap Z z
        let g:toggle_caps_lock=1
        echo 'Caps Lock:ON'
    else
        " 小文字->小文字
        inoremap a a
        inoremap b b
        inoremap c c
        inoremap d d
        inoremap e e
        inoremap f f
        inoremap g g
        inoremap h h
        inoremap i i
        inoremap j j
        inoremap k k
        inoremap l l
        inoremap m m
        inoremap n n
        inoremap o o
        inoremap p p
        inoremap q q
        inoremap r r
        inoremap s s
        inoremap t t
        inoremap u u
        inoremap v v
        inoremap w w
        inoremap x x
        inoremap y y
        inoremap z z
        " 大文字->大文字
        inoremap A A
        inoremap B B
        inoremap C C
        inoremap D D
        inoremap E E
        inoremap F F
        inoremap G G
        inoremap H H
        inoremap I I
        inoremap J J
        inoremap K K
        inoremap L L
        inoremap M M
        inoremap N N
        inoremap O O
        inoremap P P
        inoremap Q Q
        inoremap R R
        inoremap S S
        inoremap T T
        inoremap U U
        inoremap V V
        inoremap W W
        inoremap X X
        inoremap Y Y
        inoremap Z Z
        let g:toggle_caps_lock=0
        echo 'Caps Lock:OFF'
    endif
    return ''
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""コンパイルコマンド""""""""""""""""""
command! Compile call s:Compile()
nnoremap <silent> <F2> :Compile<CR>
function! s:Compile()
    let e = expand("%:e")
    let l:current_directory = expand("%:p:h")
    let l:filename_ext = expand("%:p")
    let l:filename = expand("%:p:r")
    let l:makefile = findfile('Makefile', escape(expand('%:p:h'), ' ').';')
    if bufnr('[vimshell] - terminal') == -1
        execute(':VimShellPop -buffer-name=terminal')
    endif
    if v:version >= 800
        if getbufinfo('[vimshell] - terminal')['']['hidden'] == 1
            execute(':VimShellPop -buffer-name=terminal')
        endif
    endif
    if strlen(l:makefile)
        call vimshell#interactive#send('cd '.fnamemodify(l:makefile, ':p:h'))
        call vimshell#interactive#send('make')
    else
        if e == "c"
            call vimshell#interactive#send('gcc '.l:filename_ext.' -o '.l:filename.'.out -lm')
        endif
        if e == "cc" || e == "cpp"
            call vimshell#interactive#send('g++ '.l:filename_ext.' -o '.l:filename.'.out -lm')
        endif
        if e == "f90" || e == "f95" || e == "f03"
            call vimshell#interactive#send('gfortran '.l:filename_ext.' -o '.l:filename.'.out')
        endif
        if e == "tex"
            call vimshell#interactive#send('cd '.l:current_directory)
            call vimshell#interactive#send('latexmk '.l:filename_ext)
        endif
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""実行コマンド"""""""""""""""""""""""""""
command! Go call s:Go()
nnoremap <silent> <F3> :Go<CR>
function! s:Go()
    let e = expand("%:e")
    let l:filename_ext = expand("%:p")
    let l:filename = expand("%:p:r")
    let l:makefile = findfile('Makefile', escape(expand('%:p:h'), ' ').';')
    if bufnr('[vimshell] - terminal') == -1
        execute(':VimShellPop -buffer-name=terminal')
    endif
    if v:version >= 800
        if getbufinfo('[vimshell] - terminal')['']['hidden'] == 1
            execute(':VimShellPop -buffer-name=terminal')
        endif
    endif
    if strlen(l:makefile)
        if exists('g:make_go_command')
            call vimshell#interactive#send('cd '.fnamemodify(l:makefile, ':p:h'))
            call vimshell#interactive#send(g:make_go_command)
        endif
    else
        if e == "c" || e == "cc" || e == "cpp" || e == "f" || e == "f90" || e == "f95" || e == "f03"
            call vimshell#interactive#send(l:filename.'.out')
        endif
        if e == "py"
            call vimshell#interactive#send('python '.l:filename_ext)
        endif
        if e == "lua"
            call vimshell#interactive#send('lua '.l:filename_ext)
        endif
        if e == "rb"
            call vimshell#interactive#send('ruby '.l:filename_ext)
        endif
        if e == "htm" || e == "html"
            call vimproc#open(expand("%:p"))
        endif
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""
