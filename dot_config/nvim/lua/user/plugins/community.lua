return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.workflow.hardtime-nvim" },
  { import = "astrocommunity.editing-support.multicursors-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.media.vim-wakatime" },
}
