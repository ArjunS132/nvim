local cmp = require'cmp'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
cmp.setup({
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-h>'] = cmp.mapping.scroll_docs(-4),
    ['<C-l>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.complete() and cmp.mapping.close(),
    ['<ESC>'] = cmp.mapping.close()
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }
})
