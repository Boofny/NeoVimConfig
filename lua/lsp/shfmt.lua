-- Note: shfmt is a formatter, not an LSP server
-- You typically use it with null-ls or conform.nvim
-- If you want bash LSP, use bash-language-server instead:

vim.lsp.config["bashls"] = {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
  root_markers = { ".git" },
}

vim.lsp.enable("bashls")
