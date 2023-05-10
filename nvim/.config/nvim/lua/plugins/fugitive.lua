return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gs', ':G<CR>' },
  },
  cmd = 'G',
  init = function()
    vim.keymap.set('n', '<leader>gj', ':diffget //3<CR>')
    vim.keymap.set('n', '<leader>gf', ':diffget //2<CR>')
    vim.keymap.set('n', '<leader>gs', ':G<CR>')
  end
}
