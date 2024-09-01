return {
	'Wansmer/treesj',	-- treesj
	keys = {	-- キーマッピング
		'<space>m',
		'<space>j',
		'<space>s'
	},
	dependencies = {	-- treesj に必要なプラグイン
		'nvim-treesitter/nvim-treesitter' }, -- nvim-treesitter
	config = function()	-- treesj の設定
		require('treesj').setup({--[[ your config ]]})
	end,
}

