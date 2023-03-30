vim.keymap.set("n", "<F4>", ":lua require('dapui').toggle()<CR>")
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F6>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>br", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>Br", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")

require("dapui").setup()

vim.api.nvim_create_user_command(
'DapUIToggle',
function(opts)
  require("dapui").toggle()
end,
{}
)

local dap = require("dap")

local homedir = vim.fn.getenv("HOME")
dap.adapters.coreclr = {
  type = 'executable',
  command = homedir .. 'work/soft/dotnet/netcoredbg/netcoredbg.exe',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}
