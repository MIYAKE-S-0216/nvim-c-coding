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
				"junegunn/fzf", -- fzf
				run = function()
					vim.fn["fzf#install"]() -- fzf をインストール
				end
			},
			{
				'nvim-treesitter/nvim-treesitter', -- nvim-treesitter
				run = ':TSUpdate', -- nvim-treesitter を更新'
			},
		}
	},
}
