return {
	{
		'williamboman/mason-lspconfig.nvim',
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			'williamboman/mason.nvim',
			'neovim/nvim-lspconfig',
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function ()
			require("mason").setup{}
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					--"pylsp",
					"pyright",
					--"lua_ls",
					"luau_lsp",
					"marksman",
				},
			})
			require('mason-lspconfig').setup_handlers {
				function(server_name)
					local capabilities = require('cmp_nvim_lsp').default_capabilities()
					require('lspconfig')[server_name].setup {
						capabilities = capabilities,
					}
				end,
			}
		end,
	},
	{
		'williamboman/mason.nvim',
		-- mason.nvim is optimized to load as little as possible during setup. 
		-- Lazy-loading the plugin, or somehow deferring the setup, is not recommended.
		lazy = false,
		config = function ()
			-- It's important that you set up the plugins in the following order:
			-- 1. mason.nvim
			-- 2. mason-lspconfig.nvim
			-- 3. Setup servers via lspconfig
			-- Pay extra attention to this if you lazy-load plugins, or somehow "chain" the loading of plugins via your plugin manager.
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					},
				},
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		event = {
			"BufReadPre",
			"BufNewFile",
		},

		config = function()
			local set = vim.keymap.set
			local opts = { noremap=true, silent=true }	-- オプションの設定
			vim.api.nvim_set_keymap('n', '<C-]>',	'<cmd>lua vim.lsp.buf.declaration()<CR>',		opts)	-- 宣言にジャンプ
			-- vim.api.nvim_set_keymap('n', '<C-j>',		'<cmd>lua vim.lsp.buf.definition()<CR>',		opts)	-- 定義にジャンプ
			-- vim.api.nvim_set_keymap('n', '<C-k>',		'<cmd>lua vim.lsp.buf.references()<CR>',		opts)	-- 参照を検索
			vim.api.nvim_set_keymap('n', 'gi',		'<cmd>lua vim.lsp.buf.implementation()<CR>',	opts)	-- 実装にジャンプ
			--vim.api.nvim_set_keymap('n', 'K',		'<cmd>lua vim.lsp.buf.hover()<CR>',				opts)	-- ホバー
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		keys = {
			{":", mode = "n", },
			{"/", mode = "n", },
		},
		event = {
			"InsertEnter",
		},
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind-nvim",
		},
		config = function()
			local cmp = require'cmp'
			local luasnip	= require("luasnip")
			local lspkind = require('lspkind')
			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					['<C-c>'] = cmp.mapping.abort(),
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
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
					{ name = 'path' },
					{ name = 'comdline' },
				}),
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
			})
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' },
				}
			})
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' },
				}, {
					{ name = 'cmdline' },
				}),
				matching = { disallow_symbol_noprefix_matching = false }
			})
		end
	},
	{
		"L3MON4D3/LuaSnip",
		event = {
			"InsertEnter",
		},
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		'nvimdev/lspsaga.nvim',
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require('lspsaga').setup({})
			vim.api.nvim_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { silent = true })
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		}
	},
}
