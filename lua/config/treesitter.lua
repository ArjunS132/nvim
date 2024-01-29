require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "python", "lua", "java", "javascript", "typescript", "html", "css"},
  highlight = {
    enable = true,
  },
  indent = true,
}
