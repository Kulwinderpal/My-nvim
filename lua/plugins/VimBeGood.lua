return {
	{
		'ThePrimeagen/vim-be-good',
		action = "VeryLazy",
		config = function ()
			vim.keymap.set('n', '<leader>vbg', ':VimBeGood<CR>')

		end
	}
}
