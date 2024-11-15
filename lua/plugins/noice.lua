local function config()
	require("noice").setup({
		lsp = {
			-- hover = { enabled = false },
			signature = { auto_open = { enabled = false } },
			-- message = { enabled = false },
			-- smart_move = { enabled = false },
			progress = { enabled = false },
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		messages = { enabled = false },
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			-- long_message_to_split = true,
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	})
end
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = config,
}
