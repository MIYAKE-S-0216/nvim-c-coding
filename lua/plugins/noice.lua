return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- 以下のプラグインを遅延読み込みする場合は、適切な `module="..."` エントリを追加してください
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("noice").setup ({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- rou can enable a preset for easier configuration
				presets = {
					bottom_search = true,	-- use a classic bottom cmdline for search
					command_palette = true,	-- position the cmdline and popupmenu together
					long_message_to_split = true,	-- long message will be sent to split
					inc_rename = false,		-- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false,		-- add a border to hover docs and signature help
				},
			})
			vim.keymap.set('n', 'nd', '<Cmd>NoiceDismiss<CR>', { silent = false, } )
		end,
	},
}

