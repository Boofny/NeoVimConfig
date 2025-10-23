vim.lsp.config["clangd"] = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "h" },
  root_markers = { { "" }, ".git" },
  settings = {
    clangd = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}

vim.lsp.enable("clangd")  -- enable here
