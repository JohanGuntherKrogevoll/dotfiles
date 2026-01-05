return {
  {

    "AlexBeauchemin/biome-lint.nvim",
    config = function()
      require("biome-lint").setup({
        severity = "error", -- "error", "warn", "info". Default is "error"
      })
    end,
  },
  {
    "dmmulroy/tsc.nvim",
    config = function()
      require("tsc").setup({
        use_trouble_qflist = true,
        use_diagnostics = true,
      })
    end,
  },
}
