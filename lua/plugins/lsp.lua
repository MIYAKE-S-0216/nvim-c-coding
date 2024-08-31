return {
	{
		'neovim/nvim-lspconfig'
	},
	{
		'williamboman/mason.nvim',
		opts = {}
	},
	{
		'williamboman/mason-lspconfig.nvim'
	},
	{ "hrsh7th/nvim-cmp", requires = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-vsnip",
		"L3MON4D3/LuaSnip",
	}},
}
