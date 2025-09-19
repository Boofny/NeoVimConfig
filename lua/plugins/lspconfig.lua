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


-- return {
--   "neovim/nvim-lspconfig",
--   event = { "BufReadPre", "BufNewFile "}, --get rid of burNewFile
--   dependencies = {
--     { "williamboman/mason.nvim", lazy = true },
--     { "williamboman/mason-lspconfig.nvim", lazy = true },
--   },
--   config = function()
--     local capabilities = require("blink.cmp").get_lsp_capabilities()
--
--     require("mason").setup()
--
--     local lspconfig = require("lspconfig")
--     local mason_lspconfig = require("mason-lspconfig")
--
--     require("mason-lspconfig").setup({
--       automatic_installation = true,
--     })
--
--     -- lspconfig.tsserver.setup({ --originally this was tsserver but thats old i think so ts_ls works
--     lspconfig.ts_ls.setup({
--       capabilities = require("blink.cmp").get_lsp_capabilities(),
--       filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
--     })
--   end,
-- }



return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" }, -- or "BufEnter" if you prefer
  dependencies = {
    { "williamboman/mason.nvim", lazy = true },
    { "williamboman/mason-lspconfig.nvim", lazy = true },
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require("mason").setup()

    require("mason-lspconfig").setup({
      automatic_installation = false,
    })

    -- ✅ configure ts_ls
    vim.lsp.config["ts_ls"] = {
      capabilities = capabilities,
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    }

    -- ✅ start ts_ls when these filetypes are opened
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      callback = function()
        vim.lsp.start(vim.lsp.config["ts_ls"])
      end,
    })

    -- ✅ optional: auto-setup ALL installed servers
    -- require("mason-lspconfig").setup_handlers({
    --   function(server_name)
    --     vim.lsp.config[server_name] = {
    --       capabilities = capabilities,
    --     }
    --     vim.api.nvim_create_autocmd("FileType", {
    --       pattern = "*",
    --       callback = function()
    --         vim.lsp.start(vim.lsp.config[server_name])
    --       end,
    --     })
    --   end,
    -- })
  end,
}
