local plugins = {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
          dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-context' },


    {"ThePrimeagen/harpoon"},
    {"tpope/vim-fugitive"},
    {"mbbill/undotree"},
    {"windwp/nvim-ts-autotag"},
	{"lervag/vimtex"},

    {"eandrju/cellular-automaton.nvim"},
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
    {"folke/neodev.nvim"},

	{"rafamadriz/friendly-snippets"},

	{ "folke/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
	{"mhartington/formatter.nvim"},
	{"zbirenbaum/copilot.lua"},
    {"f-person/git-blame.nvim"},

	{"folke/zen-mode.nvim"},
	{"folke/twilight.nvim"},
	{"norcalli/nvim-colorizer.lua"},
	{"nullchilly/fsread.nvim"},

    { 'rose-pine/neovim', name = 'rose-pine' },
    {"dotsilas/darcubox-nvim"},

	{"andweeb/presence.nvim"},

	{"eandrju/cellular-automaton.nvim"},

    {"ggandor/leap.nvim"},
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

require("lazy").setup(plugins)

	--use("hrsh7th/cmp-nvim-lua") -- look for it
require("rose-pine").setup({
	disable_background = true,
	disable_float_background = true,
})
