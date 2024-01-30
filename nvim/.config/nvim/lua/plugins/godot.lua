return {
  'Teatek/gdscript-extended-lsp.nvim',
  config = function()
    local on_attach = function()
      local gdplugin = require('gdscript_extended')
      if vim.fn.exists(':GodotDoc') == 0 then
        vim.api.nvim_create_user_command("GodotDoc", function(cmd)
          -- Change the function depending on what you prefer
          gdplugin.open_doc_in_current_win(cmd.args)
        end,{
        nargs = 1,
        complete = function()
          return gdplugin.get_native_classes()
        end
        })
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
      vim.keymap.set("n", "gD", "<Cmd>lua require('gdscript_extended').open_doc_on_cursor_in_current_win()<CR>", {buffer=0})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=0})
      vim.keymap.set("n", "<leader>D", "<Cmd>Telescope gdscript_extended default<CR>", {buffer=0})
      vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
      vim.keymap.set("n", "<leader>dl", "<Cmd>Telescope diagnostics<CR>", {buffer=0})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
      vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, {buffer=0})
    end

    local doc_conf = function(bufnr)
      vim.keymap.set("n", "gD", "<Cmd>lua require('gdscript_extended').open_doc_on_cursor_in_current_win()<CR>", {buffer=bufnr})
      vim.keymap.set("n", "<leader>D", "<Cmd>Telescope gdscript_extended default<CR>", {buffer=bufnr})
    end
    require("gdscript_extended").setup({
      on_attach = on_attach,
      doc_keymaps = {
        user_config = doc_conf
      }
    })
  end,
}
