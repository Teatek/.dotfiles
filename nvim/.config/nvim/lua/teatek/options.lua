vim.opt.showmode = false
vim.opt.mouse = 'a'
vim.opt.guicursor = ''
vim.opt.laststatus = 2
vim.opt.updatetime = 50
vim.opt.errorbells = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hidden = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.foldlevel = 99
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
---WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  end
})
---ENDWORKAROUND

vim.opt.hlsearch = true
vim.opt.scrolloff = 8
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.list = true
vim.opt.listchars = 'tab:>─,eol:↲'

vim.opt.colorcolumn = '100'
if vim.fn.executable('rg') == 1 then
    vim.g.rg_derive_root = true
    vim.opt.grepprg = 'rg --vimgrep --no-heading'
    vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end

if vim.fn.executable('fish') == 1 then
  vim.opt.shell = '/usr/bin/fish'
end
