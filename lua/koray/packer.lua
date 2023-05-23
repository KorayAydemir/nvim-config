-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")

	use("ThePrimeagen/harpoon")
	use("tpope/vim-fugitive")
	use("mbbill/undotree")

	use("mrjones2014/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")

	use("lervag/vimtex")

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "saadparwaiz1/cmp_luasnip" }, -- Required
		},
	})
	use("hrsh7th/cmp-nvim-lua")
	use("rafamadriz/friendly-snippets")
	use("mhartington/formatter.nvim")
	use("github/copilot.vim")

	use("norcalli/nvim-colorizer.lua")

	use({ "rose-pine/neovim", as = "rose-pine" })
	require("rose-pine").setup({
		disable_background = true,
		disable_float_background = true,
	})
	vim.cmd("colorscheme rose-pine")

	use("andweeb/presence.nvim")

	use("eandrju/cellular-automaton.nvim")
end)
