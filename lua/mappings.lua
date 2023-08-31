local map = vim.api.nvim_set_keymap
default_options = {noremap = true, silent = true}
expr_options = {noremap = true, expr = true, silent = true}

-- map the leader key
map("n", "<Space>", "<NOP>", default_options)

-- Telescope remap
map('n', '<leader>ff','<cmd>Telescope find_files<cr>', default_options)
map('n', '<leader>fg','<cmd>Telescope live_grep<cr>', default_options)
map('n', '<leader>fb','<cmd>Telescope buffers<cr>', default_options)
map('n', '<leader>fh','<cmd>Telescope help_tags<cr>', default_options)

-- undo tree
map('n', '<leader>u', '<cmd>UndotreeShow<CR>', default_options)

-- utility remaps
map( 'i', 'jj', '<esc>' , default_options)
map( 'n', 'H', '^', default_options)
map( 'n', 'L', '$', default_options)
map( 'n', '<c-i>', '<C-^>', default_options)
map('n', '<leader>j',':wincmd j<CR>', default_options)
map('n', '<leader>k',':wincmd k<CR>', default_options)
map('n', '<leader>h',':wincmd h<CR>', default_options)
map('n', '<leader>l',':wincmd l<CR>', default_options)
map('n', '<leader>=',':vertical resize +5<CR>', default_options)
map('n', '<leader>-',':vertical resize -5<CR>', default_options)
map('n', '<c-j>',':bp<CR>', default_options)
map('n', '<c-k>',':bn<CR>', default_options)

-- new remaps from primagen video
map('n', 'Y', 'yg_', default_options)
map('n', 'n', 'nzzzv', default_options)
map('n', 'N', 'Nzzzv', default_options)
map('n', 'J', 'mzJ`z', default_options)

-- remap for opening file's directory in a split and for opening a terminal
map('n', '<leader>pv', ':wincmd v<bar> :Ex <bar> :vertical resize 30<CR>', default_options )
map('n', '<leader>tt', ':sp<bar>term<cr><c-w>J:resize10<cr>', default_options)

-- terminal remap
map('t', '<leader>jj', '<C-\\><C-n>', default_options)

-- command mode remaps
map('c', '<C-j>', '<Tab>', default_options)
map('c', '<C-k>', '<Tab><S-Tab><S-Tab>', default_options)
map('c', '<C-h>', '<up>', default_options)
map('c', '<C-l>', '<down>', default_options)

--  visual remap for printing
map("v", "p", "\"_dP", default_options)

-- lsp mappings
map('n', '<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>', default_options)

--
-- GOTO mappings
map('n','<leader>gD','<cmd>lua vim.lsp.buf.declaration()<CR>', default_options)
map('n','<leader>gd','<cmd>lua vim.lsp.buf.definition()<CR>', default_options)
map('n','<leader>K','<cmd>lua vim.lsp.buf.hover()<CR>', default_options)
map('n','<leader>gr','<cmd>lua vim.lsp.buf.references()<CR>', default_options)
map('n','<leader>gs','<cmd>lua vim.lsp.buf.signature_help()<CR>', default_options)
map('n','<leader>gi','<cmd>lua vim.lsp.buf.implementation()<CR>', default_options)
map('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>', default_options)
map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>', default_options)
map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', default_options)
-- ACTION mappings
map('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>', default_options)
-- map('n','<leader>af', '<cmd>lua require"jdtls".code_action()<CR>', default_options)
map('n','<leader>vr',  '<cmd>lua vim.lsp.buf.rename()<CR>', default_options)
-- Few language severs support these three
map('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>', default_options)
map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', default_options)
map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', default_options)
-- Diagnostics mapping
map('n','<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', default_options)
map('n','<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', default_options)
map('n','<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', default_options)

-- LuaSnip mappings
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
