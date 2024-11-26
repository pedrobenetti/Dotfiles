-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { -- Mason
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim'
    },
    { -- LSP Support
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      lazy = true,
      config = false,
    },
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
      }
    },
    { -- Autocompletion
      'hrsh7th/nvim-cmp',
      dependencies = {
        { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'rafamadriz/friendly-snippets' }
      },
    },
    { -- Treesitter
      'nvim-treesitter/nvim-treesitter',
    },
    {
      'nvim-java/nvim-java'
    },
    { -- Telescope
      'nvim-telescope/telescope.nvim',
      tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { -- Undotree
      "jiaoshijie/undotree",
      dependencies = "nvim-lua/plenary.nvim",
      config = true,
      keys = { -- load the plugin only when using it's keybinding:
        { "<F5>", "<cmd>lua require('undotree').toggle()<cr>" },
      },
    },
    { -- Neogit
      "NeogitOrg/neogit",
      dependencies = {
        "sindrets/diffview.nvim", -- optional - Diff integration
      },
      config = true
    },
    { -- Autopairs
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {} -- this is equalent to setup({}) function
    },
    {           -- Colorizer
      'norcalli/nvim-colorizer.lua',
    },
    { -- Comment
      'numToStr/Comment.nvim'
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
