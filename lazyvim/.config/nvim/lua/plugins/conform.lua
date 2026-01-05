return {
  "conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ["javascript"] = { "biome-check" },
      ["javascriptreact"] = { "biome-check" },
      ["typescript"] = { "biome-check" },
      ["typescriptreact"] = { "biome-check" },
      ["json"] = { "biome-check" },
      ["css"] = { "biome-check" },
      ["jsonc"] = { "biome-check" },
      ["vue"] = { "biome-check" },
      ["scss"] = { "biome-check" },
      ["less"] = { "biome-check" },
      ["html"] = { "biome-check" },
    },
  },
}
