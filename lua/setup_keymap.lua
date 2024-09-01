local set = vim.keymap.set

--vim.g.mapleader = " "

set("n", "<A-j>", "gj")
set("n", "<A-k>", "gk")
set("i", "<C-s>", "<Cmd>:w<CR>")
set("n", "<C-s>", "<Cmd>:w<CR>")

set('n', '<C-q>', '<Cmd>:ccl<CR>',				{silent = true,})
set('n', '<C-n>', '<Cmd>:nohlsearch<CR><Esc>',	{silent = true,})

-- aerial.nvim
if vim.loop.fs_stat(vim.fn.stdpath("data") .. "/lazy/aerial.nvim") then
	set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
end

-- ag.vim
if vim.loop.fs_stat(vim.fn.stdpath("data") .. "/lazy/ag.vim") then
	set('n', 'S', ':Ag ', {})
end

-- barbar.nvim
if vim.loop.fs_stat(vim.fn.stdpath("data") .. "/lazy/barbar.nvim") then
	set("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
	set("n", "<A-.>", "<Cmd>BufferNext<CR>")
	set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
	set("n", "<A->>", "<CmdBufferMoveNext<CR>")
	set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
	set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
	set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
	set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
	set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
	set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
	set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
	set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
	set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
	set("n", "<A-0>", "<Cmd>BufferLast<CR>")
	set("n", "<A-p>", "<Cmd>BufferPin<CR>")
	set("n", "<A-c>", "<Cmd>BufferClose<CR>")
end

-- gtags.vim
if vim.loop.fs_stat(vim.fn.stdpath("data") .. "/lazy/gtags.vim") then
	set('n', '<C-g>', ':Gtags ',				{})
	set('n', '<C-j>', '<Cmd>:GtagsCursor<CR>',	{silent = true,})
	set('n', '<C-h>', '<Cmd>:Gtags -f %<CR>',	{silent = true,})

	set('n', 'J', '<Cmd>:cn<CR>', {silent = true,})
	set('n', 'K', '<Cmd>:cp<CR>', {silent = true,})
end

-- nvim-tree.lua
if vim.loop.fs_stat(vim.fn.stdpath("data") .. "/lazy/nvim-tree.lua") then
	set('n', '<leader>e', '<Cmd>:NvimTreeOpen<CR>', {silent = true,})
end

-- telescope.nvim
if vim.loop.fs_stat(vim.fn.stdpath("data") .. "/lazy/telescope.nvim") then
	local builtin = require('telescope.builtin')

	set('n', '<C-p>', builtin.find_files, {})
	set('n', '<leader>fg', builtin.live_grep, {})
	set('n', ',b', builtin.buffers, {})
	--set('n', '<leader>fh', builtin.help_tags, {)
	set('n', ',f', builtin.jumplist, {silent = true,})
end

-- treesj
if vim.loop.fs_stat(vim.fn.stdpath("data") .. "/lazy/treesj") then
	set("n", "<leader>m", require("treesj").toggle)
	set("n", "<leader>M",
	function()
		require("treesj").toggle({
			split = {
				recursive = true
			}
		})
	end
	)
end

