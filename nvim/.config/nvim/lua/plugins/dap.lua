return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap"
  },
  config = function()
    require("dapui").setup()
  end,
  init = function()
    vim.api.nvim_create_user_command(
      'DapUIToggle',
      function(_)
        require("dapui").toggle()
      end,
      {}
    )

    vim.keymap.set("n", "<F4>", ":lua require('dapui').toggle()<CR>")
    vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
    vim.keymap.set("n", "<F6>", ":lua require'dap'.step_over()<CR>")
    vim.keymap.set("n", "<F10>", ":lua require'dap'.step_into()<CR>")
    vim.keymap.set("n", "<F11>", ":lua require'dap'.step_out()<CR>")
    vim.keymap.set("n", "<F12>", ":lua require'dap'.toggle_breakpoint()<CR>")
    vim.keymap.set("n", "<leader>br", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
    vim.keymap.set("n", "<leader>Br", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
    vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
  end
}
