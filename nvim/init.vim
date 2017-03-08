if filereadable(expand('~/.config/nvim/dein.vim'))
  source ~/.config/nvim/dein.vim
endif

set termguicolors

nmap 1 0
nmap 0 ^
nmap 9 $

inoremap <silent> jj <ESC>

nnoremap ; :

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>j% :vsplit<CR>
nnoremap <Leader>j" :split<CR>
nnoremap <Leader>jh <C-w>h<CR>
nnoremap <Leader>jh <C-w>h<CR>
nnoremap <Leader>jj <C-w>j<CR>
nnoremap <Leader>jk <C-w>k<CR>
nnoremap <Leader>jl <C-w>l<CR>

nnoremap <Leader>i :Unite buffer<CR>

nnoremap <Leader>o :CtrlP<CR>

let g:run_rspec_bin = 'spring rspec'
nnoremap <Leader>r :RunSpec<CR>

nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

nnoremap <silent> gff :Gdiff<CR>

nnoremap m :SyntasticCheck<CR>

nnoremap<silent>eo :NERDTreeToggle<CR>

set clipboard+=unnamedplus

"title を表示
set title
"ルーラーを表示
set ruler
"行番号を表示
set number
"タブの代わりに半角スペース
set expandtab

" 横線
" set cursorline
" 縦線
" set cursorcolumn

" swp ファイルなし
set nobackup
set noswapfile

"java の場合 タブ4文字分
if expand("%:t") =~ ".*\.java"
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
elseif expand("%:t") =~ ".*\.go"
  set noexpandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
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
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }


" 文頭や文末で左右に動いたら次の行や前の行にいけるようにする
set whichwrap=b,s,h,l,<,>,[,]

" タブ文字とか半角とか色々を可視化
set list
set lcs=tab:>.,trail:_,extends:\

set clipboard+=unnamed

"折りたたみ
set foldmethod=indent
set foldlevel=2

" set tags=.tags

set scrolloff=12

set mouse=a

set incsearch
set nohlsearch

set autoindent
set wildmenu

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


"=======================================================
" colorscheme
" ------------------------------------------------------
syntax on
set background=dark
colorscheme material-theme

autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead Guardfile  set filetype=ruby
autocmd BufNewFile,BufRead .pryrc     set filetype=ruby

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge


let g:syntastic_mode_map = { 'mode': 'passive', 'passive_filetypes':    ['ruby', 'scss', 'slim'] }
let g:syntastic_ruby_checkers = ['rubocop']

let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_slim_checkers = ['slim_lint']


"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif
