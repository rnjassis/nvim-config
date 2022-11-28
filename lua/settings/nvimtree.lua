vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<C-o>", "<Cmd>NvimTreeToggle<CR>", opts)
