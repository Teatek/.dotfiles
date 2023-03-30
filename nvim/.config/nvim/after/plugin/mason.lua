require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
-- html lsp will install css, json and eslint too
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd", "jdtls", "html" }
})
