return {
	-- barbar.nvim: タブラインを提供するプラグイン。Gitサポートやアイコン表示が可能
	{
		'romgrk/barbar.nvim',
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			'lewis6991/gitsigns.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		init = function()
			vim.g.barbar_auto_setup = false -- barbar.nvim の自動設定を無効化

			local set = vim.keymap.set
			set("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
			set("n", "<A-.>", "<Cmd>BufferNext<CR>")
			set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
			set("n", "<A->>", "<Cmd>BufferMoveNext<CR>")
			set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
			set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
			set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
			set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
			set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
			set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
			set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
			set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
			set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
			set("n", "<A-0>", "<Cmd>BufferLast<CR>")
			set("n", "<A-p>", "<Cmd>BufferPin<CR>")
			set("n", "<A-c>", "<Cmd>BufferClose<CR>")
		end,
	},
}
