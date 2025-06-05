
    return{
      "hrsh7th/nvim-cmp",
        event = "InsertEnter", -- ⬅ this ensures lazy loading
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          }),

          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" }, -- This enables snippet completion
            { name = "buffer" },
            { name = "path" },

    {
      name = "buffer",
      keyword_length = 1,
      option = {
        get_bufnrs = function()
          -- Include all buffers in completion (including from other tabs)
          return vim.api.nvim_list_bufs()
        end,
      },
    },
          }),
        })
      end,
    }
