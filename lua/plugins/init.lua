return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "folke/twilight.nvim", cmd = "Twilight" },
	{
		"vyfor/cord.nvim",
		build = vim.fn.has("macunix") and "./build" or ".\\build",
		event = "VeryLazy",
		opts = {},
	},
}
