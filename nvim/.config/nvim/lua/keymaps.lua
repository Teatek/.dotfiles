-- globals
vim.g.mapleader = " "
vim.g.netrw_winsize = 15

local homedir = vim.fn.getenv("HOME")

-- exit
vim.keymap.set('i', '<C-c>', '<esc>')
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

-- windows
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>')
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>')
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>')
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>')

-- move lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Save a file as root (,W)
vim.keymap.set('n', '<leader>W', ':w !sudo tee % > /dev/null<CR>')

-- explorer auto (like nerdtree)
vim.keymap.set('n', '<leader>pv', ':Lexplore<CR>')

-- resize
vim.keymap.set('n', '<leader>+', ':resize +5<CR>')
vim.keymap.set('n', '<leader>-', ':resize -5<CR>')
--
-- telescope
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>ps', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>bf', '<cmd>Telescope buffers<CR>')

-- delete wihout changing what's in memory (register)
vim.keymap.set('v', '<leader>p', '"_dP')
-- yank pour le systeme
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
-- copie jusqu'en haut
vim.keymap.set('n', '<leader>Y', 'gg"+yGj')

-- windows
if vim.fn.has("win32") == 1 then
  homedir = homedir.gsub(homedir, '\\', '/')
  vim.keymap.set('n', '<C-z>', '')
  vim.opt.shell = homedir .. '/AppData/Local/Programs/Git/bin/bash.exe'
end
