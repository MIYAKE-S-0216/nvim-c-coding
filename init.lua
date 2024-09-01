-- プラグインのロード
require("load_lazy-nvim")
require("load_plugins")

-- 一般的な設定
require("setup_general")

-- 各プラグインの設定
require("setup_keymap")
require("setup_lsp")
require("setup_telescope")
require("setup_treesitter")
require("setup_ui")
