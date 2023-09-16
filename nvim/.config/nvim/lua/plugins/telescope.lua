return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-telescope/telescope-ui-select.nvim'
  },
  keys = {
    { '<leader>ca'},
  },
  cmd = {'Telescope'},
  config = function()
    require("telescope").setup({
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        }
      }
    })

    require("telescope").load_extension("ui-select")

  end,
  init = function()
    local function project_files()
      local opts = {} -- define here if you want to define something
      vim.fn.system('git rev-parse --is-inside-work-tree')
      if vim.v.shell_error == 0 then
        require"telescope.builtin".git_files(opts)
      else
        require"telescope.builtin".find_files(opts)
      end
    end

    vim.keymap.set('n', '<C-p>', project_files)
    vim.keymap.set('n', '<leader>pf', '<cmd>Telescope find_files<CR>')
    vim.keymap.set('n', '<leader>ps', '<cmd>Telescope live_grep<CR>')
    vim.keymap.set('n', '<leader>bf', '<cmd>Telescope buffers<CR>')
  end
}
