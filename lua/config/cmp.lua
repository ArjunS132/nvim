
local cmp = require "cmp"
local luasnip = require "luasnip"

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup {
  -- snippet = {
  --   expand = function(args)
  --     vim.fn["vsnip#anonymous"](args.body)
  --   end,
  -- },
  snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
  },

  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-h>'] = cmp.mapping.scroll_docs(-4),
    ['<C-l>'] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ['<ESC>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping(function(fallback) -- jump to next slot in snippit
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),
    ['<S-Tab>'] = cmp.mapping(function(fallback) -- jump to prev slot in snippit
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),
  },

  sources = {
    { name = "luasnip"},
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
}
