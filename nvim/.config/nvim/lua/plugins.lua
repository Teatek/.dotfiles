return require('packer').startup(function(use)
  use 'romainl/vim-qf'
  use 'altercation/vim-colors-solarized'
  use 'navarasu/onedark.nvim' 
  use 'itchyny/lightline.vim'
  use 'itchyny/vim-gitbranch'
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  use 'nvim-telescope/telescope.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-abolish'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'onsails/lspkind-nvim'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  -- prettier
  use 'sbdchd/neoformat'

  -- java eclipse like
  use 'mfussenegger/nvim-jdtls'
  -- c# textdoc/definition
  use 'Hoffs/omnisharp-extended-lsp.nvim'

  -- rest api
  use 'NTBBloodbath/rest.nvim'
end)
