vim.cmd [[
  source /home/nfort/.config/nvim/lua/user/syntax/nginx.vim
  " au BufRead,BufNewFile /etc/nginx/*,/etc/nginx/conf.d/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
  au BufRead,BufNewFile *.nginx set ft=nginx
  au BufRead,BufNewFile */etc/nginx/* set ft=nginx
  au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
  au BufRead,BufNewFile nginx.conf set ft=nginx
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
