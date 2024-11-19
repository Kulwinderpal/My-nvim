return {
{
                        "williamboman/mason.nvim",
                        dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
                opts = {
                        ensure_installed = {
                                "stylua",
                                "clang-format"
        }
                },
                config = function ()
require("mason").setup({})
require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "powershell_es", "rust_analyzer", "clangd" },
})
require("lspconfig").lua_ls.setup({
        capabilities = capabilities
})
require("lspconfig").rust_analyzer.setup({
        capabilities = capabilities
})
require("lspconfig").powershell_es.setup({
        capabilities = capabilities
})
require("lspconfig").clangd.setup({
        capabilities = capabilities
})
                end
 }
}
