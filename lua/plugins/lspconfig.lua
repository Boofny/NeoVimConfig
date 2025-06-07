return{
      "neovim/nvim-lspconfig",
        event = { "InsertEnter", "InsertEnter" }, -- Lazy load when editing
      dependencies = {
        {
        "williamboman/mason.nvim",
        event = { "InsertEnter", "InsertEnter" },
        },
        {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "InsertEnter" }
        }
      },
      config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
          ensure_installed = { "html" }, -- Ensure html and js LSPs are installed
        })

        local lspconfig = require("lspconfig")
        lspconfig.html.setup({
          root_dir = function(fname)
            return lspconfig.util.root_pattern("index.html", ".git")(fname) or vim.loop.cwd()
          end,
        })
      end,
    }
