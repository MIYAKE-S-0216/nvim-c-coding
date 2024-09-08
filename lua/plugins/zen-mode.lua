return {
	-- zen-mode.nvim: "禅"集中モード
	{
		"folke/zen-mode.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function ()
			vim.keymap.set("n", "zen", "<Cmd>ZenMode<CR>", { silent = true, })
		end
	},
}
