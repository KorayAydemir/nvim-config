return {
	{
		"williamboman/mason.nvim",
		config = true,
        event = "VeryLazy"
	},
	{
		"williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
		opts = {
			-- rust-analyzer should be installed via rustup!
			ensure_installed = { "tsserver", "lua_ls", "bashls" },
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
