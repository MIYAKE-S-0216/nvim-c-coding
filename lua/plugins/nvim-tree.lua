return {
	-- nvim-tree.lua: ファイルエクスプローラーを提供するプラグイン
	{
		"nvim-tree/nvim-tree.lua",
		version = "*", -- バージョンを指定しない
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- アイコンを使用する場合
		},
		config = function()
			require("nvim-tree").setup {
				update_focused_file = {
					enable		= true,
					update_cmd	= true,
				},
			}
			local set = vim.keymap.set
			set('n', '<leader>e', '<Cmd>:NvimTreeOpen<CR>', { silent = true, })
		end,
		keys = {
			{ "<leader>e",	mode = "n", },
		},
		cmd = {
			"NvimTreeOpen",
		},

		init = function ()
		end
	},
}
