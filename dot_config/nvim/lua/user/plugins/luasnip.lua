return {
  "L3MON4D3/LuaSnip",
  build = vim.fn.has "win32" == 0
    and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
    or nil,
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
    region_check_events = "CursorMoved",
  },
  config = function(_, opts)
    if opts then require("luasnip").config.setup(opts) end
    vim.tbl_map(
      function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
      { "vscode", "snipmate", "lua" }
    )
    -- friendly-snippets - enable standardized comments snippets
    require("luasnip").filetype_extend("typescript", { "javascript" })
  end,
}
