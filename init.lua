vim.opt.relativenumber = true -- Show relative line numbers for other lines
vim.opt.cursorline = true
vim.opt.clipboard = ""
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

-- For make
vim.api.nvim_set_keymap(
  "n",
  "make",
  ":botright split | term javac % && java %:r<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "go",
  [[:botright split | term sh -c "go run %"<CR>]],
  { noremap = true, silent = true }
)

-- Automatically switch to insert mode when opening a terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*", -- Match any terminal
  callback = function()
    vim.cmd("startinsert") -- Switch to insert mode
  end,
})
vim.cmd("set number")
vim.cmd("set laststatus=2")
vim.cmd("command! Save w")
vim.cmd("command! Nom %s/\r//g")
vim.cmd("command! Noh nohlsearch")

vim.cmd("set encoding=utf-8")
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
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
  spec = {
    -- add your plugins here


    {import = "plugins.gitsigns"}, --1
    -- {import = "plugins.luasnip"}, --2
    -- {import = "plugins.nvimcmp"}, --3
    {import = "plugins.lspconfig"}, --4
    {import = "plugins.lualine"}, --5
    {import = "plugins.neotree"}, --6
    {import = "plugins.blinkline"}, --7
    {import = "plugins.alpha"}, --8
    -- {import = "plugins.autopair"}, --10
    {import = "plugins.telescope"}, --10
    {import = "plugins.catppuccin"}, --11
    {import = "plugins.treesitter"}, --12

    { 'echasnovski/mini.nvim', version = '*' },

{
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
            preset = 'none',

      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<C-e>'] = { 'hide', 'fallback' },
        },

    appearance = {
      nerd_font_variant = 'mono',

    },

    completion = { documentation = { auto_show = true } },
    sources = {
        providers = {
                lsp = {fallbacks={}}
            },
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
},

  },

  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})


require('mini.surround').setup()  -- better surround handling
require('mini.pairs').setup()     -- auto-pairing brackets

require('mini.bufremove').setup()     -- auto-pairing brackets

vim.keymap.set('n', '<leader>bd', function()
  require('mini.bufremove').delete(0, false)
end, { desc = 'Delete buffer' })


require("catppuccin").setup({
  transparent_background= true,
})
vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", "gM", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>t", ":vertical belowright terminal<CR>")
vim.keymap.set("n", "<leader>p", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>m", ":Telescope current_buffer_fuzzy_find<CR>")

vim.api.nvim_set_keymap("n", "<leader>nn", ":lcd %:p:h<CR>", { noremap = true, silent = true })

vim.cmd([[abbrev forj for(int j = 0; j < SIZE; j++){]])
vim.keymap.set("n", "dd", '"_dd', { noremap = true, desc = "delete line without yanking to clipboard" })
