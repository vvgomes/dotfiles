-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- gb to navigate back from gd
vim.keymap.set("n", "gb", "<C-o>")

-- gB to navigate forward
vim.keymap.set("n", "gB", "<C-i>")

-- move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- lock cursor when removing \n
vim.keymap.set("n", "J", "mzJ`z")

-- preserves clipboard after pasting over hl
vim.keymap.set("x", "<leader>p", '"_dP')

-- live replace
vim.keymap.set("n", "<leader>z", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- at least 8 lines at the bottom
vim.opt.scrolloff = 8
