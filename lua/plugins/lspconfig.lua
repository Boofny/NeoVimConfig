-- return{
--       "neovim/nvim-lspconfig",
--         event =  {"BufReadPre", "InsertEnter"},-- Lazy load when editing
--       dependencies = {
--         {
--         "williamboman/mason.nvim",
--         -- event = { "BufReadPre", "InsertEnter" },
--             lazy = true,
--         },
--         {
--         "williamboman/mason-lspconfig.nvim",
--         -- event = { "BufReadPre", "InsertEnter" }
--             lazy = true,
--         }
--       },
--       config = function()
--         require("mason").setup()
--         require("mason-lspconfig").setup({
--           ensure_installed = { "html" }, -- Ensure html and js LSPs are installed
--         })
--
--         local lspconfig = require("lspconfig")
--         lspconfig.html.setup({
--           root_dir = function(fname)
--             return lspconfig.util.root_pattern("index.html", ".git")(fname) or vim.loop.cwd()
--           end,
--         })
--       end,
--     }


return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "InsertEnter" },
  dependencies = {
    { "williamboman/mason.nvim", lazy = true },
    { "williamboman/mason-lspconfig.nvim", lazy = true },
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require("mason").setup()

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    require("mason-lspconfig").setup({
      automatic_installation = true,
    })

    -- lspconfig.tsserver.setup({ --originally this was tsserver but thats old i think so ts_ls works
    lspconfig.ts_ls.setup({
      capabilities = require("blink.cmp").get_lsp_capabilities(),
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    })
  end,
}

