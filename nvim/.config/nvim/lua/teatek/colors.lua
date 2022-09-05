require('onedark').setup {
  transparent = false,
  style = 'cool',
  term_colors = true,
  toggle_style_key = '<leader>ts',
  -- list toggle dark, darker, deep, warm, warmer
  toggle_style_list = {
    'light',
    'cool',
  },
}
vim.g.lightline = {
  colorscheme = 'one',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'gitbranch', 'readonly', 'filename', 'modified' }
    }
  },
  component_function = {
    gitbranch = 'FugitiveHead'
  },
}
-- vim.opt.background = 'light'
vim.opt.background = 'dark'
vim.g.solarized_termcolors = 256

vim.cmd('syntax enable')
vim.cmd('filetype plugin on')
require('onedark').load()

if vim.g.onedark_config['style'] == 'light' then
  -- gui
  vim.cmd('highlight LineNr guifg=Black')
  vim.cmd('highlight LineNrAbove guifg=Grey')
  vim.cmd('highlight LineNrBelow guifg=Grey')
  -- terminal
  vim.cmd('highlight LineNr guifg=Black')
  vim.cmd('highlight LineNrAbove ctermbg=Grey')
  vim.cmd('highlight LineNrBelow ctermbg=Grey')
elseif vim.g.onedark_config['style'] == 'cool' then
  -- gui
  vim.cmd('highlight LineNr guifg=White')
  vim.cmd('highlight LineNrAbove guifg=Grey')
  vim.cmd('highlight LineNrBelow guifg=Grey')
  -- terminal
  vim.cmd('highlight LineNr guifg=White')
  vim.cmd('highlight LineNrAbove ctermbg=Grey')
  vim.cmd('highlight LineNrBelow ctermbg=Grey')
end
