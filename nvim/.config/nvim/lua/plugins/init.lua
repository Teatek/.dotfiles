return {
  'romainl/vim-qf',

  -- theme,
  'EdenEast/nightfox.nvim',
  'tpope/vim-sleuth',
  'tpope/vim-surround',

  { 'teatek/gdscript-extended-lsp.nvim', opts = {} },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },

  -- databases
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      'tpope/vim-dadbod',
    },
    lazy = true,
    cmd = 'DBUI',
  },
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
  {
    'saghen/blink.indent',
    --- @module 'blink.indent'
    --- @type blink.indent.Config
    -- opts = {},
  },
}
