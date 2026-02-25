vim.opt.relativenumber = true -- Show relative line numbers for other lines
vim.opt.number = true -- Show line numbers 
vim.opt.cursorline = true
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.java",
  callback = function()
    local filename = vim.fn.expand("%:t:r") -- current filename without extension
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {
      "public class " .. filename .. " {",
      "",
      "}",
    })
    vim.api.nvim_win_set_cursor(0, { 2, 0 }) -- move cursor inside the class
  end,
})


-- For Java
vim.api.nvim_set_keymap(
  "n",
  "make",
  ":botright split | term javac % && java %:r<CR>",
  { noremap = true, silent = true }
)
-- For golang
vim.api.nvim_set_keymap(
  "n",
  "go",
  [[:botright split | term go run %<CR>]],
  { noremap = true, silent = true }
)
-- For c++
vim.api.nvim_set_keymap(
  "n",
  "cm",
  ":botright split | term g++ % && ./a.out <CR>",
  { noremap = true, silent = true }
)

-- Automatically switch to insert mode when opening a terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*", -- Match any terminal
  callback = function()
    vim.cmd("startinsert") -- Switch to insert mode
  end,
})
-- vim.cmd("set number")
vim.cmd("set laststatus=2")
vim.cmd("command! Save w")
vim.cmd("command! Nom %s/\r//g")
vim.cmd("command! Noh nohlsearch")

vim.cmd("set encoding=utf-8")
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "a:block"
--Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- require("lazy").setup("plugins")
    vim.diagnostic.config({
      virtual_text = true, -- inline error/warning text
      signs = false,        -- signs in the gutter
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
-- Setup lazy.nvim
require("lazy").setup({
  ui = {
    border = "rounded",
  },
  spec = {
    -- add your plugins here

  {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = true,
    opts = {},
    -- keys = {
    --   {
    --     "<leader>0",
    --   }
    -- }
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'mbbill/undotree' },
    -- {import = "plugins.gitsigns"}, --1
    -- {import = "plugins.nvimcmp"}, --3
    {import = "plugins.lspconfig"}, -- uncomment if vim.lsp does not work out
    -- {import = "plugins.gruvBoxColorSh"}, -- uncomment if vim.lsp does not work out
    {import = "plugins.catColor"}, -- uncomment if vim.lsp does not work out
    -- {import = "plugins.onedark"}, -- uncomment if vim.lsp does not work out
    {import = "plugins.lualine"}, --5
    {import = "plugins.neotree"}, --6
    {import = "plugins.blink"}, --6
    {import = "plugins.snacks"}, --6
    -- {import = "plugins.telescope"}, --10
    {import = "plugins.treesitter"}, --12
    { 'echasnovski/mini.nvim', version = '*' },
    --end of lazy here 
  },

  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false},
})
require('mini.surround').setup()  -- better surround handling
require('mini.pairs').setup()     -- auto-pairing brackets
require('mini.diff').setup()     -- auto-pairing brackets
require('mini.ai').setup()     -- auto-pairing brackets

-- vim.api.nvim_set_hl(0, "Visual", { bg = "#275378" })  -- or any color you want
-- vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = "#70e000", bg = "NONE" })
-- vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = "#ffc300", bg = "NONE" })
-- vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = "#ff595e", bg = "NONE" })
--
-- vim.api.nvim_set_hl(0, "MiniDiffLineAdd", { fg = "#70e000", bg = "NONE" })
-- vim.api.nvim_set_hl(0, "MiniDiffLineChange", { fg = "#ffc300", bg = "NONE" })
-- vim.api.nvim_set_hl(0, "MiniDiffLineDelete", { fg = "#ff595e", bg = "NONE" })
--
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f15bb5", bold = true })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", "^", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>k", "gM", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", ":w<CR>") -- save

vim.keymap.set("n", "<leader>t", ":vertical belowright terminal<CR>") -- for quik terminal

vim.keymap.set("n", "<leader>f", ":lua Snacks.picker.files()<CR>") -- file picker
vim.keymap.set("n", "<leader>p", ":lua Snacks.picker.buffers()<CR>") -- picker for open buffers

vim.keymap.set("n", "<leader>m", ":w | bd<CR>") -- closing buffer

vim.keymap.set('n', '<leader><leader>', vim.cmd.UndotreeToggle) -- undotree
vim.keymap.set("n", "<leader>gg", ":lua Snacks.lazygit()<CR>") -- lazygit

vim.api.nvim_set_keymap("n", "<leader>nn", ":lcd %:p:h<CR>", { noremap = true, silent = true }) --NOT USELESS
vim.api.nvim_set_keymap("n", "<leader>0", ":RenderMarkdown toggle <CR>", { noremap = true, silent = true }) --NOT USELESS

vim.keymap.set("n", "dd", '"_dd', { noremap = true, desc = "delete line without yanking to clipboard" })
vim.keymap.set(
  "n",
  "<leader>ge",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.api.nvim_create_user_command(
    'NoteMode',
    function()
        print("Take Notes!")
        vim.cmd("set nonumber")
        vim.cmd("set norelativenumber")
        vim.cmd("Lazy load render-markdown.nvim")
    end,
    {
        desc = 'Load render-markdown and get rid of side numbers for note taking'
    }
)
-- :highlight BufferCurrent guifg=#ffffff guibg=#124170 

-- not show the tabline when starting
vim.o.showtabline = 1

-- use custom tabline function
vim.o.tabline = "%!v:lua.MyTabLine()"

function _G.MyTabLine()
  local s = ""
  for i = 1, vim.fn.tabpagenr('$') do
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = vim.fn.tabpagebuflist(i)[winnr]
    local name = vim.fn.bufname(bufnr)
    local label = vim.fn.fnamemodify(name, ":t") -- only filename (no path)

    if i == vim.fn.tabpagenr() then
      s = s .. "%#TabLineSel# " .. label .. " "
    else
      s = s .. "%#TabLine# " .. label .. " "
    end
  end
  return s .. "%#TabLineFill#"
end

vim.api.nvim_set_hl(0, "Visual", { bg = "#275378" })

vim.api.nvim_set_hl(0, "TabLine", { fg = "#C0C9EE", bg = "#1e1e2e" })       -- inactive tabs
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#ffffff", bg = "#275378" })    -- active tab
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#1e1e1e" })                   -- background

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f15bb5", bold = true })

