-- Attach lsp when it detect a lsp at the file
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
    end

    -- Better go to definition
    if client.name ~= 'gdscript' then
      vim.keymap.set('n', 'gd', "<C-]>", { buffer = 0 })
    else
      vim.keymap.set('n', '<leader>D', ':Telescope gdscript-extended-lsp class<CR>')
      vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({search_file = '*.gd'})<CR>")
    end
  end,
})

-- Enable the following servers
vim.lsp.enable({ 'lua_ls', 'gdscript', 'jedi_language_server', 'ts_ls', 'svelte', 'html', 'cssls', 'eslint', 'jsonls' })
vim.diagnostic.config({ virtual_text = true })
vim.cmd("set completeopt+=noselect")


-- User command

vim.api.nvim_create_user_command('Lsplog', function()
  vim.cmd(string.format('tabnew %s', vim.lsp.log.get_filename()))
end, {
  desc = 'Opens the Nvim LSP client log.',
})
