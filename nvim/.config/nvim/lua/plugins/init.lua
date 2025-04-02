return {
  'romainl/vim-qf',

  -- theme,
  'EdenEast/nightfox.nvim',
  'tpope/vim-sleuth',
  'tpope/vim-surround',

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
  { 'sbdchd/neoformat', cmd = 'Neoformat' },

  {
    'reisub0/hot-reload.vim',
    ft = "dart",
  },

  {
    'szw/vim-maximizer',
    init = function()
      vim.keymap.set('n', '<C-w>m', ':MaximizerToggle<CR>', { desc = "Toggle maximize window" })
    end,
  },
}
