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
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tomtom/tcomment_vim')
call dein#add('tyru/open-browser.vim')
call dein#add('tpope/vim-surround')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/vimfiler')
call dein#add('LeafCage/yankround.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('t9md/vim-textmanip')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('haya14busa/incsearch.vim')
call dein#add('junegunn/vim-easy-align')
call dein#add('Shougo/vimshell')
call dein#add('tomasr/molokai')
call dein#add('fuenor/im_control.vim')
call dein#add('haya14busa/incsearch-migemo.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('scrooloose/syntastic.git')
call dein#add('ntpeters/vim-better-whitespace')
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

""""""""""""""注意""""""""""""""""""""""""""""""
"migemo検索を利用するためにcmigemoが必要
"sudo apt-get install cmigemo
"vimfiilerでゴミ箱を利用するためにtrashcliが必要
"sudo apt-get install trash-cli
""""""""""""""""""""""""""""""""""""""""""""""""

"カラースキームの設定
syntax on
colorscheme molokai
set t_Co=256

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

"ビープ音を無効にする
set visualbell t_vb=

"バックアップ、スワップファイルを取らない
set nowritebackup
set nobackup
set noswapfile

"OSのクリップボードを使用
set clipboard=unnamed,unnamedplus

"括弧のハイライトの色
hi MatchParen ctermfg = darkred ctermbg = grey

"タブの設定
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

"新しいwindowを開く時、右もしくは下に新しいwindowを開く
set splitbelow
set splitright

"バッグスペースの範囲を拡張
set backspace=indent,eol,start

"変更のあったファイルを自動でリロード
set autoread
augroup vimrc-checktime
    autocmd!
    autocmd WinEnter * checktime
augroup END

"キーバイド
noremap <space>h  ^
noremap <space>l  $
noremap <space>p  %
noremap k   gk
noremap j   gj
noremap gk  k
noremap gj  j
nnoremap <space>w  :<C-u>w<CR>
nnoremap <space>q  :<C-u>q<CR>
nnoremap <space>Q  :<C-u>q!<CR>
nnoremap <space>/  *<C-o>
nnoremap g<space>/  g*<C-o>
inoremap jk <Esc>
inoremap ｊｋ <Esc>
inoremap <C-l> <Right>
nnoremap gs  :<C-u>%s///g<Left><Left><Left>
vnoremap gs  :s///g<Left><Left><Left>
onoremap ap  a)
onoremap ip  i)
onoremap aa  a>
onoremap ia  i>
onoremap am  a}
onoremap im  i}
onoremap al  a]
onoremap il  i]
onoremap ad  a"
onoremap id  i"
onoremap as  a'
onoremap is  i'
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l
nnoremap <S-j> <C-w>j
nnoremap <S-k> <C-w>k
nnoremap <S-h> <C-w>h
nnoremap <S-l> <C-w>l
nnoremap <silent><space>c :only<CR>
nnoremap <silent><space>. :<C-u>edit $MYVIMRC<CR>

"ノーマルモードのまま空行を挿入
nnoremap <silent><space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent><space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

"Encode
set encoding=UTF-8
set fileencodings=UTF-8,cp932,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac

"fortran90用の設定
let fortran_free_source=1
let fortran_fold=1
au! BufRead,BufNewFile *.f90 let b:fortran_do_enddo=1
au  BufRead,BufWritePost *.f90 :cd %:p:h

"tex用の設定
let g:tex_flavor = "latex"
au  BufRead,BufWritePost *.tex :cd %:p:h

"前方検索と後方検索のキーバインドを一致させる
noremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
noremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction

"""""""""""better-whitespaceの設定"""""""""""""""
let g:better_whitespace_filetypes_blacklist=['vimshell', 'vimfiler', 'unite', 'neosnippet']
nmap <space>d :StripWhitespace<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""fugitiveの設定""""""""""""""""""""""""
nmap <space>gs :Gstatus<CR>
nmap <space>gw :Gwrite<CR>
nmap <space>gr :Gread<CR>
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
"fとtをeasymotionのキーで置き換え
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
"easymotionでmigemo検索を可能に
let g:EasyMotion_use_migemo = 1
"""""""""""""""""""""""""""""""""""""""""""""""""

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

""""""""""""スニペットの設定"""""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory='~/dotfiles/snippets/'
nnoremap <silent><space>, :NeoSnippetEdit<CR>
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

""""""""""syntasticとlightlineの設定""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_chek_on_open=1
let g:syntastic_chek_on_wq=0
let g:syntastic_loc_list_height=8

let g:lightline = {
      \ 'colorscheme' : 'wombat',
      \ 'active': {
      \   'left' : [ [ 'mode', 'imstate' ],
      \              [ 'fugitive', 'filename' ],],
      \   'right': [ [ 'syntastic', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ],]
      \ },
      \ 'component_function': {
      \   'mode' : 'LightLineMode',
      \   'imstate' : 'LightLineIMStatus',
      \   'fugitive' : 'LightLineFugitive',
      \   'filename' : 'LightLineFilename',
      \   'modified' : 'LightLineModefied',
      \   'fileformat' : 'LightLineFileformat',
      \   'filetype' : 'LightLineFiletype',
      \   'fileencoding' : 'LightLineFileencoding',
      \},
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
      \ }
