if filereadable(expand('~/.vim/.vimrc.dein'))
  source ~/.vim/.vimrc.dein
endif

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
let g:syntastic_mode_map = { 'mode': 'passive', 'passive_filetypes':    ['ruby', 'scss', 'slim'] }
let g:syntastic_ruby_checkers = ['rubocop']

let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_slim_checkers = ['slim_lint']

augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

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

"=======================================================
" colorscheme
" ------------------------------------------------------
syntax on
colorscheme molokai
set background=dark

highlight Normal ctermbg=none
highlight Comment ctermfg=225

" String default 144"
highlight String ctermfg=220
highlight Visual ctermbg=240

autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead Guardfile  set filetype=ruby
autocmd BufNewFile,BufRead .pryrc     set filetype=ruby

if filereadable(expand('~/.vim/.vimrc.script'))
  source ~/.vim/.vimrc.script
endif

if filereadable(expand('~/.vim/.vimrc.set'))
  source ~/.vim/.vimrc.set
endif

if filereadable(expand('~/.vim/.vimrc.keymap'))
  source ~/.vim/.vimrc.keymap
endif

set modeline
