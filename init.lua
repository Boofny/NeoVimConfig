-- bootstrap lazy.nvim, LazyVim and your plugins
-- require("config.lazy")

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
    {import = "plugins.autopair"}, --10
    {import = "plugins.telescope"}, --10
    {import = "plugins.catppuccin"}, --11
    {import = "plugins.treesitter"}, --12

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


    -- {
    --   "hrsh7th/nvim-cmp",
    --     event = "InsertEnter", -- ⬅ this ensures lazy loading
    --   dependencies = {
    --     "hrsh7th/cmp-nvim-lsp",
    --     "hrsh7th/cmp-buffer",
    --     "hrsh7th/cmp-path",
    --     "L3MON4D3/LuaSnip",
    --     "saadparwaiz1/cmp_luasnip",
    --   },
    --   config = function()
    --     local cmp = require("cmp")
    --     local luasnip = require("luasnip")
    --     cmp.setup({
    --       snippet = {
    --         expand = function(args)
    --           luasnip.lsp_expand(args.body)
    --         end,
    --       },
    --       mapping = cmp.mapping.preset.insert({
    --         ["<Tab>"] = cmp.mapping.select_next_item(),
    --         ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    --         ["<CR>"] = cmp.mapping.confirm({ select = true }),
    --       }),
    --
    --       sources = cmp.config.sources({
    --         { name = "nvim_lsp" },
    --         { name = "luasnip" }, -- This enables snippet completion
    --         { name = "buffer" },
    --         { name = "path" },
    --       }),
    --     })
    --   end,
    -- },

    -- {
    --   "neovim/nvim-lspconfig",
    --     event = { "BufReadPre", "BufNewFile" }, -- Lazy load when editing
    --   dependencies = {
    --     {
    --     "williamboman/mason.nvim",
    --     event = { "BufReadPre", "BufNewFile" },
    --     },
    --     {
    --     "williamboman/mason-lspconfig.nvim",
    --     event = { "BufReadPre", "BufNewFile" }
    --     }
    --   },
    --   config = function()
    --     require("mason").setup()
    --     require("mason-lspconfig").setup({
    --       ensure_installed = { "html" }, -- Ensure html and js LSPs are installed
    --     })
    --
    --     local lspconfig = require("lspconfig")
    --     lspconfig.html.setup({
    --       root_dir = function(fname)
    --         return lspconfig.util.root_pattern("index.html", ".git")(fname) or vim.loop.cwd()
    --       end,
    --     })
    --   end,
    -- },

    -- {
    --   "nvim-lualine/lualine.nvim",
    --   dependencies = { "nvim-tree/nvim-web-devicons" },
    -- },

    -- {
    --   "lukas-reineke/indent-blankline.nvim",
    --   event = "InsertEnter",
    --   config = function()
    --     require("ibl").setup({
    --       indent = { char = "│" },
    --       scope = { enabled = true, show_start = true, show_end = true },
    --     })
    --   end,
    -- },

    -- {
    --   "nvim-neo-tree/neo-tree.nvim",
    --   branch = "v3.x",
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "nvim-tree/nvim-web-devicons",
    --     "MunifTanjim/nui.nvim",
    --   },
    --   keys = {
    --     {
    --       "<leader>e",
    --       function()
    --         -- Load and setup only when key is pressed
    --         require("neo-tree").setup({
    --             window = {
    --             position = "right",  
    --             },
    --         })
    --         require("neo-tree.command").execute({ toggle = true })
    --       end,
    --       desc = "Toggle Neo-tree",
    --     },
    --   },
    -- },
    -- { "goolord/alpha-nvim" },
    -- { "tpope/vim-surround" },

    -- {
    --   "windwp/nvim-autopairs",
    --   config = function()
    --     require("nvim-autopairs").setup({})
    --   end,
    -- },


    -- {
    --   "nvim-telescope/telescope.nvim",
    --   dependencies = { "nvim-lua/plenary.nvim" },
    --   config = function()
    --     require("telescope").setup()
    --   end,
    -- },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     event = "InsertEnter",
    -- },

    -- {
    --   "nvim-treesitter/nvim-treesitter",
    --     event = { "BufReadPre", "BufNewFile" }, -- Lazy load when editing
    --   build = ":TSUpdate",
    --   config = function()
    --     require("nvim-treesitter.configs").setup({
    --       ensure_installed = { "java", "lua", "cpp", "python", "html", "css", "go" }, -- Add languages you need
    --       highlight = { enable = true }, -- Enable syntax highlighting
    --       indent = { enable = true }, -- Enable smart indentation
    --     })
    --   end,
    -- },
  },

  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- require("tokyonight").setup({
--   transparent= true,
-- })
-- vim.cmd.colorscheme("tokyonight")


require("catppuccin").setup({
  transparent_background= true,
})
vim.cmd.colorscheme("catppuccin")
--
-- local cmp = require("cmp") 
--
-- cmp.setup({
--   sources = {
--     { name = "nvim_lsp" }, -- LSP source
--     {
--       name = "buffer",
--       keyword_length = 1,
--       option = {
--         get_bufnrs = function()
--           -- Include all buffers in completion (including from other tabs)
--           return vim.api.nvim_list_bufs()
--         end,
--       },
--     },
--     { name = "path" }, -- File path completion
--     { name = "luasnip" }, -- Snippet completion
--   },
-- })
--
-- require("lualine").setup({
--   options = {
--     icons_enabled = true,
--     theme = "palenight",
--     component_separators = { left = "", right = "" },
--     section_separators = { left = "", right = "" },
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     always_show_tabline = true,
--     globalstatus = false,
--     refresh = {
--       statusline = 100,
--       tabline = 100,
--       winbar = 100,
--     },
--   },
--   sections = {
--     lualine_a = { {"mode", icon = "  "} },
--     lualine_b = { "branch", "diff", "diagnostics" },
--     lualine_c = { "filename" },
--     lualine_x = {  "encoding", "fileformat", "filetype" },
--     lualine_y = { "progress" },
--     lualine_z = { "location", "lsp_status" },
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = { "filename" },
--     lualine_x = { "location" },
--     lualine_y = {},
--     lualine_z = {},
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {},
-- })
-- require("neo-tree").setup({
--     window = {
--         position = "right",
--     },
--   event_handlers = {
--     {
--       event = "file_opened",
--       handler = function(file_path)
--         local dir = vim.fn.fnamemodify(file_path, ":h")
--         vim.cmd("lcd " .. dir) -- Update working directory
--       end,
--     },
--   },
-- })


-- local cmp = require("cmp")
-- local luasnip = require("luasnip")
--
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ["<Tab>"] = cmp.mapping.confirm({ select = true }),
--     ["<C-Space>"] = cmp.mapping.complete(),
--   }),
--   sources = {
--     { name = "nvim_lsp" },
--     { name = "luasnip" },
--   },
-- })
-- vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", "gM", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>nn", ":lcd %:p:h<CR>", { noremap = true, silent = true })

vim.cmd([[abbrev forj for(int j = 0; j < SIZE; j++){]])
vim.keymap.set("n", "dd", '"_dd', { noremap = true, desc = "delete line without yanking to clipboard" })
