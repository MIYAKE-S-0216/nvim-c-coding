return {
	{
		'williamboman/mason-lspconfig.nvim',	-- Mason LSP
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			{
				'williamboman/mason.nvim',	-- Mason
				cmd = {
					"Mason",
					"MasonInstall",
					"MasonUninstall",
					"MasonUninstallAll",
					"MasonLog",
					"MasonUpdate",
				},
				config = function ()
					require("mason").setup()
				end,
			},
			{
				'neovim/nvim-lspconfig',	-- nvim-lspconfig
				event = {
					"BufReadPre",
					"BufNewFile",
				},
			},
			{
				"hrsh7th/nvim-cmp",
				event = {
					"InsertEnter",
				},
				dependencies = {
					-- nvim-cmp に必要なプラグイン
					"hrsh7th/cmp-nvim-lsp",	-- nvim-lspconfig で設定した LSP サーバーを使用
					"hrsh7th/cmp-buffer",	-- バッファ内の単語を補完
					"hrsh7th/cmp-path",		-- パスの補完
					"hrsh7th/cmp-cmdline",	-- コマンドラインの補完
					"hrsh7th/vim-vsnip",	-- vim-vsnip : スニペットを使用
					"hrsh7th/cmp-vsnip",	-- cmp-vsnip : vim-vsnip のスニペットを使用
					{
						"L3MON4D3/LuaSnip",		-- LuaSnip : Lua でスニペットを使用
						version = "v2.*",
						config = function ()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
					"rafamadriz/friendly-snippets",
					"onsails/lspkind-nvim",	-- lspkind-nvim : LSP の種類を表示
				},
			},
		},
		config = function ()
			require("mason-lspconfig").setup({
				ensure_installed = {	-- インストールする LSP サーバーのリスト
					"clangd",				-- C/C++ の LSP サーバー
					--"pylsp",				-- Python の LSP サーバー
					"pyright",				-- Python の LSP サーバー
					"lua_ls",				-- Lua の LSP サーバー
					"marksman",				-- Markdown の LSP サーバー
				},
			})
			local lspconfig = require('lspconfig')
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			-- C/C++ LSP の設定
			lspconfig.clangd.setup {
				cmd = { "clangd" },	-- clangd のパスを指定
				--[[
				cmd = {
					"clangd",
					"--compile-commands-dir=./compile_flags.txt"
				},
				--]]
				fallbackFlags = { "-std=c11" },	-- ファイルがコンパイルされていない場合に使用するフラグ
				filetypes = { "c", "cpp", "objc", "objcpp" },	-- C/C++ のファイルタイプ
				root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),	-- プロジェクトのルートディレクトリを見つけるためのパターン
				settings = {	-- LSP サーバーの設定
					clangd = {	-- Clangd の設定
						-- Clangd の特定の設定をここに追加
					}
				},
				capabilities = capabilities,
			}

			-- Python LSP の設定
			lspconfig.pylsp.setup {
				cmd = { "pylsp" },	-- pylsp のパスを指定
				root_dir = lspconfig.util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt"),	-- プロジェクトのルートディレクトリを見つけるためのパターン
				filetypes = { "python" },	-- Python のファイルタイプ
				settings = {	-- LSP サーバーの設定
					pylsp = {	-- Pylsp の設定
						plugins = {	-- Pylsp のプラグインの設定
							pycodestyle = {	-- Pycodestyle の設定
								ignore = {'W391'},	-- 除外するエラーコード
								maxLineLength = 100,	-- 最大行の長さ
							}
						}
					}
				},
				capabilities = capabilities,
			}

			-- Lua LSP の設定
			lspconfig.lua_ls.setup {
				cmd = { "lua-language-server" },	-- Lua LSP のパスを指定
				root_dir = lspconfig.util.root_pattern(".git", "init.lua"),	-- プロジェクトのルートディレクトリを見つけるためのパターン
				filetypes = { "lua" },	-- Lua のファイルタイプ
				capabilities = capabilities,
			}

			-- Markdown LSP の設定
			lspconfig.marksman.setup {
				-- cmd = { "marksman" },	-- Markdown LSP のパスを指定
				root_dir = lspconfig.util.root_pattern(".md"),	-- プロジェクトのルートディレクトリを見つけるためのパターン
				filetypes = { "markdown" },	-- Markdown のファイルタイプ
				capabilities = capabilities,
			}

			-- LSP の補完機能の設定
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			cmp.setup({
				snippet = {	-- スニペットの設定
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window	= {	-- 補完ウィンドウの設定
					-- プレビューの設定
					-- プレビューを有効化
					preview = {
						-- プレビューの幅
						width = 60,
					},
				},
				sources = {
					{ name = "nvim_lsp" },	-- nvim-lspconfig で設定した LSP サーバーを使用
					{ name = "vsnip" },		-- vim-vsnip のスニペットを使用
					--{ name = "luasnip" },	-- LuaSnip のスニペットを使用
					{ name = "buffer" },	-- バッファ内の単語を補完
					{ name = "path" },		-- パスの補完
					{ name = "cmdline" },	-- コマンドラインの補完
				},
				mapping = {	-- キーマップの設定
					["<C-n>"]		= cmp.mapping.select_next_item(),			-- 次の候補を選択
					["<C-p>"]		= cmp.mapping.select_prev_item(),			-- 前の候補を選択
					["<C-d>"]		= cmp.mapping.scroll_docs(-4),				-- ドキュメントをスクロール
					["<C-f>"]		= cmp.mapping.scroll_docs(4),				-- ドキュメントをスクロール
					["<C-z>"]		= cmp.mapping.complete(),					-- 補完を実行
					["<Esc>"]		= cmp.mapping.close(),						-- 補完を終了
					['<CR>']		= cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),

					["<Tab>"]		= cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"]		= cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
			})

			-- 検索時の補完
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' },
				}
			})

			-- コマンドラインの補完
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' },
				}, {
					{ name = 'cmdline' },
				}),
				matching = { disallow_symbol_noprefix_matching = false }
			})

			local lspkind = require('lspkind')
			cmp.setup {
				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol',	-- show only symbol annotations
						maxwidth = 50,
						ellipsis_char = '…',
						show_labelDetails = true,

						before = function (entry, vim_item)
							return vim_item
						end
					})
				}
			}
		end,
	},
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})
			vim.api.nvim_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { silent = true })
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter', -- optional
			'nvim-tree/nvim-web-devicons',     -- optional
		}
	},
}
