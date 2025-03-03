-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.editorconfig = true

local opt = vim.opt

-- Don't sync clipboard with system
opt.clipboard = "unnamed"
