local toggle_opts = { ui_width_ratio = vim.api.nvim_win_get_width(0) }

local opts = { settings = {
	save_on_toggle = true,
} }

--local function keys()
--    local harpoon = require("harpoon")
--    return {
--		{
--			"<leader>a",
--			function()
--				harpoon:list():add()
--			end,
--		},
--		{
--			"<C-e>",
--			function()
--				harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
--			end,
--		},
--		{
--			"<leader>hw",
--			function()
--				harpoon:list():select(1)
--			end,
--		},
--		{
--			"<leader>he",
--			function()
--				harpoon:list():select(2)
--			end,
--		},
--		{
--			"<leader>hr",
--			function()
--				harpoon:list():select(3)
--			end,
--		},
--		{
--			"<leader>hf",
--			function()
--				harpoon:list():select(4)
--			end,
--		},
--	}
--end



local function config()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>hw", function() harpoon:list():select(1) end)
end


return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
    config = config,
	keys = {
        "<leader>a",
        "<C-e>",
        "<leader>hw"
    },
}
