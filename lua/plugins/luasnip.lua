local function config()
	local ls = require("luasnip")
	local types = require("luasnip.util.types")

    ls.filetype_extend("javascript", {"javascriptreact"})
    ls.filetype_extend("typescript", {"typescriptreact"})
	require("luasnip.loaders.from_vscode").lazy_load()

	ls.config.set_config({
		-- This tells LuaSnip to remember to keep around the last snippet.
		-- You can jump back into it even if you move outside of the selection
		history = false,
		region_check_events = "InsertEnter",
		delete_check_events = "TextChanged,InsertLeave",

		-- This one is cool cause if you have dynamic snippets, it updates as you type!
		updateevents = "TextChanged,TextChangedI",

		-- Autosnippets:
		enable_autosnippets = true,

		-- Crazy highlights!!
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { " « ", "NonTest" } },
				},
			},
		},
	})

    vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        require("luasnip").jump(-1)
    end, { desc = "LuaSnip backward jump" })
end

return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = config,
        event = "InsertEnter"
	},
}
