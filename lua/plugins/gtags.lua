return {
	{
		"vim-scripts/gtags.vim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		cmd = {
			"Gtags",
			"GtagsCursor",
		},
		keys = {
			{"<C-g>", mode = "n"},
			{"<C-j>", mode = "n"},
			{"<C-h>", mode = "n"},
		},

		init = function()
			vim.g.Gtags_Auto_Update = 1;
			vim.g.Gtags_No_Auto_Jump = 1;
		end,

		config = function()
			local set = vim.keymap.set
			set('n', '<C-g>', ':Gtags ',				{})
			set('n', '<C-j>', '<Cmd>GtagsCursor<CR>',	{silent = true,})
			set('n', '<C-h>', '<Cmd>Gtags -f %<CR>',	{silent = true,})
			-- set('n', 'J', '<Cmd>cn<CR>', {silent = true,})
			-- set('n', 'K', '<Cmd>cp<CR>', {silent = true,})
		end,
	},
}
