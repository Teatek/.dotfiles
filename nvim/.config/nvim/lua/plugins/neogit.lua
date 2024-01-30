return {
  'NeogitOrg/neogit',
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  init = function()
    vim.keymap.set('n', '<leader>gs', ':Neogit<CR>')
  end,
  config = true
}
