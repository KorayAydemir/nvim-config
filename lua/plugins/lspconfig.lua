require("mason").setup({})
require("mason-lspconfig").setup({
    -- rust-analyzer should be installed via rustup!
    ensure_installed = { "tsserver", "eslint", "lua_ls", "bashls", "lua_ls" },
})

require("neodev").setup({})
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
        ["rust-analyzer"] = {},
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
lspconfig.dartls.setup({
    capabilities = capabilities,
})
lspconfig.clangd.setup({
    capabilities = capabilities,
})
lspconfig.htmx.setup({
    capabilities = capabilities,
})

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

------------ flutter
-- debugger setup: https://medium.com/indian-coder/supercharge-flutter-with-neovim-a-complete-setup-guide-cbe5cbf5b073

-- alternatively you can override the default configs
--require("flutter-tools").setup {
--  debugger = { -- integrate with nvim dap + install dart code debugger
--    enabled = false,
--    run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
--    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
--    -- see |:help dap.set_exception_breakpoints()| for more info
--    exception_breakpoints = {}
--  },
--  closing_tags = {
--    highlight = "ErrorMsg", -- highlight for the closing tag
--    prefix = ">", -- character to use for close tag e.g. > Widget
--    enabled = true -- set to false to disable
--  },
--  dev_log = {
--    enabled = true,
--    notify_errors = false, -- if there is an error whilst running then notify the user
--    open_cmd = "tabedit", -- command to use to open the log buffer
--  },
--  dev_tools = {
--    autostart = false, -- autostart devtools server if not detected
--    auto_open_browser = false, -- Automatically opens devtools in the browser
--  },
--  outline = {
--    open_cmd = "30vnew", -- command to use to open the outline buffer
--    auto_open = false -- if true this will open the outline automatically when it is first populated
--  },
--}
