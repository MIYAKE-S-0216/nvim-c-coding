-- Lazy.nvim を使用してプラグインを管理
require("lazy").setup({
	-- プラグインのリスト
	-- プラグインを無効化する場合は、コメントアウト
	{ import = "plugins.base"		},
	--{ import = "plugins.copilot"	},
	--{ import = "plugins.gen_tags"	},
	{ import = "plugins.gtags"	},
	{ import = "plugins.noice"		},
	{ import = "plugins.lsp"		},
	{ import = "plugins.markdown_preview"	},
	{ import = "plugins.treesitter"	},
	{ import = "plugins.treesj"	},
})
