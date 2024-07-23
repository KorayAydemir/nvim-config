local function lsp_config()
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		settings = {
			Lua = {
				workspace = {
					checkThirdParty = false,
				},
			},
		},
	})
	lspconfig.eslint.setup({
		capabilities = capabilities,
	})
	lspconfig.tsserver.setup({
		capabilities = capabilities,
	})
	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy",
				},
			},
		},
	})
	lspconfig.tailwindcss.setup({
		capabilities = capabilities,
	})
	lspconfig.emmet_language_server.setup({
		capabilities = capabilities,
	})
	lspconfig.gopls.setup({
		capabilities = capabilities,
	})
	--lspconfig.golangci_lint_ls.setup({
	--    capabilities = capabilities,
	--})
	lspconfig.pyright.setup({
		capabilities = capabilities,
	})
	lspconfig.pylsp.setup({
		capabilities = capabilities,
	})
	lspconfig.clangd.setup({
		capabilities = capabilities,
	})
	lspconfig.htmx.setup({
		capabilities = capabilities,
	})
	lspconfig.csharp_ls.setup({
		capabilities = capabilities,
	})
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf, remap = false }
		local telescope = require("telescope.builtin")

		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vrr", telescope.lsp_references, opts)
		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

		vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
			require("luasnip").jump(-1)
		end, { desc = "LuaSnip backward jump" })

		vim.keymap.set("n", "<space>vfr", function()
			vim.lsp.buf.format({ async = true })
		end, opts)

		vim.keymap.set("n", "<c-w>d", ":vs<cr>:lua vim.lsp.buf.definition()<cr>zt")
	end,
})

return {
	{ "neovim/nvim-lspconfig", config = lsp_config },
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- rust-analyzer should be installed via rustup!
			ensure_installed = { "tsserver", "lua_ls", "bashls" },
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},

	{ "mfussenegger/nvim-jdtls" },

	{
		"L3MON4D3/LuaSnip",
		requires = { "rafamadriz/friendly-snippets" },
	},
	{ "saadparwaiz1/cmp_luasnip" },
	{ "folke/neodev.nvim" },
	{ "j-hui/fidget.nvim" },
}
