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
" let g:run_rspec_bin = 'docker-compose exec server bin/rspec'

nnoremap <Leader>r :RunSpecLine<CR>
nnoremap <Leader>re :RunSpec<CR>

nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

nnoremap <silent> gff :Gdiff<CR>

" nnoremap m :SyntasticCheck<CR>

nnoremap<silent>eo :NERDTreeToggle<CR>
