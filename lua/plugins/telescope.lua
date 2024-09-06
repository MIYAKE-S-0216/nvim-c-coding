return {
	-- telescope.nvim: ファジーファインダーを提供するプラグイン
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x', -- ブランチ
		dependencies = {
			'nvim-lua/plenary.nvim', -- plenary.nvim
			'sharkdp/fd', -- fd
			'BurntSushi/ripgrep', -- ripgrep
			'nvim-telescope/telescope-file-browser.nvim', -- telescope-file-browser.nvim
		},
		keys = {
			{ "<C-p>", mode = "n", },
			{ "<leader>fg", mode = "n", },
			{ ",b", mode = "n", },
			{ ",f", mode = "n", },
			-- { "<Leader>fh", mode = "n", },
		},
		config = function ()
			local builtin = require("telescope.builtin")
			local set = vim.keymap.set
			set("n", "<C-p>",	builtin.find_files, {})
			set("n", ",b",		builtin.buffers, {})
			set("n", ",f",		builtin.jumplist, { silent = true, })
			require("telescope").load_extension "file_browser";
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
	--[[ {
		"prochri/telescope-all-recent.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim", -- telescope.nvim
			"kkharji/sqlite.lua", -- sqlite.lua
			"stevearc/dressing.nvim", -- dressing.nvim
		},
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	}, ]]
}
