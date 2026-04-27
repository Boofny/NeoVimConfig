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

-- This is mainly used for highlighting code and some indentation
-- some languages pre installed but more can be installed later 
-- return{
--   "nvim-treesitter/nvim-treesitter",
--   -- event = { "BufReadPost", "BufNewFile" },
--   lazy = false,
--   build = ":TSUpdate",
--   config = function()
--     require("nvim-treesitter").setup({
--       ensure_installed = { "java", "lua", "cpp", "python", "html", "css", "go" }, -- Add languages you need
--       highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = false, -- avoids double-highlighting
--       },
--       indent = { enable = false}, -- Enable smart indentation
--     })
--   end,
-- }

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "java", "lua", "cpp", "python", "html", "css", "go",
        "typescript", "tsx", "javascript", -- add these
      },
    })

    -- New main-branch API: enable highlighting via autocommand
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
