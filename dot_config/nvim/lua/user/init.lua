return {
  options = {
    opt = {
      colorcolumn = "120",
    },
  },
  lsp = {
    formatting = {
      timeout_ms = 5000, -- adjust the timeout_ms variable for formatting
    },
    disabled = {
      "tsserver",
    },
  },
}
