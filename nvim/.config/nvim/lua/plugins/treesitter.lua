---@diagnostic disable: missing-fields
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context'
  },
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- require('nvim-treesitter').install { "c", "lua", "vim", "vimdoc", "query", "java", "gdscript", "python", "gdscript" }
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang and vim.treesitter.language.add(lang) then
           vim.treesitter.start()
        end
      end,
    })

    require('treesitter-context').setup {
      max_lines = 3, -- Max sticky header size
    }
  end
}
