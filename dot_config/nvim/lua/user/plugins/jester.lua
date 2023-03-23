return {
  {
    "David-Kunz/jester",
    event = "BufRead",
    config = function()
      require("jester").setup({ cmd = "npx jest -t '$result' --detectOpenHandles --collectCoverage=false -- $file" })
    end,
  },
}
