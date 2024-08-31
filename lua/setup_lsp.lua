-- Mason のセットアップ
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" }, -- C 言語用の LSP サーバーを指定
})

-- LSP のセットアップ
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {
	cmd = { "clangd" },
	--cmd = { "clangd", "--compile-commands-dir=./compile_flags.txt" },
	fallbackFlags = { "-std=c11" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
	settings = {
		clangd = {
			-- Clangd の特定の設定をここに追加
		}
	}
}

-- nvim-cmp のセットアップ
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn"vsnip#anonymous"
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmdline" },
  },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
})

-- キーマップの設定
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

