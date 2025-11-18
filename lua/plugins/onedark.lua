return {
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup ({
      style = 'darker',
      transparent = false,  -- Show/hide background
    })
    require('onedark').load()
    vim.api.nvim_set_hl(0, "TabLine", { fg = "#C0C9EE", bg = "#1e1e2e" })       -- inactive tabs
    vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#ffffff", bg = "#275378" })    -- active tab
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#1e1e2e" })                   -- background
    -- vim.api.nvim_set_hl(0, "Visual", { bg = "#275378" })

    -- vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = "#78C841", bg = "NONE" })
    vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = "#FFC50F", bg = "NONE" })
    vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = "#ff595e", bg = "NONE" })

    -- vim.api.nvim_set_hl(0, "MiniDiffLineAdd", { fg = "#78C841", bg = "NONE" })
    vim.api.nvim_set_hl(0, "MiniDiffLineChange", { fg = "#FFC50F", bg = "NONE" })
    vim.api.nvim_set_hl(0, "MiniDiffLineDelete", { fg = "#ff595e", bg = "NONE" })

    vim.cmd("highlight CursorLine guibg=#313647")
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FF8040", bold = true })

  end
}
