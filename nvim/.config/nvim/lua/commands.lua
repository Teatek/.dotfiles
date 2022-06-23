-- folding
-- function IndentFoldWithImp()
--   local thisline = vim.api.nvim_win_get_cursor(0)
--   if thisline =~? '\v^\s*$' then
--     return '-1'
--   end

--   if thisline =~ '^import.*$' then
--     return 1
--   else
--     return indent(v:lnum) / &shiftwidth
--   end
-- end

vim.api.nvim_create_autocmd("FileType vim", {
  command = "setlocal foldmethod=marker"
})
vim.api.nvim_create_autocmd("FileType javascript", {
  command = "setlocal foldmethod=expr"
})
vim.api.nvim_create_autocmd("FileType javascript", {
  command = "setlocal foldexpr=IndentFoldWithImp()"
})
vim.api.nvim_create_autocmd("FileType java", {
  command = "setlocal foldmethod=expr"
})
vim.api.nvim_create_autocmd("FileType java", {
  command = "setlocal foldexpr=IndentFoldWithImp()"
})

-- quickfix list
-- vim.api.nvim_create_autocmd("FileType cs", {
--   command = "setlocal errorformat= %#%f(%l\\,%c): %m"
-- })
