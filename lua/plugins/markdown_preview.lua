return {
	"iamcco/markdown-preview.nvim",	-- markdown-preview.nvim
	cmd = {	-- コマンド
		"MarkdownPreviewToggle",	-- プレビューを切り替える
		"MarkdownPreview",			-- プレビューを開く
		"MarkdownPreviewStop",		-- プレビューを停止
	},
	ft = {	-- ファイルタイプ
		"markdown"
	},
	build = function() vim.fn["mkdp#util#install"]() end,	-- markdown-preview.nvim のインストール
}
