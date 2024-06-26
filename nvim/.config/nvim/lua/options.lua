-- global
vim.g.mapleader = " "
vim.g.netrw_winsize = 15
vim.g.netrw_preview = 1

vim.opt.showmode = false
vim.opt.mouse = 'a'
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
vim.opt.wrap = true
vim.opt.scrolloff = 4
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = 'tab:>─,eol:↲'

vim.opt.foldcolumn='auto'
vim.opt.signcolumn='auto:2'


vim.opt.dictionary = vim.opt.dictionary + '/usr/share/dict/words'

vim.opt.colorcolumn = '100'
if vim.fn.executable('rg') == 1 then
    vim.g.rg_derive_root = true
    vim.opt.grepprg = 'rg --vimgrep --no-heading'
    vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end

if vim.fn.executable('fish') == 1 then
  vim.opt.shell = '/usr/bin/fish'
end
