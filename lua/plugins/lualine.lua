return {
	-- lualine.nvim: ステータスラインを提供するプラグイン
	{
		'nvim-lualine/lualine.nvim',
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		opts = {
			options = {
				icons_enabled = true,
				theme = 'ayu_mirage'
			},
		}
	},
}
