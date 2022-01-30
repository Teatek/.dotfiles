let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $HOME/.config/nvim/init.vim
endif


call plug#begin(stdpath('data') . '/plugged')

Plug 'romainl/vim-qf'
Plug 'navarasu/onedark.nvim' 
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind-nvim'
" snippets
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" java eclipse like
Plug 'mfussenegger/nvim-jdtls'

call plug#end()

lua require("lsp")
lua require("treesitter")

set noshowmode

set mouse=a
set clipboard=unnamedplus
set guicursor=
set noerrorbells
set relativenumber
set number
set hidden
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set expandtab
set smartindent
set nowrap

set nohlsearch
set scrolloff=8
set noswapfile
set nobackup
set undofile

set list
set listchars=tab:>─,eol:↲

set colorcolumn=100
if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "

" remap

" vim-qf
nmap <Home> <Plug>(qf_qf_previous)
nmap <End>  <Plug>(qf_qf_next)

inoremap <C-c> <esc>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" explorer auto
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>

" telescope
nnoremap <C-p> <Cmd>Telescope find_files <CR>
nnoremap <leader>ps <Cmd>Telescope live_grep<CR>
nnoremap <leader>b <Cmd>Telescope buffers<CR>

" delete wihout changing what's in memory (register)
" vnoremap <leader>p "_dP
" yank pour le systeme
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" copie jusqu'en haut
nnoremap <leader>Y gg"+yGj

" make and quickfixlist

autocmd Filetype cs setlocal makeprg=dotnet
autocmd Filetype cs setlocal errorformat=\ %#%f(%l\\\,%c):\ %m
