local cmp = require('cmp')
local nvim_lsp = require('lspconfig')
local lspkind = require('lspkind')
local luasnip = require("luasnip")

local on_attach = function()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
  vim.keymap.set("n", "<leader>dl", "<Cmd>Telescope diagnostics<CR>", {buffer=0})
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {buffer=0})
end

-- servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
local servers = { 'clangd', 'pyright', 'gdscript', 'tsserver', 'jdtls', 'html', 'cssls', 'emmet_ls', 'intelephense' }
-- common settings
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
      -- Add capabilities
      capabilities = capabilities,
      on_attach = on_attach,
      debounce_text_changes = 150,
  }
end

-- c# setup
-- need to install omnisharp server (stdio)
local pid = vim.fn.getpid()

local homedir = vim.fn.getenv("HOME")

-- need to give fullpath otherwise it doesn't works
local omnisharp_bin = homedir .. "/omnisharp-server/run"

nvim_lsp.omnisharp.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}

-- ####################### autocomplete ####################### 

vim.opt.completeopt={menu, menuone, noselect}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-i>'] = cmp.mapping.close(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 },
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        path = "[path]",
        luasnip = "[snip]"
      }
    })
  }
})

-- friendly snippets
require("luasnip.loaders.from_vscode").load()
