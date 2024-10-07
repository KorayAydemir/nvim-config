local function config()
	require("noice").setup({
		lsp = {
			progress = { enabled = false },
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			-- bottom_search = true, -- use a classic bottom cmdline for search
            -- long_message_to_split = true,
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	})
end
return { "folke/noice.nvim", event = "VeryLazy", dependencies = { "MunifTanjim/nui.nvim" }, config = config }
