local plugins = {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
          dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', event="VeryLazy" },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-context' },


    {"ThePrimeagen/harpoon"},
    {"tpope/vim-fugitive", event="VeryLazy"},
    {"mbbill/undotree", event="VeryLazy"},
    {"windwp/nvim-ts-autotag", event="VeryLazy"},
	{"lervag/vimtex", event="VeryLazy"},

    { "eandrju/cellular-automaton.nvim", event="VeryLazy" },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},           -- Optional
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
		  {'saadparwaiz1/cmp_luasnip'}, -- Required
        }
    },
    {"folke/neodev.nvim", event="VeryLazy"},

	{"rafamadriz/friendly-snippets", event="VeryLazy"},

	{ "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
	{"mhartington/formatter.nvim"},
	{"zbirenbaum/copilot.lua"},
    {"f-person/git-blame.nvim", event="VeryLazy"},

	{"folke/zen-mode.nvim"},
	{"folke/twilight.nvim", event="VeryLazy"},
	{"norcalli/nvim-colorizer.lua"},
	{"nullchilly/fsread.nvim", event="VeryLazy"},

    { 'rose-pine/neovim', name = 'rose-pine', config = {
            disable_background=true,
            disable_float_background=true
        }
    },
    {"dotsilas/darcubox-nvim", event="VeryLazy"},

	{"andweeb/presence.nvim", event="VeryLazy"},

	{"eandrju/cellular-automaton.nvim"},

    {"hrsh7th/cmp-nvim-lua", event="VeryLazy"}
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

require("lazy").setup(plugins,{
    defaults = {
      lazy = true, -- should plugins be lazy-loaded?
    },
  }
)
