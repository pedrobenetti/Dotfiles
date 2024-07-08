require("mestrinari.keymaps")
require("mestrinari.packages")

vim.opt.termguicolors = true
require'colorizer'.setup()
require'Comment'.setup()

vim.api.nvim_set_hl(0, "Normal", {bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none" })
vim.cmd.colorscheme('habamax')
--vim.cmd.colorscheme('tokyonight-night')
--vim.cmd.colorscheme('torte')
--vim.cmd.colorscheme('retrobox')
--vim.cmd.colorscheme('zaibatsu')
--vim.cmd.colorscheme('slate')
