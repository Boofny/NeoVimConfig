-- Highlight groups
vim.api.nvim_set_hl(0, "TodoHighlight", {
  bg = "#cba6f7",
  fg = "#1e1e2e",
  bold = true,
})

vim.api.nvim_set_hl(0, "FixHighlight", {
  bg = "#fffba8",
  fg = "#1e1e2e",
  bold = true,
})

vim.api.nvim_set_hl(0, "WarnHighlight", {
  bg = "#f38ba8",
  fg = "#1e1e2e",
  bold = true,
})

vim.api.nvim_set_hl(0, "NoteHighlight", {
  bg = "#94e2d5",
  fg = "#1e1e2e",
  bold = true,
})

vim.api.nvim_set_hl(0, "BugHighlight", {
  bg = "#ffd193",
  fg = "#1e1e2e",
  bold = true,
})

-- Apply matches to every opened buffer/window
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
  callback = function()
    vim.fn.matchadd("TodoHighlight", [[\vTODO:.*]])
    vim.fn.matchadd("FixHighlight",  [[\vFIX:.*]])
    vim.fn.matchadd("WarnHighlight",  [[\vWARN:.*]])
    vim.fn.matchadd("NoteHighlight", [[\vNOTE:.*]])
    vim.fn.matchadd("BugHighlight", [[\vBUG:.*]])
  end,
})
