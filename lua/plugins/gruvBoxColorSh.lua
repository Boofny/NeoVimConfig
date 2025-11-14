return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    terminal_colors = true,
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    inverse = true,
    contrast = "", -- "hard", "soft", or ""
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
  },
  config = function(_, opts)
    local gruvbox = require("gruvbox")
    gruvbox.setup(opts)
    vim.cmd.colorscheme("gruvbox")

    -- highlight overrides go below
    -- vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#ffffff", bg = "#644A07" })   -- active tab

    vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#ffffff", bg = "#644A07" })   -- active tab
    vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = "#78C841", bg = "NONE" })
    vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = "#FFC50F", bg = "NONE" })
    vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = "#ff595e", bg = "NONE" })

    vim.api.nvim_set_hl(0, "MiniDiffLineAdd", { fg = "#78C841", bg = "NONE" })
    vim.api.nvim_set_hl(0, "MiniDiffLineChange", { fg = "#FFC50F", bg = "NONE" })
    vim.api.nvim_set_hl(0, "MiniDiffLineDelete", { fg = "#ff595e", bg = "NONE" })

    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FF8040", bold = true })
  end,
}
