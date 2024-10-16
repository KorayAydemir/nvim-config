return {
	"echasnovski/mini.align",
	version = "*",
	config = true,
	opts = {
		mappings = {
			start = "<leader>l",
			start_with_preview = "<leader>L",
		},
	},
	keys = {
		{ "<leader>l", mode = { "n", "v" } },
		{ "<leader>L", mode = { "n", "v" } },
	},
}
