vim.cmd [[
  runtime lua/user/syntax/nginx.vim
  au BufRead,BufNewFile *.nginx set ft=nginx
  au BufRead,BufNewFile */etc/nginx/* set ft=nginx
  au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
  au BufRead,BufNewFile nginx.conf set ft=nginx
  au BufRead,BufNewFile angie.conf set ft=nginx
  au BufRead,BufNewFile *__angie-confs/*.conf set ft=nginx
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
