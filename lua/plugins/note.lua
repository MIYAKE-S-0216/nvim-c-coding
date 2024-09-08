return {
	{
		"backdround/global-note.nvim",
		event = "VeryLazy",
		config = function()
			local global_note = require("global-note")
			global_note.setup({
				filename = "global.md",
				directory = "~/notes/",
				--directory = "D:/notes/",

				additional_presets = {
					todo = {
						filename = "todo.md",
						title = "ToDo",
						command_name = "Todo",
					},
					diary = {
						filename = "diary.md",
						title = "Diary",
						command_name = "Diary",
					},
				},
			})
			vim.keymap.set("n", "gn", global_note.toggle_note, { desc = "Toggle global note", silent = true, })
			vim.keymap.set("n", "diary", "<Cmd>Diary<CR>", { desc = "Open Diary note", silent = true, })
			vim.keymap.set("n", "todo", "<Cmd>Todo<CR>", { desc = "Open Todo note", silent = true, })
		end
	}
}
