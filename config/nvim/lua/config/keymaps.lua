-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", ";", ":", { desc = "Faster command entry with semicolon" })
map("i", "jj", "<esc>", { desc = "Faster escape to normal mode" })
map("n", "-", "<cmd>Neotree filesystem reveal current<cr>", { desc = "Open Neotree to current file in current window" })
