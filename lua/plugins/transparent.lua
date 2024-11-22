return {
	{
		"xiyaowong/transparent.nvim",
		config = function()
			vim.cmd("TransparentEnable")
			require("transparent").clear_prefix("NeoTree")
			require("transparent").clear_prefix("BufferLine")
		end,
	},
}
