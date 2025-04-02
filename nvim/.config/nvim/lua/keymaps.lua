local homedir = vim.fn.getenv("HOME")

-- exit
vim.keymap.set('i', '<C-c>', '<esc>')
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

vim.keymap.set('i', '<c-space>', function()
  vim.lsp.completion.get()
end)

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

-- delete
vim.keymap.set('v', '<leader>d', '"_d')
vim.keymap.set('n', '<leader>d', '"_d')
-- yank
-- paste
-- delete wihout changing what's in memory (register)
vim.keymap.set('v', '<leader>p', '"_dP')
vim.keymap.set('n', '<leader>p', '"+p')
-- yank
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
-- yank the entire file
vim.keymap.set('n', '<leader>Y', 'gg"+yGj')

-- fold toggle
-- vim.keymap.set('n', '<Tab>', 'za')

-- windows
if vim.fn.has("win32") == 1 then
  homedir = homedir.gsub(homedir, '\\', '/')
  vim.keymap.set('n', '<C-z>', '')
  -- vim.opt.shell = homedir ..'/AppData/Local/Programs/Git/bin/bash.exe'
  -- vim.opt.shellcmdflag = '-c -s'
  -- shellslash /!\ IMPORTANT : options to comment when tree-sitter is installing languages or using packer commands
  -- vim.opt.shellslash = true
end
