local cmp = require('cmp')
local nvim_lsp = require('lspconfig')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-i>'] = cmp.mapping.close()
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5 },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
local servers = { 'pyright', 'gdscript', 'eslint', 'jdtls', 'html', 'cssls', 'emmet_ls', 'intelephense' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
      -- Add capabilities
      capabilities = capabilities,
  }
end
