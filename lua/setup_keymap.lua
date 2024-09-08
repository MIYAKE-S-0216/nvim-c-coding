local set = vim.keymap.set

--vim.g.mapleader = " "

set("n", "<A-j>", "gj")
set("n", "<A-k>", "gk")

set('n', '<C-q>', '<Cmd>:ccl<CR>',				{silent = true,})
set('n', '<C-n>', '<Cmd>:nohlsearch<CR><Esc>',	{silent = true,})
