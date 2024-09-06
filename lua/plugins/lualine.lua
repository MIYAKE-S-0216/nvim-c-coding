return {
	-- lualine.nvim: ステータスラインを提供するプラグイン
	{
		'nvim-lualine/lualine.nvim',
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- アイコンを使用する場合
		},
		opts = {
			options = {
				icons_enabled = true, -- アイコンを有効化
				theme = 'ayu_mirage' -- テーマの設定
			}
		}
	},
}
