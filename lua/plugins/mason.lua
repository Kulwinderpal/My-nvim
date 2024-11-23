return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},

		config = function()
			require("mason").setup({})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"clang-format",
					"kotlin-language-server",
					"clangd",
					"rust_analyzer",
					"lua_ls",
					"ktlint",
					"gopls",
					"goimports",
				},
				auto_update = true,
				run_on_start = true,
			})
			require("mason-lspconfig").setup()
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
			})
			require("lspconfig").rust_analyzer.setup({
				capabilities = capabilities,
			})
			require("lspconfig").clangd.setup({
				capabilities = capabilities,
			})
			require("lspconfig").kotlin_language_server.setup({
				capabilities = capabilities,
			})
			require("lspconfig").gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})
		end,
	},
}
