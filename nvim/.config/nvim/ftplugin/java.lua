local config = {
  cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

local bundles = {
  os.getenv("HOME")
    .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
}

vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(os.getenv("HOME") .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1),
    "\n"
  )
)

config["init_options"] = {
  bundles = bundles,
}

config["on_attach"] = function(_, _)
  require('jdtls.dap').setup_dap_main_class_configs()

-- mapping
-- lsp
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) -- Not useful ? (can use gd instead)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
  vim.keymap.set("n", "<leader>dl", "<Cmd>Telescope diagnostics<CR>", {buffer=0})
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {buffer=0})
  -- nvim-dap
  vim.keymap.set("n", "<leader>tc", "<Cmd>lua require'jdtls'.test_class()<CR>", {buffer=0})
  vim.keymap.set("n", "<leader>tnm", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", {buffer=0})

  vim.api.nvim_buf_create_user_command(
  0,
  'JdtNearestMethod',
  function(_)
    require("jdtls").test_nearest_method()
  end,
  {}
  )

  vim.api.nvim_buf_create_user_command(
  0,
  'JdtTestClass',
  function(_)
    require("jdtls").test_class()
  end,
  {}
  )
end
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

