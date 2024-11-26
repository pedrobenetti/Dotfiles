-- LSP Config - Default {{{
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)
--}}}

-- Specific Languages config {{{
--Java
require('java').setup()
require('lspconfig').jdtls.setup({})

--Tailwindcss
require 'lspconfig'.tailwindcss.setup {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  root_dir = require('lspconfig.util').root_pattern("tailwind.config.js", "package.json"),
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      includeLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
        templ = "html"
      },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning"
      },
      validate = true
    }
  }
}

--}}}

-- Mason Config {{{
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "clangd", "lua_ls", "html", "cssls" },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})
-- }}}

-- CMP Config {{{
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  -- (Optional) Show source name in completion menu
  formatting = cmp_format,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    {
      name = 'nvim_lsp',
      entry_filter = function(entry)
        return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
      end
    },
    { name = 'luasnip' },
    { name = 'tailwindcss' },
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert({
    -- Select with enter
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    -- Super tab to navigate completion menu
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    -- Trigger completion with Ctrl + Space
    ['<C-space>'] = cmp.mapping.complete(),
  }),
})
--}}}
