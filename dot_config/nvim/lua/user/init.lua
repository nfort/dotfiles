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
      disabled = { "tsserver" },
    }
  }
}

return config
