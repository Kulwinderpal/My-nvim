return {
{
	"nvim-neo-tree/neo-tree.nvim", 
			dependencies = {
				'nvim-tree/nvim-web-devicons',
				'nvim-lua/plenary.nvim',
				'MunifTanjim/nui.nvim',
			},
		config = function ()
		require("neo-tree").setup()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>")


			
		end
 },
}
