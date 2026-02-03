return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          -- Lazy.nvim
          LazyNormal = { bg = "none" },
          LazyBorder = { bg = "none" },
          -- Snacks picker (or other plugins using floats)
          SnacksPickerNormal = { bg = "none" },
          SnacksPickerBorder = { bg = "none" },
        }
      end,
    })

    vim.cmd.colorscheme("catppuccin")

    -- highlight overrides below
    vim.api.nvim_set_hl(0, "Visual", { bg = "#275378" })

    vim.api.nvim_set_hl(0, "TabLine", { fg = "#C0C9EE", bg = "#1e1e2e" })       -- inactive tabs
    vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#ffffff", bg = "#275378" })    -- active tab
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#1e1e1e" })                   -- background
    -- vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#1e1e2e" })                   -- background

    -- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6c757d" })
    -- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6c757d" })
    --
    -- vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = "#70e000", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = "#ffc300", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = "#ff595e", bg = "NONE" })
    --
    -- vim.api.nvim_set_hl(0, "MiniDiffLineAdd", { fg = "#70e000", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "MiniDiffLineChange", { fg = "#ffc300", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "MiniDiffLineDelete", { fg = "#ff595e", bg = "NONE" })
    --
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f15bb5", bold = true })
    -- vim.cmd("highlight CursorLine guibg=#3d3442")
    -- vim.cmd("highlight CursorLine guibg=#303b45") --ondark
  end,
}
