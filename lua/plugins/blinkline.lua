return{
      "lukas-reineke/indent-blankline.nvim",
      event = "InsertEnter",
      config = function()
        require("ibl").setup({
          indent = { char = "│" },
          scope = { enabled = true, show_start = true, show_end = true },
        })
      end,
    }
