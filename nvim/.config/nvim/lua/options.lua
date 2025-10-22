-- global
vim.g.netrw_winsize = 15
vim.g.netrw_preview = 1

vim.o.showmode = false
vim.o.mouse = 'a'
vim.o.laststatus = 3
vim.o.winbar = '%=%m %f'
vim.o.updatetime = 50
vim.o.errorbells = false
vim.o.relativenumber = true
vim.o.number = true
vim.o.hidden = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.scrolloff = 4
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.o.list = true
vim.o.listchars = 'tab:>─,eol:↲'

vim.o.foldcolumn = 'auto'
vim.o.signcolumn = 'auto:2'

-- completion
vim.opt.dictionary = vim.opt.dictionary + '/usr/share/dict/words'


vim.diagnostic.config({
    severity_sort = true,
    float = { border = 'single' },
    virtual_text = { current_line = true },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    },
})

vim.o.colorcolumn = '100'
if vim.fn.executable('rg') == 1 then
    vim.g.rg_derive_root = true
    vim.o.grepprg = 'rg --vimgrep --no-heading'
    vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end

if vim.fn.executable('fish') == 1 then
    vim.o.shell = '/usr/bin/fish'
end
