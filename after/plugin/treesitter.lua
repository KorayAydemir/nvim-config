require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "css", "typescript", "html", "lua", "regex", "rust", "c", "tsx"  },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = false,

    ignore_install = {},

    modules = {},

	autotag = {
		enable = true,
	},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
