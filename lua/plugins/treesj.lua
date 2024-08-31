return {
	{
		--[[
		treesj:
		階層構造の実装を一行にまとめたり改行展開したりできる
		--]]
		'Wansmer/treesj',
		keys = { '<space>m', '<space>j', '<space>s' },
		dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
		config = function()
			require('treesj').setup({--[[ your config ]]})
		end,
	},
}

