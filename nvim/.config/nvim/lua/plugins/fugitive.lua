return {
  'tpope/vim-fugitive',
  cmd = 'G',
  init = function()
    vim.keymap.set('n', '<leader>gj', ':diffget //3<CR>')
    vim.keymap.set('n', '<leader>gf', ':diffget //2<CR>')
  end
}
