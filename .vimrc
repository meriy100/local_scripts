""""""""""""""""""""
"プラグインのセットアップ
"""""""""""""""""""""


"if has('vim_starting')
"  set nocompatible               " Be iMproved

"  " Required:
"  set runtimepath+=~/.vim/bundle/neobundle.vim/
"endif

" -------------------------------
" NeoBundle
" -------------------------------
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-latex/vim-latex'
"NeoBundle 'im_control', {'type' : 'nosync', 'base' : '~/.vim/bundle/manual'}


" コード補完
"NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'marcus/rsense'
"NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
"
" 静的解析
NeoBundle 'scrooloose/syntastic'
"
" " ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
"
" " メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'
"
" " 自動で閉じる
NeoBundle 'tpope/vim-endwise'
"indent color guides
NeoBundle 'nathanaelkane/vim-indent-guides'

"color scheme
""NeoBundle 'w0ng/vim-hybrid'
""NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'tomasr/molokai'
"slim のハイライト
NeoBundle "slim-template/vim-slim"

" coffee のハイライト
NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'


" ...省略

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""


"Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""
" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby =  '[^.*\t]\.\w*\|\h\w*::'
" --------------------------------
" rubocop
" --------------------------------
"syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
"active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':    ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

""""""""""""""""""""""""""""""
"im_control
"日本語入力周り (input japanese)
""""""""""""""""""""""""""""""
" 「日本語入力固定モード」切替キー
"inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" PythonによるIBus制御指定
"let IM_CtrlIBusPython = 1
"バッファ毎に日本語入力固定モードの状態を制御。
"let g:IM_CtrlBufLocalMode = 1

function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
"inoremap <silent> <ESC> :call ImInActivate()<CR>

"""""""""""""""""""""""""""""


augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

""augroup highlightOptionSpace
""  autocmd!
""  autocmd Colorscheme * highlight OptionSpace term=underline ctermbg=DarkBlue guibg=DarkBlue
""  autocmd VimEnter,WinEnter * match OptionSpace / /
""augroup END

"title を表示
set title
"ルーラーを表示
set ruler
"行番号を表示
set number
"タブの代わりに半角スペース
set expandtab

set cursorline

" swp ファイルなし
set nobackup

"タブ2文字分
""set tabstop=2
""set softtabstop=2
""set shiftwidth=2

"java の場合 タブ4文字分
if expand("%:t") =~ ".*\.java"
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
else
  "タブ2文字分
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endif

"encoding = utf
set encoding=utf-8
scriptencoding utf-8
" 保存する時の文字コード
set fileencoding=utf-8
" 開く時の文字コード
set fileencodings=utf-8,cp932,euc-jp
" 端末の文字コード
set termencoding=utf-8
"backspace で改行、インデント、以前入力した文字を削除できるようにする
set backspace=indent,eol,start

"ステータスラインの表示
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" 文頭や文末で左右に動いたら次の行や前の行にいけるようにする
set whichwrap=b,s,h,l,<,>,[,]

" タブ文字とか半角とか色々を可視化
set list
set lcs=tab:>.,trail:_,extends:\

" 縦線
set cursorcolumn




if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" クリップボードの共有
"set clipboard=unnamed,autoselect
set clipboard+=unnamed
""set clipboard=unnamed,autoselect
""set clipboard=unnamedplus
"折りたたみ
set foldmethod=indent
set foldlevel=2

" () {} などの補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

"erb アシスト
if expand("%:t") =~ ".*\.erb"
  nnoremap pe i<%=  %><LEFT><LEFT><LEFT>
  nnoremap er i<%  %><LEFT><LEFT><LEFT>
endif

""inoremap <expr> % Lt_Percent_Completion()
""function Lt_Percent_Completion()
""  if matchstr(getline('.'), '.', col('.') -1 ) == ">"
""    return "\%\%\<Left>"
""  else
""    return "\%"
""  end
""endf



"" インデントガイド
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=022
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=027
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"=======================================================
" colorscheme
" ------------------------------------------------------
syntax on
""set background=dark
colorscheme molokai

highlight Normal ctermbg=none
highlight Comment ctermfg=225

"String default 144"
highlight String ctermfg=220
highlight Visual ctermbg=240


set tags=.tags

set scrolloff=12

" ショートカット C-s C-q
map  <C-q> :q<CR>
nmap  <C-s> :w!<CR>
imap <C-s> <Esc>:w!<CR>


if filereadable(expand('~/.vimrc.script'))
  source ~/.vimrc.script
endif

set mouse=a
set ttymouse=xterm2
