local toggle_opts = { ui_width_ratio = vim.api.nvim_win_get_width(0) }

local opts = { settings = {
	save_on_toggle = true,
} }

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = opts,
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
		},
		{
			"<C-e>",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list(), toggle_opts)
			end,
		},
		{
			"<leader>hw",
			function()
				require("harpoon"):list():select(1)
			end,
		},
		{
			"<leader>he",
			function()
				require("harpoon"):list():select(2)
			end,
		},
		{
			"<leader>hr",
			function()
				require("harpoon"):list():select(3)
			end,
		},
		{
			"<leader>hf",
			function()
				require("harpoon"):list():select(4)
			end,
		},
	},
}
