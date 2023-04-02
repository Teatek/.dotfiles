require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'auto'
    -- ... your lualine config
  }
}

-- set colorscheme automatically based on terminal theme
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    if vim.g.background == 'dark' then
      vim.cmd.colorscheme('nightfox')
    else
      vim.cmd.colorscheme('dayfox')
    end
  end
})

-- set colorscheme by default
vim.cmd[[colorscheme nightfox]]
