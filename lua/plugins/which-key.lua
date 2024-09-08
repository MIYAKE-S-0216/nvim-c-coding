return {
	-- which-key.nvim: キーマップを表示するプラグイン
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		dependencies = {
			"echasnovski/mini.icons",
			'nvim-tree/nvim-web-devicons',
		},
	},
}
