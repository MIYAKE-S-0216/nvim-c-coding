return {
	-- ag.vim: Silver Searcher (ag) を使用してファイル内を検索するためのプラグイン
	{
		"rking/ag.vim",
	},

	-- barbar.nvim: タブラインを提供するプラグイン。Gitサポートやアイコン表示が可能
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- オプション: git を使用する場合
			'nvim-tree/nvim-web-devicons', -- オプション: アイコンを使用する場合
		},
		init = function() vim.g.barbar_auto_setup = false end, -- barbar.nvim の自動設定を無効化
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will be use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- ...etc.
		},
		version = '^1.0.0', -- バージョンが 1.0.0 以上の場合にのみ読み込む
	},

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
		}
	},

	-- Comment.nvim: コメント操作を簡単にするプラグイン
	{
		'numToStr/Comment.nvim',
		opts = {
		}
	},

	-- hlchunk.nvim: コードのチャンクをハイライトするプラグイン
	{
		"shellRaining/hlchunk.nvim",
		event = {
			"BufReadPre", -- バッファを読み込む前
			"BufNewFile" -- 新しいファイルを開く前
		},
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true, -- チャンクのハイライトを有効化
					colors = { "red", "green", "blue", "yellow", "magenta", "cyan" }, -- チャンクの色
				},
				indent = {
					enable = true, -- インデントのハイライトを有効化
					color = "gray", -- インデントの色
				},
			})
		end
	},

	-- lualine.nvim: ステータスラインを提供するプラグイン
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- アイコンを使用する場合
		},
		opts = {
			options = {
				icons_enabled = true, -- アイコンを有効化
				theme = 'ayu_mirage' -- テーマの設定
			}
		}
	},

	-- nvim-bqf: Quickfixウィンドウを強化するプラグイン
	{
		"kevinhwang91/nvim-bqf",
		dependencies = {
			{
				"junegunn/fzf", -- fzf
				run = function()
					vim.fn["fzf#install"]() -- fzf をインストール
				end
			},
			{
				'nvim-treesitter/nvim-treesitter', -- nvim-treesitter
				run = ':TSUpdate', -- nvim-treesitter を更新'
			},
		}
	},

	-- nvim-tree.lua: ファイルエクスプローラーを提供するプラグイン
	{
		"nvim-tree/nvim-tree.lua",
		version = "*", -- バージョンを指定しない
		lazy = false, -- 遅延読み込みを無効化
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- アイコンを使用する場合
		},
		config = function()
			require("nvim-tree").setup {} -- nvim-tree.lua の設定
		end,
	},

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

	-- which-key.nvim: キーマップを表示するプラグイン
	{
		"folke/which-key.nvim",
		dependencies = {
			"echasnovski/mini.icons", -- mini.icons
			'nvim-tree/nvim-web-devicons', -- オプション: アイコンを使用する場合
		},
		event = "VeryLazy",
		opt = {
			-- your configration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
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

	--aerial.nvim: シンボルのアウトラインを表示するプラグイン
	{
		"stevearc/aerial.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- nvim-treesitter
			"nvim-tree/nvim-web-devicons", -- nvim-web-devicons
		},
		config = function()
			require("aerial").setup({
				on_attach = function(bufnr)
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})
		end,
	},
}
