local neopywal = require("neopywal")

neopywal.setup({})

-- Emergency colorscheme in case 
-- colorscheme is bad for text editing (ert for emergency retheme; rt for retheme)

vim.api.nvim_set_keymap('n', '<leader>ert', ':colorscheme tokyonight-moon<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>rt', ':colorscheme neopywal<CR>', { noremap = true, silent = false })

vim.cmd.colorscheme("neopywal")
