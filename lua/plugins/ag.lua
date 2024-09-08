return {
	-- ag.vim: Silver Searcher (ag) を使用してファイル内を検索するためのプラグイン
	{
		"rking/ag.vim",
		cmd = {
			"Ag",
		},
		init = function ()
			local set = vim.keymap.set
			set('n', 'S', ':Ag ', {});
		end,
	},
}
