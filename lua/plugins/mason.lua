return {
	{
		"williamboman/mason.nvim",
		config = true,
        cmd = "Mason"
	},
	{
		"williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- rust-analyzer should be installed via rustup!
			-- lua-language-server may need to be installed manually as well due to PATH problems.
			ensure_installed = { "tsserver", "lua_ls", "bashls" },
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
