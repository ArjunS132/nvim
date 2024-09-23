local o = vim.opt

-- sets for autocorrection
o.spell = true
o.spelllang = { 'en_us' }

-- let for auto completion
vim.g.completion_matching_strategy_list='exact', 'substring', 'fuzzy'
