return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"rust",
					"c",
					"vimdoc",
					"go",
				},
				indent = { enable = true },
				highlight = { enable = true },
				auto_install = true,
			})
		end,
	},
}
