vim.cmd [[
  source syntax/nginx.vim
  au BufRead,BufNewFile /etc/nginx/*,/etc/nginx/conf.d/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
]]

return {
  colorscheme = "catppuccin",
  options = {
    opt = {
      colorcolumn = "120",
    },
  },
  lsp = {
    formatting = {
      timeout_ms = 5000, -- adjust the timeout_ms variable for formatting
      disabled = {
        "tsserver",
      },
    },
  },
}
