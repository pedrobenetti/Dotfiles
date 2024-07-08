require("mestrinari")

--vim.opt.guicursor = "n-v-c-i:block"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.filetype = "on"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Change tab to 4 spaces in certain files
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = { "*.cs" },
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
  end
})
--
-- Change text width to 80 chars in .txt and .MD files
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = { "*.txt", "*.md", "*.MD" },
  callback = function()
    vim.opt.textwidth = 80;
  end
})

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.smartindent = true
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.syntax = "on"
vim.opt.cursorline = true
vim.opt.laststatus = 0
vim.opt.foldmethod= "marker"

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
