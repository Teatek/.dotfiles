require('onedark').setup {
  transparent = false,
  style = 'cool',
  toggle_style_key = '<leader>ts',
-- list toggle dark, darker, deep, warm, warmer 
  toggle_style_list  = { 
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
vim.cmd('filetype plugin on')
vim.cmd('syntax enable')
-- vim.opt.background = 'dark'
-- vim.opt.background = 'light'
vim.g.solarized_termcolors = 256
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
else
  -- gui
  vim.cmd('highlight LineNr guifg=White')
  vim.cmd('highlight LineNrAbove guifg=Grey')
  vim.cmd('highlight LineNrBelow guifg=Grey')
  -- terminal
  vim.cmd('highlight LineNr guifg=White')
  vim.cmd('highlight LineNrAbove ctermbg=Grey')
  vim.cmd('highlight LineNrBelow ctermbg=Grey')
end
