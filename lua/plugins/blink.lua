
return{
  'saghen/blink.cmp',
  event = {"BufReadPre", "BufNewFile"}, --see linux nvim events 
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
            preset = 'default',

      -- ['<S-Tab>'] = { 'select_prev', 'fallback' },
      -- ['<Tab>'] = { 'select_next', 'fallback' },
      -- ['<C-n>'] = { 'accept', 'fallback' },
      -- ['<C-e>'] = { 'hide_documentation', 'fallback' },
      -- ['<C-h>'] = { 'show_documentation', 'fallback' },
        },

    appearance = {
      nerd_font_variant = 'mono',

    },
    completion = {
      menu = { border = 'rounded' },
      documentation = { window = { border = 'rounded' }, auto_show = true},
    },
    signature = { window = { border = 'single' } },
    -- completion = { documentation = { auto_show = true} },
    sources = {
        providers = {
                lsp = {fallbacks={}}
            },
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
