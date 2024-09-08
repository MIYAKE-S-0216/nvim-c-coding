return {
	-- catppuccin/nvim: カラースキームを提供するプラグイン。複数のフレーバーが選択可能
	{
		"catppuccin/nvim",
		priority = 1000,
		init = function ()
			vim.cmd.colorscheme "catppuccin"
		end,
	},
}
