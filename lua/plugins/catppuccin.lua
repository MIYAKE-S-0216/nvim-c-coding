return {
	-- catppuccin/nvim: カラースキームを提供するプラグイン。複数のフレーバーが選択可能
	{
		"catppuccin/nvim",
		name = "catppuccin", -- プラグインの名前
		priority = 1000, -- プラグインの読み込み順序
		opts = {
			flavor = "macchiato", -- フレーバーの設定
			background = {
				light = "latte", -- ライトモードの背景
				dark = "macchiato", -- ダークモードの背景
			},
			-- transparent_background = false, -- 透過背景の設定
		},
		init = function ()
			vim.cmd.colorscheme "catppuccin"
		end
	},
}
