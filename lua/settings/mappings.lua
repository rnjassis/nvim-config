--------------- Mappings ------------------
 
-- shortcut to this config file
map('<leader>cfg', ':e ~/.config/nvim/init.lua <CR>')
-- yank search: first yank, then use this command
map('<leader>ys', '/<C-S-r>"<CR>')
-- avoid losing the top register to the replaced word
vim.keymap.set("x", "<leader>v", "\"_dP")
-- notes folder
map('<leader>nts', ':e ~/Nextcloud/Notes <CR>')
-- vert split
map('<leader>vs', ':vert split<CR>')
-- restart LSP
map('<leader>lsp', ':LspRestart<CR>')
-- quit, save, write and quit
map('<leader>qq', ':q!<CR>')
map('<leader>ww', ':w<CR>')
map('<leader>wq', ':wq<CR>')

-- switch between tmux panels
map('<C-h>', '<cmd> TmuxNavigateLeft<CR>')
map('<C-l>', '<cmd> TmuxNavigateRight<CR>')
map('<C-k>', '<cmd> TmuxNavigateUp<CR>')
map('<C-j>', '<cmd> TmuxNavigateDown<CR>')


vim.keymap.set("n", "<leader>fj", function() require("flash").jump() end)
