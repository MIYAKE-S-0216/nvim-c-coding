return {
	-- nvim-bqf: Quickfixウィンドウを強化するプラグイン
	{
		"kevinhwang91/nvim-bqf",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			{
				"junegunn/fzf",
				run = function()
					vim.fn["fzf#install"]()
				end
			},
			{
				'nvim-treesitter/nvim-treesitter',
				run = ':TSUpdate',
			},
		}
	},
}
