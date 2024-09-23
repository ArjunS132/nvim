local ls = require("luasnip")
require("luasnip.loaders.from_lua").lazy_load()
require("luasnip/loaders/from_vscode").lazy_load()

ls.config.set_config({
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
})


vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})

-- tab to jump forward and expand snippets
vim.keymap.set('i', '<Tab>', function()
  return require('luasnip').expand_or_jumpable() and '<Plug>luasnip-expand-or-jump' or '<Tab>'
end, { expr = true, silent = true })


vim.keymap.set({"i", "s"}, "<c-j>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
