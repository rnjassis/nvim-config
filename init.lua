-- reference https://github.com/nanotee/nvim-lua-guide/
-- Setting leader here so the other configs can recognize the key
vim.g.mapleader = ' ' 

require("plugins")
require("settings.telescope")
--require("settings.gruvbox")
require("settings.catppuccin")
require("settings.barbar")
require("settings.nvimtree")
require("settings.blankline")
require("settings.lualine")

--------------- GENERAL CONFIGS ---------------

vim.opt.relativenumber = true
vim.opt.number = true

