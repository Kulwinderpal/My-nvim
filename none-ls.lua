return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.fantomas,
					null_ls.builtins.formatting.ktlint,
					null_ls.builtins.formatting.clang_format,
				},
			})
			vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, {})
		end,
	},
}
