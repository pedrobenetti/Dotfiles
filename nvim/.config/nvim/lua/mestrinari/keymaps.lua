-- Leader key
vim.g.mapleader = " "

-- File explorer
vim.keymap.set('n', "<leader>e", vim.cmd.Exp)

-- Neogit
vim.keymap.set('n', "<C-z>", vim.cmd.Neogit)

-- Mason
vim.keymap.set('n', "<leader>m", vim.cmd.Mason)

-- Move lines in Visual Mode
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Make files executable
vim.api.nvim_set_keymap("n", "<leader>q", ":!chmod +x %<CR>", {})

-- Execute files inside Neovim
vim.api.nvim_set_keymap("n", "<leader>w", ":!%:p %<CR>", {})

-- Change terminal escape Key
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><CR>')
