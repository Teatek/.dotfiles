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


-- auto term to run single file
vim.api.nvim_create_user_command(
'AutoTerm',
function()
  -- could be improve by getting opened terminal
  vim.api.nvim_command("belowright vsplit | terminal")
  local termnr = vim.b.terminal_job_id
  local user_input = vim.fn.input("Enter command: ")
  vim.fn.chansend(termnr, user_input .. "\n")
  vim.api.nvim_command("$")
  vim.api.nvim_command("wincmd h")
  autocmd({"BufWritePost"}, {
    group = TeatekGroup,
    buffer = 0,
    callback = function ()
      -- should send only if a terminal is opened
      -- and if terminal is close then we delete autocmd
      vim.fn.chansend(termnr, "clear\n")
      vim.fn.chansend(termnr, user_input .. "\n")
    end,
  })
end,
{}
)
