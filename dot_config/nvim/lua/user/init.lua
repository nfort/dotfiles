local config = {
  lsp = {
    config = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      }
    },
    formatting = {
      format_on_save = false,
      disabled = { "tsserver" },
    }
  }
}

return config
