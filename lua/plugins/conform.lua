return {
	"stevearc/conform.nvim",
	cmd = {
		"ConformInfo",
	},
	keys = {
		{
			"<leader>fr",
			function() require("conform").format({ async = true }) end,
			mode = { "v", "n" },
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		-- Set default options
		-- default_format_opts = {
		-- 	lsp_format = "fallback",
		-- },
		-- Set up format-on-save
		-- format_on_save = { timeout_ms = 500 },
		-- Customize formatters
		formatters = {
			prettierd = {
				prepend_args = { "--tab-width=4", "--print-width=100" },
			},
			prettier = {
				prepend_args = { "--tab-width=4" },
			},
		},
	},
}
