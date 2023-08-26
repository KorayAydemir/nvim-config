local lsp = require("lsp-zero")
lsp.preset("recommended")
local ls = require("luasnip")

local telescope = require("telescope.builtin")

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.ensure_installed({ "tsserver", "eslint", "lua_ls", "rust_analyzer", "bashls" })

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			fallback()
		elseif ls.expand_or_jumpable() then
			ls.expand_or_jump()
		else
			fallback()
		end
		cmp.mapping.select_next_item()
	end, { "i", "s" }),
})

cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

cmp.setup({
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "luasnip", keyword_length = 2 },
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer", keyword_length = 3 },
	},
    enabled = function ()
            local context = require 'cmp.config.context'
            if vim.api.nvim_get_mode().mode == 'c' then
              return true
            else
              return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>e", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	--quickfix
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		telescope.lsp_references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
		ls.jump(-1)
	end, { desc = "LuaSnip backward jump" })
    vim.keymap.set('n', '<c-w>d', ':vs<cr>:lua vim.lsp.buf.definition()<cr>zt')

	-- we use prettierd lsp.buffer_autoformat()
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
