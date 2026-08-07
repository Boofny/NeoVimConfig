return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" }, -- or "BufEnter" if you prefer
  dependencies = {
    { "williamboman/mason.nvim", lazy = true },
    { "williamboman/mason-lspconfig.nvim", lazy = true },
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require("mason").setup({
      ui = {
        border = "rounded",
      },
    })

    require("mason-lspconfig").setup({
      automatic_installation = false,
    })

    -- can config the lsp servers individually but for now just ts and golang
    vim.lsp.config["gopls"] = {
      cmd = { vim.fn.expand("~/go/bin/gopls") },
      -- cmd = {"gopls"}, -- old line for when going back to using mason for the lsp when updates dont break my stuff
      capabilities = capabilities,
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

    -- Gets rid of the vim warning from the lsp server 
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    vim.lsp.enable("lua_ls")

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      filetypes = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
      },
    })

    vim.lsp.enable("ts_ls")
  end,
}
