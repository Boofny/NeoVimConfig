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

    require("mason-lspconfig").setup({
      -- Optional: automatically install servers you open a buffer for
      automatic_installation = true,
    })
    -- might be a good idea to remove this 

    local lspconfig = require("lspconfig")
    -- Automatically setup all installed servers
    -- require("mason-lspconfig").setup_handlers({
    --   function(server_name)
    --     lspconfig[server_name].setup({
    --       capabilities = capabilities,
    --     })
      -- end,
    -- })
  end,
}

