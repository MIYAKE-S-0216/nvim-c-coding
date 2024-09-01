return {
	{
		'neovim/nvim-lspconfig',	-- nvim-lspconfig
	},
	{
		'williamboman/mason.nvim',	-- Mason
		opts = {},	-- Mason のオプション
	},
	{
		'williamboman/mason-lspconfig.nvim',	-- Mason LSP
	},
	{
		"hrsh7th/nvim-cmp",
		--requires = {	-- nvim-cmp
		dependencies = {	-- nvim-cmp
			-- nvim-cmp に必要なプラグイン
			"hrsh7th/cmp-nvim-lsp",	-- nvim-lspconfig で設定した LSP サーバーを使用
			"hrsh7th/cmp-buffer",	-- バッファ内の単語を補完
			"hrsh7th/cmp-path",		-- パスの補完
			"hrsh7th/cmp-cmdline",	-- コマンドラインの補完
			"hrsh7th/vim-vsnip",	-- vim-vsnip : スニペットを使用
			"hrsh7th/cmp-vsnip",	-- cmp-vsnip : vim-vsnip のスニペットを使用
			"L3MON4D3/LuaSnip",		-- LuaSnip : Lua でスニペットを使用
			"onsails/lspkind-nvim",	-- lspkind-nvim : LSP の種類を表示
		}
	},
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter', -- optional
			'nvim-tree/nvim-web-devicons',     -- optional
		}
	},
}
