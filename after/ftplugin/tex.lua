local o = vim.opt

-- sets for autocorrection
o.spell = true
o.spelllang = { 'en_us' }
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

-- let for auto completion
vim.g.completion_matching_strategy_list='exact', 'substring', 'fuzzy'
