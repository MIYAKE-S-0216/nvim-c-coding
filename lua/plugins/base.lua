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

	-- zen-mode.nvim: "禅"集中モード
	-- Lua
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			require("zen-mode").setup({
				{
					window = {
						backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
						-- height and width can be:
						-- * an absolute number of cells when > 1
						-- * a percentage of the width / height of the editor when <= 1
						-- * a function that returns the width or the height
						width = 120, -- width of the Zen window
						height = 1, -- height of the Zen window
						-- by default, no options are changed for the Zen window
						-- uncomment any of the options below, or add other vim.wo options you want to apply
						options = {
							-- signcolumn = "no", -- disable signcolumn
							-- number = false, -- disable number column
							-- relativenumber = false, -- disable relative numbers
							-- cursorline = false, -- disable cursorline
							-- cursorcolumn = false, -- disable cursor column
							-- foldcolumn = "0", -- disable fold column
							-- list = false, -- disable whitespace characters
						},
					},
					plugins = {
						-- disable some global vim options (vim.o...)
						-- comment the lines to not apply the options
						options = {
							enabled = true,
							ruler = false, -- disables the ruler text in the cmd line area
							showcmd = false, -- disables the command in the last line of the screen
							-- you may turn on/off statusline in zen mode by setting 'laststatus' 
							-- statusline will be shown only if 'laststatus' == 3
							laststatus = 0, -- turn off the statusline in zen mode
						},
						twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
						gitsigns = { enabled = false }, -- disables git signs
						tmux = { enabled = false }, -- disables the tmux statusline
						todo = { enabled = false }, -- if set to "true", todo-comments.nvim highlights will be disabled
						-- this will change the font size on kitty when in zen mode
						-- to make this work, you need to set the following kitty options:
						-- - allow_remote_control socket-only
						-- - listen_on unix:/tmp/kitty
						kitty = {
							enabled = false,
							font = "+4", -- font size increment
						},
						-- this will change the font size on alacritty when in zen mode
						-- requires  Alacritty Version 0.10.0 or higher
						-- uses `alacritty msg` subcommand to change font size
						alacritty = {
							enabled = false,
							font = "14", -- font size
						},
						-- this will change the font size on wezterm when in zen mode
						-- See alse also the Plugins/Wezterm section in this projects README
						wezterm = {
							enabled = false,
							-- can be either an absolute font size or the number of incremental steps
							font = "+4", -- (10% increase per step)
						},
						-- this will change the scale factor in Neovide when in zen mode
						-- See alse also the Plugins/Wezterm section in this projects README
						neovide = {
							enabled = false,
							-- Will multiply the current scale factor by this number
							scale = 1.2,
							-- disable the Neovide animations while in Zen mode
							disable_animations = {
								neovide_animation_length = 0,
								neovide_cursor_animate_command_line = false,
								neovide_scroll_animation_length = 0,
								neovide_position_animation_length = 0,
								neovide_cursor_animation_length = 0,
								neovide_cursor_vfx_mode = "",
							},
						},
					},
					-- callback where you can add custom code when the Zen window opens
					on_open = function(win)
					end,
					-- callback where you can add custom code when the Zen window closes
					on_close = function()
					end,
				},
			})
		end
	},
	{
		"L3MON4D3/LuaSnip",		-- LuaSnip : Lua でスニペットを使用
		version = "v2.*",
		config = function ()
			require("luasnip.loaders.from_vscode").lazy_load()
		end
	},
	{
		"rafamadriz/friendly-snippets",
		dependencies = 
		{
			"L3MON4D3/LuaSnip",		-- LuaSnip : Lua でスニペットを使用
		},
	},
}
