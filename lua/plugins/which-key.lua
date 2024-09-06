return {
	-- which-key.nvim: キーマップを表示するプラグイン
	{
		"folke/which-key.nvim",
		dependencies = {
			"echasnovski/mini.icons", -- mini.icons
			'nvim-tree/nvim-web-devicons', -- オプション: アイコンを使用する場合
		},
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		}
	},
}
