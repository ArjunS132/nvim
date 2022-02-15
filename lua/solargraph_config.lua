
local M = {}
function M.setup()
  vim.cmd[[set softtabstop=4]]
  vim.cmd[[set shiftwidth=4]]
  vim.cmd[[set expandtab]]
  -- Utility servers
  local map = function(type, key, value)
    vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end
  -- GOTO mappings
  map('n','<leader>gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n','<leader>gd','<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n','<leader>K','<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','<leader>gr','<cmd>lua vim.lsp.buf.references()<CR>')
  map('n','<leader>gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n','<leader>gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  -- ACTION mappings
  map('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','<leader>af', '<cmd>lua require"jdtls".code_action()<CR>')
  map('n','<leader>vr',  '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- Few language severs support these three
  map('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>')
  map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
  map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  -- Diagnostics mapping
  map('n','<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  map('n','<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  map('n','<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
end
return M
