vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf, remap = false }

		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

		vim.keymap.set("n", "<space>vfr", function() vim.lsp.buf.format({ async = true }) end, opts)

		vim.keymap.set("n", "<c-w>d", ":vs<cr>:lua vim.lsp.buf.definition()<cr>zt")
	end,
})

return {
	{ "neovim/nvim-lspconfig", event = "VeryLazy" },
	{
		"williamboman/mason.nvim",
		config = true,
		cmd = "Mason",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- rust-analyzer should be installed via rustup!
			-- lua-language-server may need to be installed manually as well due to PATH problems.
			ensure_installed = { "tsserver", "lua_ls", "bashls" },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = require("cmp_nvim_lsp").capabilities,
					})
				end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = require("cmp_nvim_lsp").capabilities,
                        settings = {
                            Lua = {
                                workspace = {
                                    checkThirdParty = false,
                                },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,

                ["rust_analyzer"] = function()
                    require("lspconfig").rust_analyzer.setup({
                        capabilities = require("cmp_nvim_lsp").capabilities,
                        settings = {
                            ["rust-analyzer"] = {
                                check = { command = "clippy", allTargets = false },
                                imports = {
                                    granularity = {
                                        group = "module",
                                    },
                                    prefix = "self",
                                },
                                cachePriming = false,
                                cargo = {
                                    allTargets = false,
                                    buildScripts = {
                                        enable = false,
                                    },
                                },
                                procMacro = {
                                    enable = false,
                                },
                            },
                        },
                    })
                end,
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
    {
        "j-hui/fidget.nvim",
        event = "VeryLazy",
        config = true
    },
    {
        {
            "folke/lazydev.nvim",
            ft = "lua",
        },
    },
	{ "mfussenegger/nvim-jdtls", lazy = true },
}
