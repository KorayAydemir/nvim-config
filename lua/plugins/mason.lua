return {
	{
		"williamboman/mason.nvim",
		config = true,
        lazy = true,
        cmd = "Mason",
	},
	{
		"williamboman/mason-lspconfig.nvim",
        lazy = true,
		opts = {
			-- rust-analyzer should be installed via rustup!
			ensure_installed = { "tsserver", "lua_ls", "bashls" },
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
