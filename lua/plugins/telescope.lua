return {
	-- telescope.nvim: ファジーファインダーを提供するプラグイン
	{
		'nvim-telescope/telescope.nvim',
		keys = {
			{ "<C-p>", mode = "n", },
			{ ",b", mode = "n", },
			{ ",f", mode = "n", },
			{ "lg", mode = "n", },
		},
		cmd = {
			"Telescope",
		},
		dependencies = {
			'nvim-lua/plenary.nvim',
			'sharkdp/fd',
			'BurntSushi/ripgrep',
			'nvim-telescope/telescope-file-browser.nvim',
			--'delphinus/telescope-memo.nvim',
		},
		config = function ()
			local builtin = require("telescope.builtin")
			local set = vim.keymap.set
			local opts = { silent = true, }
			set("n", "<C-p>",	builtin.find_files,	opts)
			set("n", ",b",		builtin.buffers,	opts)
			set("n", ",f",		builtin.jumplist,	opts)
			set("n", "lg",		builtin.live_grep,	opts)
			set("n", ",l",		builtin.current_buffer_fuzzy_find,	opts)

			require("telescope").load_extension "file_browser";
			--require("telescope").load_extension "memo";
		end
		--[[ config = function()
			require("telescope").setup {
				extensions = {
					fzf = {
						fuzzy = true, -- ファジーファインダーを有効化
						override_generic_sorter = true, -- ジェネリックソーターをオーバーライド
						override_file_sorter = true, -- ファイルソーターをオーバーライド
						case_mode = "smart_case", -- スマートケース
					},
				},
			}
			require("telescope").load_extension("fzf")
		end, ]]
	},

	-- telescope-fzf-native.nvim: fz を使用してファジーファインダーを高速化するプラグイン
	--[[ {
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make', -- ビルド方法
	}, ]]

	-- telescope-all-recent.nvim: 最近開いたファイルを表示するプラグイン
	{
		"prochri/telescope-all-recent.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim", -- telescope.nvim
			"kkharji/sqlite.lua", -- sqlite.lua
			"stevearc/dressing.nvim", -- dressing.nvim
		},
	},
}
