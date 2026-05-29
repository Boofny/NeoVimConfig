
vim.cmd("packadd nvim.undotree")

vim.keymap.set("n", "<leader><leader>", function()
  require("undotree").open()
end, {
  desc = "Open UndoTree",
})
