return {
	{
		'nvim-treesitter/nvim-treesitter',
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function ()
			require("nvim-treesitter.configs").setup {
				ensure_installed = {
					"c",
					"lua",
					"markdown",
					"html",
				},
				highlight = {
					enable = true,
					disable = {
						"toml",
					},
				},
				-- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
				indent = {
					enable = true,
				},
			}
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter-context'
	},
}
