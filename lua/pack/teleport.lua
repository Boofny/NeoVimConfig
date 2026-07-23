print("teleport config loaded")
vim.pack.add({
  {
    src = vim.fn.expand("~/NvimProjects/teleport.nvim"), name = "teleport",
  },
})

vim.cmd("packadd teleport")

local tele = require("teleport")
local nav = require("teleport.navigate")
local ui = require("teleport.ui")

vim.keymap.set("n", "<C-e>", ui.list_mark_files)
vim.keymap.set("n", "<leader>t", ui.list_mark_files)
vim.keymap.set("n", "<C-a>", tele.addMark)
vim.keymap.set("n", "<leader>a", tele.addMark)

vim.keymap.set("n", "<leader>1", function() nav.navMark(1) end)
vim.keymap.set("n", "<leader>2", function() nav.navMark(2) end)
vim.keymap.set("n", "<leader>3", function() nav.navMark(3) end)
vim.keymap.set("n", "<leader>4", function() nav.navMark(4) end)

vim.keymap.set("n", "<leader>k1", function() tele.addMarkOverride(1) end)
vim.keymap.set("n", "<leader>k2", function() tele.addMarkOverride(2) end)
vim.keymap.set("n", "<leader>k3", function() tele.addMarkOverride(3) end)
vim.keymap.set("n", "<leader>k4", function() tele.addMarkOverride(4) end)
