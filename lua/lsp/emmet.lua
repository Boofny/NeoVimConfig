vim.lsp.config["emmet_language_server"] = {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "svelte" }, --removed css
  root_markers = { "package.json", ".git" },
}

vim.lsp.enable("emmet_language_server")
