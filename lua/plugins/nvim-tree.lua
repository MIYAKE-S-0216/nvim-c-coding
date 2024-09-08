return {
	-- nvim-tree.lua: ファイルエクスプローラーを提供するプラグイン
	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<leader>e",	mode = "n", },
		},
		cmd = {
			"NvimTreeOpen",
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {
			}
			vim.keymap.set('n', '<leader>e', '<Cmd>:NvimTreeFindFileToggle<CR>', { silent = true, })
		end,
	},
}