function! LightLineMode()
return  &ft == 'unite' ? 'Unite' :
      \ &ft == 'vimfiler' ? 'vimfiler' :
      \ &ft == 'vimshell' ? 'vimshell' :
      \ lightline#mode()
endfunction
function! LightLineIMStatus()
  return IMStatus('JpFixMode')
endfunction
function! LightLineFugitive()
  if exists("*fugitive#head")
      let branch = fugitive#head()
      return  &ft == 'unite' ? '':
            \ &ft == 'vimfiler' ? '':
            \ branch !=# '' && winwidth(0) > 60 ? '⭠ '.branch : ''
  endif
  return ''
endfunction
function! LightLineModefied()
  if &modified
      return "+"
  elseif &modifiable
      return ""
  else
      return "-"
endfunction
function! LightLineFilename()
  return ('' != expand('%:t') ? expand('%:t') : '[No Nome]') .
       \ ('' != LightLineModefied() ? ' ' . LightLineModefied() : '')
endfunction
function! LightLineFiletype()
  return  IMStatus('A') == 'A' && SyntasticStatuslineFlag() != '' && winwidth(0) < 110 ? '' :
        \ IMStatus('A') == 'A' && winwidth(0) < 80 ? '' :
        \ SyntasticStatuslineFlag() != '' && winwidth(0) < 90 ? '':
        \ winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
function! LightLineFileencoding()
  return  IMStatus('A') == 'A' && SyntasticStatuslineFlag() != '' && winwidth(0) < 115 ? '' :
        \ IMStatus('A') == 'A' && winwidth(0) < 90 ? '' :
        \ SyntasticStatuslineFlag() != '' && winwidth(0) < 100 ? '':
        \ winwidth(0) > 75 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
function! LightLineFileformat()
  return  IMStatus('A') == 'A' && SyntasticStatuslineFlag() != '' && winwidth(0) < 120 ? '' :
        \ IMStatus('A') == 'A' && winwidth(0) < 100 ? '' :
        \ SyntasticStatuslineFlag() != '' && winwidth(0) < 110 ? '':
        \ winwidth(0) > 80 ? &fileformat : ''
endfunction
let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp,*.f,*.f90,*.py,*.sh, call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction
"""""""""""""""""""""""""""""""""""""

"""""""""""uniteの設定"""""""""""""""""""""""""""""""""""""""""""""
let g:unite_force_overwrite_statusline=0
nmap <silent> <space>u :<C-u>Unite -buffer-name=buffer buffer<CR>
nmap <silent> <space>m :<C-u>Unite -buffer-name=history file_mru<CR>
nmap <silent> <space>y :<C-u>Unite -buffer-name=yankround history/yank<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""vimfilerの設定""""""""""""""""""""""""
"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer=1
"vimfilerにステータスラインを上書きさせない
let g:vimfiler_force_overwrite_statusline=0
"現在開いているバッファのディレクトリを開く
nnoremap <silent> <space>e :<C-u>VimFilerBufferDir -buffer-name=explorer<CR>
"vimfilerをIDE風に開く
nnoremap <silent> <C-e> :VimFiler -split -simple -winwidth=30 -toggle -no-quit -buffer-name=tree<CR>
"デフォルトのキーマッピングを変更
augroup vimrc
    autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
    nmap <buffer> <S-l> <C-w>l
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
" 「日本語入力固定モード」の動作設定
let IM_CtrlMode = 6
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定してみてください(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=100
"ファイルがunite,vimshell,vimfilerの場合、日本語入力固定モードを個別制御
au FileType unite,vimshell,vimfiler let b:IM_CtrlBufLocalMode = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""VimShellの設定""""""""""""""""""""""
"VimShellを開く
nnoremap <silent><space>t :VimShell -buffer-name=terminal -toggle<CR>
"PopupでVimShellを開く
nnoremap <silent><space>s :VimShellPop -buffer-name=terminal<CR>
"動的プロンプトを適用
let g:vimshell_prompt_expr =
\ 'escape(fnamemodify(getcwd(), ":~")."$", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+$ '
"VimShellの高さを調整
let g:vimshell_popup_height = '25'
"normalモードでvimShellを開く
let g:vimshell_enable_start_insert = 0
"VimShellのディレクトリをカレントディレクトリに移動
command! Change call s:Change()
nnoremap <silent> <F4> :Change<CR>
function! s:Change()
  call vimshell#interactive#send("cd\ ".expand("%:p:h"))
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""コンパイルコマンド""""""""""""""""""
command! Compile call s:Compile()
nnoremap <silent> <F2> :Compile<CR>
function! s:Compile()
  let e = expand("%:e")
  if e == "c"
    call vimshell#interactive#send("gcc\ ".expand("%:p")."\ -o\ ".expand("%:p:r").".out\ -lm")
  endif
  if e == "f90" || e == "f95"
    call vimshell#interactive#send("gfortran\ ".expand("%:p")."\ -o\ ".expand("%:p:r").".out")
  endif
  if e == "tex"
    call vimshell#interactive#send("latexmk\ ".expand("%:p"))
  endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""実行コマンド"""""""""""""""""""""""""""
command! Go call s:Go()
nnoremap <silent> <F3> :Go<CR>
function! s:Go()
  let e = expand("%:e")
  if e == "c" || e == "f" || e == "f90" || e == "f95"
    call vimshell#interactive#send(expand("%:p:r").".out")
  endif
  if e == "py"
    call vimshell#interactive#send("python\ ".expand("%:p"))
  endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""
