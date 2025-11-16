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

    vim.lsp.config["ts_ls"] = {
      capabilities = capabilities,
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      root_dir = require("lspconfig.util").root_pattern(
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
        ".git"
      ),
    }
    -- old pattern
    -- vim.lsp.config["ts_ls"] = {
    --   capabilities = capabilities,
    --   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    -- }

    -- can config the lsp servers individually but for now just ts and golang
    vim.lsp.config["gopls"] = {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork" },
      root_markers = { "go.work", "go.mod", ".git" },
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      callback = function()
        vim.lsp.start(vim.lsp.config["ts_ls"])
      end,
    })
  end,
}
