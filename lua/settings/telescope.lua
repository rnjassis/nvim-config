local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gg', builtin.git_files, {})
-- Install ripgrep before using the command bellow
vim.keymap.set('n', '<leader>ss', function()
        builtin.grep_string({ search = vim.fn.input("grep > ")})
end)
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
