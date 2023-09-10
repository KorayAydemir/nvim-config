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
	-----------------------------------------------------------------

	---- LSP ----
	{ "hrsh7th/cmp-nvim-lua" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
			},
			{ "saadparwaiz1/cmp_luasnip" },
		},
	},
	{ "folke/neodev.nvim", event = "VeryLazy" },
	-----------------------------------------------------------------

	{ "mhartington/formatter.nvim" },
	{ "f-person/git-blame.nvim", event = "VeryLazy" },

	---- text decorations ----
	{ "norcalli/nvim-colorizer.lua" },
	{ "nullchilly/fsread.nvim", event = "VeryLazy" },
	{ "folke/twilight.nvim", event = "VeryLazy" },
	-----------------------------------------------------------------

	---- color schemes ----
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = {
			disable_background = true,
			disable_float_background = true,
		},
	},
	{ "dotsilas/darcubox-nvim", event = "VeryLazy" },
	{
		"maxmx03/FluoroMachine.nvim",
		config = {
			glow = true,
			theme = "fluoromachine", -- delta, fluoromachine, retrowave
			transparent = "all",
		},
	},
	-----------------------------------------------------------------

	---- extras ----
	{ "andweeb/presence.nvim", event = "VeryLazy" },
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
