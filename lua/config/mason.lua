require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { 'pyright', 'html', 'tsserver', 'cssls', 'clangd', 'jdtls' }
})


require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
}

require("mason-nvim-dap").setup({
    ensure_installed = {"java"},
    automatic_installation = true,
})
