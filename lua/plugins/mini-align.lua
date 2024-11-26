return {
	"echasnovski/mini.align",
	version = "*",
	config = true,
	opts = {
		mappings = {
			start = "<leader>x",
			start_with_preview = "<leader>L",
		},
	},
	keys = {
		{ "<leader>a", mode = { "v" } },
		{ "<leader>L", mode = { "v" } },
	},
}
