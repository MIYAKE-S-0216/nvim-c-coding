require('nvim-treesitter.configs').setup {	-- nvim-treesitter の設定
	highlight = {	-- ハイライトの設定
		enable = true,	-- 有効化
		disable = {	-- 無効化
			'toml'	-- toml ファイルを無効化
		}
	}
}
