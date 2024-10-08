return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        tailwindcss = {},
        cssls = { settings = { css = { lint = { unknownAtRules = "ignore" } } } },
      },
    },
  },
}
