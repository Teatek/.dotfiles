local augroup = vim.api.nvim_create_augroup
local TeatekGroup = augroup('Teatek', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})


autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = TeatekGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- automatically folding
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.*",
  command = "silent! loadview"
})
-- vim.api.nvim_create_autocmd("BufWinLeave", {
--   pattern = "*.*",
--   command = "mkview"
-- })

