return {
	-- hlchunk.nvim: コードのチャンクをハイライトするプラグイン
	{
		"shellRaining/hlchunk.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true, -- チャンクのハイライトを有効化
					colors = { "red", "green", "blue", "yellow", "magenta", "cyan" }, -- チャンクの色
				},
				indent = {
					enable = true, -- インデントのハイライトを有効化
					color = "gray", -- インデントの色
				},
			})
		end
	},
}
