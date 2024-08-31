return{
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'sharkdp/fd',
			'BurntSushi/ripgrep',
			'nvim-telescope/telescope-file-browser.nvim',
		},
		keys = {
			{ "<C-p>",		mode = "n",},
			{ "<leader>fg",	mode = "n",},
			{ ",b",			mode = "n",},
			{ ",f",			mode = "n",},
			--      { "<Leader>fh", mode = "n",},
		}
	},
}

