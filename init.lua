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
require("settings.colorizer")
require("settings.harpoon")
require("settings.general")
require("settings.mappings")

