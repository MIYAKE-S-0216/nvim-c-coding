return {
	{
		--[[
		hlchunk.nvim:
		インデントからコードブロックの組を表示する
		--]]
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
			})
		end
	},
}

