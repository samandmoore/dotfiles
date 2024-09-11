-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", ";", ":", { desc = "Faster command entry with semicolon" })
map("i", "jj", "<esc>", { desc = "Faster escape to normal mode" })
map("n", "-", "<cmd>Neotree filesystem reveal current<cr>", { desc = "Open Neotree to current file in current window" })

-- create a new file and open in a new tab
-- http://vimcasts.org/e/14
map("n", "<leader>ew", "<cmd>e <C-R>=expand('%:h').'/'<CR>", { desc = "New file in current window" })
map("n", "<leader>es", "<cmd>sp <C-R>=expand('%:h').'/'<CR>", { desc = "New file in horizontal split" })
map("n", "<leader>ev", "<cmd>vsp <C-R>=expand('%:h').'/'<CR>", { desc = "New file in vertical split" })
