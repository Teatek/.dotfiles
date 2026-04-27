return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "igorlfs/nvim-dap-view",
  },
  config = function()
    local dap = require('dap')
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
  keys = {
    { "<F4>",       "<cmd>DapViewToggle<cr>" },
    { "<leader>br", "<cmd>DapToggleBreakpoint<cr>" },
    { "<F5>",       "<cmd>DapContinue<cr>" },
  },
}
