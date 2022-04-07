
local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-h>'] = cmp.mapping.scroll_docs(-4),
    ['<C-l>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.complete() and cmp.mapping.close(),
    ['<ESC>'] = cmp.mapping.close()
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
}
