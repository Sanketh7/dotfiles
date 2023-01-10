local builtin = require('telescope.builtin')
-- find project files (pf)
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- find project git files (pg)
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
-- project search (ps)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

