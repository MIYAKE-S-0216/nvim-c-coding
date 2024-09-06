return {
	-- Comment.nvim: コメント操作を簡単にするプラグイン
	{
		'numToStr/Comment.nvim',
		event = {
			"BufReadPre", -- バッファを読み込む前
			"BufNewFile" -- 新しいファイルを開く前
		},
	},
}
