return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    opt = true
  },
  opts = {
    options = {
      theme = 'auto',
      globalstatus = true,
      section_separators = '',
      component_separators = '|'
    },
    extensions = { "oil", "nvim-dap-ui" },
  },
}
