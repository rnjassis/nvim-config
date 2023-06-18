local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ts', builtin.find_files, {})
vim.keymap.set('n', '<leader>gs', builtin.git_files, {})
-- Install ripgrep before using the command bellow
vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("grep > ")})
end)
