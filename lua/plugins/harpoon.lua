local toggle_opts = { ui_width_ratio = vim.api.nvim_win_get_width(0) }

local opts = { settings = {
	save_on_toggle = true,
} }

local function keys()
    local harpoon = require("harpoon")
    return {
		{
			"<leader>a",
			function()
				harpoon:list():add()
			end,
		},
		{
			"<C-e>",
			function()
				harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
			end,
		},
		{
			"<leader>hw",
			function()
				harpoon:list():select(1)
			end,
		},
		{
			"<leader>he",
			function()
				harpoon:list():select(2)
			end,
		},
		{
			"<leader>hr",
			function()
				harpoon:list():select(3)
			end,
		},
		{
			"<leader>hf",
			function()
				harpoon:list():select(4)
			end,
		},
	}
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = opts,
	keys = keys,
}
