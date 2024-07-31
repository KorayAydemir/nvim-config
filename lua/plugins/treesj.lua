return {
	"Wansmer/treesj",
	keys = {
        { "<space>m", function() require("treesj").toggle() end },
    },
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	opts = {
		use_default_keymaps = false,
	},
}
