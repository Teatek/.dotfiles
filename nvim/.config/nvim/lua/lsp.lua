local capabilities = require('blink.cmp').get_lsp_capabilities()

-- global
vim.lsp.config('*', {
  capabilities = capabilities,
  root_markers = { '.git' },
})


-- godot
local port = os.getenv 'GDScript_Port' or '6005'
local cmd = vim.lsp.rpc.connect('127.0.0.1', tonumber(port))

vim.lsp.config.gdscript = {
  cmd = cmd,
  filetypes = { 'gd', 'gdscript', 'gdscript3' },
  root_markers = { 'project.godot', '.git' },
}

-- lua
vim.lsp.config.lua_ls = {
  -- Command and arguments to start the server.
  cmd = { 'lua-language-server' },
  -- Filetypes to automatically attach to.
  filetypes = { 'lua' },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      },
      telemetry = {
        enable = false,
      }
    }
  }
}

vim.lsp.config.jedi_language_server = {
  cmd = { "jedi-language-server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" }
}

-- Attach lsp when it detect a lsp at the file
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    -- hover
    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover({ border = "single" })
    end, { buffer = 0 })

    -- Better go to definition
    if client.name ~= 'gdscript' then
      vim.keymap.set('n', 'gd', "<C-]>", { buffer = 0 })
    else
      vim.keymap.set('n', '<leader>D', ':Telescope gdscript-extended-lsp class<CR>')
      vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({search_file = '*.gd'})<CR>")
    end

    -- Enable auto-completion (omnifunc only). Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      -- vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true, })
    end

    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, async = true })
        end,
      })
    end
  end,
})

-- Enable the following servers
vim.lsp.enable({ 'lua_ls', 'gdscript', 'jedi_language_server' })


-- User command
vim.api.nvim_create_user_command('LspStop',
  function(args)
    local name = args.fargs[1]
    for _, client in ipairs(vim.lsp.get_clients({ name = name })) do
      client:stop()
    end
  end,
  {
    nargs = "?",
    complete = function()
      return vim.tbl_map(function(c) return c.name end, vim.lsp.get_clients())
    end
  }
)

vim.api.nvim_create_user_command('LspLog', function()
  vim.cmd(string.format('tabnew %s', vim.lsp.get_log_path()))
end, {
  desc = 'Opens the Nvim LSP client log.',
})

vim.api.nvim_create_user_command("LspRestart",
  function(args)
    local name = args.fargs[1]
    for _, client in ipairs(vim.lsp.get_clients({ name = name })) do
      local bufs = vim.lsp.get_buffers_by_client_id(client.id)
      client:stop()
      vim.wait(30000, function()
        return vim.lsp.get_client_by_id(client.id) == nil
      end)
      local client_id = vim.lsp.start(client.config, { attach = false })
      if client_id then
        for _, buf in ipairs(bufs) do
          vim.lsp.buf_attach_client(buf, client_id)
        end
      end
    end
  end,
  {
    nargs = "?",
    complete = function()
      return vim.tbl_map(function(c) return c.name end, vim.lsp.get_clients())
    end
  }
)
