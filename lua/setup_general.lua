-- 記述を簡略化
local opt = vim.opt	-- vim.optの省略

-- 文字エンコード
vim.scriptencoding = 'utf-8'	-- スクリプトの文字エンコード
opt.encoding = 'utf-8'			-- バッファの文字エンコード
opt.fileencodings = {'utf-8', 'sjis', 'cp932'}	-- ファイルの文字エンコード

--[[
基本設定
--]]

-- 行番号表示
opt.number = true			-- 行番号表示 : 有効
vim.wo.number = true		-- 行番号表示（ウィンドウごと）: 有効
opt.relativenumber = true	-- 相対行番号表示 : 有効

-- インデント
opt.autoindent = true		-- 自動インデント : 有効
opt.smartindent = true		-- スマートインデント : 有効

-- カーソル行ハイライト
opt.cursorline = true		-- カーソル行ハイライト : 有効

-- TABの設定
opt.shiftwidth = 4			-- シフト幅	: 4
opt.tabstop = 4				-- タブ幅	: 4
opt.expandtab = false		-- タブをスペースに変換 : 無効

opt.termguicolors = true	-- ターミナルの色 : 24ビットカラー

opt.mouse = 'a'			-- マウス操作 : 有効
opt.title = true		-- タイトルの設定 : 有効
opt.hlsearch = true		-- 検索時のハイライト : 有効
opt.backup = false		-- バックアップファイルの作成 : 無効
opt.showcmd = true		-- コマンドラインの表示 : 有効
opt.cmdheight = 2		-- コマンドラインの高さ : 2行
opt.laststatus = 2		-- ステータスラインの表示 : 常に表示
opt.scrolloff = 10		-- スクロール時のオフセット : 10行
-- opt.shell = 'fish'
opt.inccommand = 'split'	-- コマンドライン補完時の表示 : 分割
opt.ignorecase = true 	-- 検索時の大文字小文字の無視 : 有効
opt.smarttab = true		-- スマートタブ : 有効
opt.breakindent = true	-- 折り返し時のインデント : 有効
opt.wrap = true 		-- 折り返し : 有効
opt.helplang = 'ja', 'en'	-- ヘルプ言語 : 日本語、英語
opt.updatetime = 300	-- アップデート時間 : 300ms
opt.showtabline = 4		-- タブラインの表示 : 常に表示
opt.clipboard:append({ "unnamed", "unnamedplus" })	-- クリップボードの設定 : システムクリップボードを使用
opt.signcolumn = 'yes'	--行数表示の横に余白を追加
opt.hidden = true		-- バッファを隠すことができる
opt.swapfile = false	-- スワップファイルを生成しない

opt.guifont="Cica:h16"
