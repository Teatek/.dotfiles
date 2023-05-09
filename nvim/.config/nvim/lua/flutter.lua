local termnr = -1

vim.api.nvim_create_user_command(
  'FlutterTerm',
  function()
    vim.api.nvim_command("belowright vsplit | terminal")
    termnr = vim.b.terminal_job_id
    vim.fn.jobsend(termnr, "flutter run\n")
    vim.api.nvim_command("$")
    vim.api.nvim_command("wincmd h")
  end,
  {}
)
