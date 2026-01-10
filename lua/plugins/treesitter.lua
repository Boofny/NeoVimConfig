    --
    -- return{
    --   "nvim-treesitter/nvim-treesitter",
    --     event = { "InsertEnter", "InsertEnter" }, -- Lazy load when editing
    --   build = ":TSUpdate",
    --   config = function()
    --     require("nvim-treesitter.configs").setup({
    --       ensure_installed = { "java", "lua", "cpp", "python", "html", "css", "go" }, -- Add languages you need
    --       highlight = { enable = true }, -- Enable syntax highlighting
    --       indent = { enable = true }, -- Enable smart indentation
    --     })
    --   end,
    -- }
    --
    --


return{
      "nvim-treesitter/nvim-treesitter",
      event = { "BufReadPost", "BufNewFile" },
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "java", "lua", "cpp", "python", "html", "css", "go" }, -- Add languages you need
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false, -- avoids double-highlighting
          },
          indent = { enable = false}, -- Enable smart indentation
        })
      end,
    }
