return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  cmd = 'LspInfo',
  event = {
    'BufReadPre',
    'BufNewFile'
  },
  config = function()
    local nvim_lsp = require('lspconfig')
    local mason_lsp = require("mason-lspconfig")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    local on_attach = function()
      -- TODO: use help pages if no error when called
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
      -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) -- Not useful ? (can use gd instead)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=0})
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {buffer=0})
      vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
      vim.keymap.set("n", "<leader>dl", "<Cmd>Telescope diagnostics<CR>", {buffer=0})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
      vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, {buffer=0})
    end

    -- servers

    mason_lsp.setup({
      ensure_installed = { "lua_ls", "tsserver", "html", "jdtls" }
    })

    mason_lsp.setup_handlers {
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function (server_name) -- default handler (optional)
        nvim_lsp[server_name].setup {
          on_attach = on_attach,
          capabilities = capabilities
        }
      end,

      -- Next, you can provide a dedicated handler for specific servers.
      -- php
      ["intelephense"] = function ()
        nvim_lsp.intelephense.setup({
          on_attach = on_attach,
          settings = {
            intelephense = {
              stubs = {
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "Core",
                "ctype",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "exif",
                "FFI",
                "fileinfo",
                "filter",
                "fpm",
                "ftp",
                "gd",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "meta",
                "mysqli",
                "oci8",
                "odbc",
                "openssl",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_ibm",
                "pdo_mysql",
                "pdo_pgsql",
                "pdo_sqlite",
                "pgsql",
                "Phar",
                "posix",
                "pspell",
                "readline",
                "Reflection",
                "session",
                "shmop",
                "SimpleXML",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "sqlite3",
                "standard",
                "superglobals",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "Zend OPcache",
                "zip",
                "zlib",
                "wordpress"
              }
            }
          }
        })
      end,

      -- lua
      ["lua_ls"] = function ()
        nvim_lsp.lua_ls.setup {
          on_attach = on_attach,
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
            },
          },
        }
      end,
    }

    -- Manual servers setup (not using mason)

    -- godot
    nvim_lsp.gdscript.setup ({
      on_attach = on_attach,
      capabilities = capabilities
    })
  end
}
