-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--vim.cmd("language en_US")
vim.cmd("let g:OmniSharp_popup = 1")

-- set for linux
--if not (vim.fn.has("macunix")) then
vim.opt.clipboard = "unnamedplus"
--end
vim.opt.relativenumber = false
