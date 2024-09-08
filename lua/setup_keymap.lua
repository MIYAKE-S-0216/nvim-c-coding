local set = vim.keymap.set

--vim.g.mapleader = " "

set("n", "<A-j>", "gj")
set("n", "<A-k>", "gk")
set("i", "<C-s>", "<Cmd>:w<CR>")
set("n", "<C-s>", "<Cmd>:w<CR>")

set('n', '<C-q>', '<Cmd>:ccl<CR>',				{silent = true,})
set('n', '<C-n>', '<Cmd>:nohlsearch<CR><Esc>',	{silent = true,})

-- -- gtags.vim
-- if vim.loop.fs_stat(vim.fn.stdpath("data") .. "/lazy/gtags.vim") then
-- 	set('n', '<C-g>', ':Gtags ',				{})
-- 	set('n', '<C-j>', '<Cmd>:GtagsCursor<CR>',	{silent = true,})
-- 	set('n', '<C-h>', '<Cmd>:Gtags -f %<CR>',	{silent = true,})
--
-- 	set('n', 'J', '<Cmd>:cn<CR>', {silent = true,})
-- 	set('n', 'K', '<Cmd>:cp<CR>', {silent = true,})
-- end

-- LSP のキーマップの設定
local opts = { noremap=true, silent=true }	-- オプションの設定
vim.api.nvim_set_keymap('n', '<C-]>',	'<cmd>lua vim.lsp.buf.declaration()<CR>',		opts)	-- 宣言にジャンプ
vim.api.nvim_set_keymap('n', '<C-j>',		'<cmd>lua vim.lsp.buf.definition()<CR>',		opts)	-- 定義にジャンプ
vim.api.nvim_set_keymap('n', '<C-k>',		'<cmd>lua vim.lsp.buf.references()<CR>',		opts)	-- 参照を検索
vim.api.nvim_set_keymap('n', 'gi',		'<cmd>lua vim.lsp.buf.implementation()<CR>',	opts)	-- 実装にジャンプ
vim.api.nvim_set_keymap('n', 'K',		'<cmd>lua vim.lsp.buf.hover()<CR>',				opts)	-- ホバー

