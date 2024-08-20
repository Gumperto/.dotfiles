local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
   vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	
	-- Telescope & dependencies(?)
	{
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                          , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	},

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	
	-- Harpoon
	{
    	"ThePrimeagen/harpoon",
    	branch = "harpoon2",
    	dependencies = {
    	"nvim-lua/plenary.nvim",
		 "nvim-telescope/telescope.nvim",
		},
	},
	
	-- Undotree (version control)
	{ "mbbill/undotree" },

	-- File tree
	{
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
  	dependencies = {
		"nvim-tree/nvim-web-devicons",
  		},
	},

	-- Keybind suggestion
	{
	"folke/which-key.nvim",
	event = "VeryLazy",
  	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.icons",
			},
	opts = {},
	},

	-- LSP
	{
	"neovim/nvim-lspconfig",
    	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		},
	},

	-- pywal integration
	{
	"RedsXDD/neopywal.nvim",
        name = "neopywal",
        lazy = false,
   	    priority = 1000,
        opts = {},
	},

    -- statusline
    {
    "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Dashboard
    {
    'goolord/alpha-nvim',
    event = "VimEnter",
	dependencies = {
		"echasnovski/mini.files",
        "nvim-tree/nvim-web-devicons",
        },
    },

    -- Bufferline
    {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    }
})
