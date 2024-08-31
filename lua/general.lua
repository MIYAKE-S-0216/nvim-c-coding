-- 記述を簡略化
local opt = vim.opt

-- 文字エンコード
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
vim.opt.fileencodings = {'utf-8', 'sjis', 'cp932'}

--[[
	基本設定
--]]

-- 行番号表示
opt.number = true
vim.wo.number = true
opt.relativenumber = true

-- インデント
opt.autoindent = true
opt.smartindent = true

-- カーソル行ハイライト
opt.cursorline = true

-- TABの設定
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = false


opt.termguicolors = true


vim.opt.mouse = 'a' --マウス操作を有効化
vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
-- vim.opt.shell = 'fish'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true 
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.wrap = true 
vim.opt.helplang = 'ja', 'en'
vim.opt.updatetime = 300
vim.opt.showtabline = 4
--vim.opt.clipboard = 'unnamedplus' --クリップボードとレジスタを共有
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
--vim.opt.clipboard=unamed,autoselect
vim.opt.signcolumn = 'yes' --行数表示の横に余白を追加
vim.opt.hidden = true
vim.opt.swapfile = false --スワップファイルを生成しない

vim.opt.guifont='Cica:h14'
