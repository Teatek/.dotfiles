---@diagnostic disable: missing-fields
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context'
  },
  branch = "main",
  config = function()
    require('nvim-treesitter').install { "c", "lua", "vim", "vimdoc", "query", "java", "gdscript", "python", "gdscript" }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'python', 'gdscript' },
      callback = function() vim.treesitter.start() end,
    })

    require('treesitter-context').setup {
      max_lines = 3, -- Max sticky header size
    }
  end
}
