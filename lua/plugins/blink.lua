
return{
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
      ['<C-n>'] = { 'accept', 'fallback' },
      ['<C-e>'] = { 'hide_documentation', 'fallback' },
      ['<C-h>'] = { 'show_documentation', 'fallback' },
        },

    appearance = {
      nerd_font_variant = 'mono',

    },

    completion = { documentation = { auto_show = false} },
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
