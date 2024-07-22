return {
	"mikesmithgh/kitty-scrollback.nvim",
	enabled = true,
	lazy = true,
	cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
	event = { "User KittyScrollbackLaunch" },
	version = "^4.0.0",
	config = function()
		require("kitty-scrollback").setup()
		vim.opt.wrap = true
	end,
}
