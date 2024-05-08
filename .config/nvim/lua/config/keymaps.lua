-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Move to window using the <ctrl> hjkl keys
-- map("n", "<C-k>", "<C-w>y", { desc = "Go to Left Window", remap = true })
-- map("n", "<C-j>", "<C-w>u", { desc = "Go to Lower Window", remap = true })
-- map("n", "<C-h>", "<C-w>i", { desc = "Go to Upper Window", remap = true })
-- map("n", "<C-l>", "<C-w>o", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keysmap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
-- map("n", "<C-w>k", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
-- -- map("n", "<C-w>j", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
-- -- map("n", "<C-w>h", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
-- map("n", "<C-w>l", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
