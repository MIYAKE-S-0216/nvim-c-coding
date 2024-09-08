return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = {
			"MarkdownPreviewToggle",
			"MarkdownPreview",
			"MarkdownPreviewStop",
		},
		ft = {
			"markdown"
		},
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		--lazy = false,      -- Recommended
		ft = "markdown", -- If you decide to lazy-load anyway
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("markview").setup({
				modes = { "n", "i", "no", "c" },
				hybrid_modes = { "i" },

				-- This is nice to have
				callbacks = {
					on_enable = function (_, win)
						vim.wo[win].conceallevel = 2;
						vim.wo[win].concealcursor = "nc";
					end,
				}
			})
		end,
	},
	{
		"ixru/nvim-markdown",
		ft = "markdown",
	},
}
