return {
  'romainl/vim-qf',

  -- theme,
  'EdenEast/nightfox.nvim',
  'tpope/vim-sleuth',
  {'tpope/vim-commentary', lazy = false },
  'tpope/vim-surround',
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
      vim.keymap.set('n', '<C-w>m', ':MaximizerToggle<CR>', { desc = "Toggle maximize window"})
    end,
  },
  'habamax/vim-godot',
}
