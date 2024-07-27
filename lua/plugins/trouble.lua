return {
	"folke/trouble.nvim",
	config = true,
	keys = {
		{ "<leader>tt", function() require("trouble").toggle("diagnostics") end },
	},
}

