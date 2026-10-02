return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    -- Open parent directory in current window
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.api.nvim_create_user_command("Sex", function(opts)
      local my_dir = opts.args ~= "" and opts.args or nil

      require("oil").open(my_dir, {
        preview = {
          horizontal = true,
        },
      })
    end, {
    nargs = "?",
    complete = "dir",
  })
  end,
}
