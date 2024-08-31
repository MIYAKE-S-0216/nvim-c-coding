local set = vim.keymap.set

set('n', '<C-g>', ':Gtags ',				{})
set('n', '<C-j>', '<Cmd>:GtagsCursor<CR>',	{silent = true,})
set('n', '<C-h>', '<Cmd>:Gtags -f %<CR>',	{silent = true,})

set('n', 'J', '<Cmd>:cn<CR>', {silent = true,})
set('n', 'K', '<Cmd>:cp<CR>', {silent = true,})

