return {
  "neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        always_show_by_pattern = {
          ".env*",
        },
        hide_by_name = {
          ".git",
          ".DS_Store",
        },
      },
    },
  },
}
