" Specify a directory for plugins
call plug#begin('~/local/share/nvim/plugged')

Plug 'joshdick/onedark.vim' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'nelsyeung/twig.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

colorscheme onedark 
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" set color lineNumber bar 
highlight LineNr ctermfg=gray
highlight CursorLineNr ctermfg=Yellow
set guicursor=
set noerrorbells
set number
set relativenumber
set hidden
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set nowrap

set nohlsearch
set scrolloff=8
set noswapfile
set nobackup
set undofile

set colorcolumn=80

set noshowmode
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:coc_filetype_map = {
      \ 'htmldjango' : 'html',
      \ 'blade' : 'html',
      \ 'twig' : 'html',
      \ 'jst' : 'html',
      \ }
let mapleader = " "
let g:ctrlp_use_caching = 0
let g:netrw_banner = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader><TAB> gt<CR>
nnoremap <leader><S-TAB> gT<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" explorer auto
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>ps :Rg<CR>

" jump to definition
nnoremap <leader>gr :tag<CR>

" fzf
nnoremap <C-p> :GFiles <CR>

" delete wihout changing what's in memory (register)
vnoremap <leader>p "_dP
" unknown
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" git
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
