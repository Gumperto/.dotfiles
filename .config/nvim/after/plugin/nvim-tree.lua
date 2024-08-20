-- REQUIRED
require"nvim-tree".setup()
-- REQUIRED

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
