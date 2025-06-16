return{
      "nvim-telescope/telescope.nvim",
        keys = {
        {
        "<leader>f",
     function()
            local cwd = vim.fn.getcwd()

            -- If Neovim was opened with a directory argument, use that as cwd:
            local arg = vim.fn.argv()[1]
            if arg and vim.fn.isdirectory(arg) == 1 then
              cwd = arg
            end

            require("telescope.builtin").find_files({ cwd = cwd })
          end,
          -- desc = "Find files in current or opened directory",
        },
    },
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("telescope").setup()
      end,
    }


