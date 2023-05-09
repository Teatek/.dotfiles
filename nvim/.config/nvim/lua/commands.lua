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
autocmd("BufWinEnter", {
  pattern = "*.*",
  command = "silent! loadview"
})
-- vim.api.nvim_create_autocmd("BufWinLeave", {
--   pattern = "*.*",
--   command = "mkview"
-- })

-- prevent changing hightlight when using a LSP Server
autocmd("ColorScheme", {
  callback = function(_)
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
  end
})
