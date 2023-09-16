return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      -- dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      -- godot setup
      dap.adapters.godot = {
        type = "server",
        host = '127.0.0.1',
        port = 6006,
      }
      dap.configurations.gdscript = {
        {
          type = "godot",
          request = "launch",
          name = "Launch scene",
          project = "${workspaceFolder}",
          launch_scene = true,
        }
      }

    end,
    init = function()
      vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
      vim.keymap.set("n", "<F6>", ":lua require'dap'.step_over()<CR>")
      vim.keymap.set("n", "<F10>", ":lua require'dap'.step_into()<CR>")
      vim.keymap.set("n", "<F11>", ":lua require'dap'.step_out()<CR>")
      vim.keymap.set("n", "<leader>br", ":lua require'dap'.toggle_breakpoint()<CR>")
      vim.keymap.set("n", "<leader>Br", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
      vim.keymap.set("n", "<F12>", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
      vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = function()
      require('dapui').setup()
    end,
    init = function()
      vim.api.nvim_create_user_command('DapUIToggle', function(_)
        require("dapui").toggle()
      end, {}
      )

      vim.keymap.set("n", "<F4>", ":lua require('dapui').toggle()<CR>")
    end
  }
}
