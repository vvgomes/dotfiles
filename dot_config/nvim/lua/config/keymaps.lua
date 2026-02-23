-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- gb to navigate back from gd
vim.keymap.set("n", "gb", "<C-o>")

-- gB to navigate forward
vim.keymap.set("n", "gB", "<C-i>")
