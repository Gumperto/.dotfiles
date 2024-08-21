local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    file_ignore_patterns = {}, -- Add any patterns you want to ignore
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--hidden", "--files" } -- Include hidden files
    }
  }
}

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>gr", function()
	builtin.grep_string({ search = vim.fn.input("Grep >>> ") })
end)

local harpoon = require('harpoon')
harpoon:setup({})

require("telescope").load_extension("fzf")
