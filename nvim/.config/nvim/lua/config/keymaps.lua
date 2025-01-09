-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set_keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- jk to escape
set_keymap("i", "jk", "<Esc>", opts)

-- Tabs
set_keymap("n", "te", ":tabedit", opts)
set_keymap("n", "<tab>", ":tabnext<Return>", opts)
set_keymap("n", "<s-tab>", ":tabprev<Return>", opts)

-- Rename using F2
vim.keymap.set("n", "<F2>", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Package info keymaps
set_keymap(
  "n",
  "<leader>cpt",
  "<cmd>lua require('package-info').toggle()<cr>",
  { silent = true, noremap = true, desc = "Toggle" }
)
set_keymap(
  "n",
  "<leader>cpd",
  "<cmd>lua require('package-info').delete()<cr>",
  { silent = true, noremap = true, desc = "Delete package" }
)
set_keymap(
  "n",
  "<leader>cpu",
  "<cmd>lua require('package-info').update()<cr>",
  { silent = true, noremap = true, desc = "Update package" }
)
set_keymap(
  "n",
  "<leader>cpi",
  "<cmd>lua require('package-info').install()<cr>",
  { silent = true, noremap = true, desc = "Install package" }
)
set_keymap(
  "n",
  "<leader>cpc",
  "<cmd>lua require('package-info').change_version()<cr>",
  { silent = true, noremap = true, desc = "Change package version" }
)
