-- quickfix list
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  command = "setlocal errorformat=%#%f(%l\\,%c): %m"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  command = "setlocal makeprg=javac\\ %"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  command = "setlocal errorformat=%A%f:%l:\\ %m,%+Z%p^,%+C%.%#,%-G%.%#"
})
