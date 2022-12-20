-- reference https://github.com/nanotee/nvim-lua-guide/
-- Setting leader here so the other configs can recognize the key
vim.g.mapleader = ' ' 
-- functions for mapping
function map(mapping, cmd)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap('', mapping, cmd, opts )
end

require("plugins")
require("settings.telescope")
--require("settings.gruvbox")
require("settings.catppuccin")
require("settings.barbar")
require("settings.nvimtree")
require("settings.blankline")
require("settings.lualine")
require("settings.lsp_support")

--------------- GENERAL CONFIGS ---------------

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- shortcut to this config file
map('<leader>cfg', ':e ~/.config/nvim/init.lua <CR>')
-- yank search: first yank, then use this command
map('<leader>ys', '/<C-S-r>"<CR>')
