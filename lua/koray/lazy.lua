local plugins = {
	---- highlighting ----
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	-----------------------------------------------------------------

	---- UTILS ----
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "ThePrimeagen/harpoon" },
	{ "folke/zen-mode.nvim" },

	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "mbbill/undotree", event = "VeryLazy" },
	{ "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
	{ "zbirenbaum/copilot.lua" },

	{ "windwp/nvim-ts-autotag", event = "VeryLazy" },
	{ "f-person/git-blame.nvim", event = "VeryLazy" },
	-----------------------------------------------------------------

	---- LSP ----
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "mfussenegger/nvim-jdtls" },

	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },

	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{ "saadparwaiz1/cmp_luasnip" },

	{ "folke/neodev.nvim", event = "VeryLazy" },

	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			--'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
		config = true,
	},

	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	}, -- progress bar for LSP
	-----------------------------------------------------------------
	{ "mhartington/formatter.nvim", event = "VeryLazy" },

	---- text decorations ----
	{ "norcalli/nvim-colorizer.lua" }, -- highlight #hex color codes
	{ "nullchilly/fsread.nvim", event = "VeryLazy" },
	{ "folke/twilight.nvim", event = "VeryLazy" },
	-----------------------------------------------------------------

	---- color schemes ----
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			-- usage 'main'|'moon'|'dawn'
			variant = "main",
			dark_variant = "main",
			disable_background = false,
			disable_float_background = true,
			highlight_groups = {
				Comment = { fg = "red" },
			},
		},
	},
	{
		"mikesmithgh/kitty-scrollback.nvim",
		enabled = true,
		lazy = true,
		cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
		event = { "User KittyScrollbackLaunch" },
		version = "^4.0.0", -- pin major version, include fixes and features that do not have breaking changes
		config = function()
			require("kitty-scrollback").setup()
			vim.opt.wrap = true
		end,
	},
	--{
	--	"maxmx03/FluoroMachine.nvim",
	--	config = {
	--		glow = true,
	--		theme = "fluoromachine", -- delta, fluoromachine, retrowave
	--		transparent = "all",
	--	},
	--}, { "vimpostor/vim-lumen" },

	-----------------------------------------------------------------

	---- extras ----
	{ "eandrju/cellular-automaton.nvim", event = "VeryLazy" },
	{ "lervag/vimtex", event = "VeryLazy" },
	-----------------------------------------------------------------
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, {
	defaults = {
		lazy = false, -- when true nvim cmp breaks for now, will learn about it later
	},
})
