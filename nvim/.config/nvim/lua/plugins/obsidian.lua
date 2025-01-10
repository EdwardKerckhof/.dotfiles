return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Notes",
        path = "/Users/edward/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/Content",
      },
    },
  },
}
