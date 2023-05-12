return {
  'romainl/vim-qf',

  -- theme,
  'EdenEast/nightfox.nvim',

  'tpope/vim-sleuth',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'tpope/vim-vinegar',
  'tpope/vim-unimpaired',
  'tpope/vim-abolish',

  -- databases
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      'tpope/vim-dadbod',
    },
    lazy = true,
    cmd = 'DBUI',
  },

  -- prettier,
  {'sbdchd/neoformat', cmd = 'Neoformat'},

  -- java eclipse like,
  'mfussenegger/nvim-jdtls',

  {
    'reisub0/hot-reload.vim',
    ft = "dart",
  },

  {
    'szw/vim-maximizer',
    init = function()
      vim.keymap.set('n', '<C-w>m', ':MaximizerToggle<CR>')
    end,
  },
}
