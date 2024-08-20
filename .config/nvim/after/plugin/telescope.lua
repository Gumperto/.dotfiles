local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>gr", function()
	builtin.grep_string({ search = vim.fn.input("Grep >>> ") })
end)

local harpoon = require('harpoon')
harpoon:setup({})

require("telescope").load_extension("fzf")
