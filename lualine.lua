return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("lualine").setup({
				icons_enabled = true,
				theme = "onedark",
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "filename", "filetype" },
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
			})
		end,
	},
}
