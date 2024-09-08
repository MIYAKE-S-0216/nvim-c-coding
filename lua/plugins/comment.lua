return {
	-- Comment.nvim: コメント操作を簡単にするプラグイン
	{
		'numToStr/Comment.nvim',
		event = {
			"BufReadPre",
			"BufNewFile",
		},
	},
}
