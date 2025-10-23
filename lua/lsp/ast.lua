vim.lsp.config["ast_grep"] = {
  cmd = { "ast_grep", "lsp" }, --changed ast-grep to ast_grep if an issue its prob this
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "python", "rust", "go" },
  root_markers = { ".git" },
}

vim.lsp.enable("ast_grep")
