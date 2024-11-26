local builtin = require('telescope.builtin')

-- Find Files
vim.keymap.set('n', '<leader>f', builtin.find_files, {})

-- Find Buffer
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

-- Find Git Files
vim.keymap.set('n', '<leader>g', builtin.git_files, {})

-- Find word with RG
vim.keymap.set('n', '<leader>r', builtin.live_grep, {})

-- Find registers
vim.keymap.set('n', '<leader>t', builtin.registers, {})
--
-- Disable folding in Telescope's result window.
vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] })
