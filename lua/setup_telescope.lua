
local builtin = require('telescope.builtin')
local set = vim.keymap.set

set('n', '<C-p>', builtin.find_files, {})
set('n', '<leader>fg', builtin.live_grep, {})
set('n', ',b', builtin.buffers, {})
--set('n', '<leader>fh', builtin.help_tags, {)
set('n', ',f', builtin.jumplist, {silent = true,})

require("telescope").load_extension "file_browser";
