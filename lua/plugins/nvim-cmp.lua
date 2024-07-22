local function nvim_cmp_config()
	local cmp = require("cmp")
	local ls = require("luasnip")

	local opts = {
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "nvim_lua" },
			{ name = "buffer", keyword_length = 3 }, -- wat this
		},
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		mapping = cmp.mapping.preset.insert({
			["S-Tab"] = nil,
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-e>"] = cmp.mapping.abort(),
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),

			["<C-p>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_prev_item({ behavior = "select" })
				else
					cmp.complete()
				end
			end),
			["<C-n>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_next_item({ behavior = "select" })
				else
					cmp.complete()
				end
			end),

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
		}),

		snippet = {
			expand = function(args)
				ls.lsp_expand(args.body)
			end,
		},
		enabled = function()
			local context = require("cmp.config.context")
			if vim.api.nvim_get_mode().mode == "c" then
				return true
			else
				if vim.bo.buftype == "prompt" then
					return false
				end
				return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
			end
		end,
	}

	cmp.setup(opts)
end

return {
	{ "hrsh7th/nvim-cmp", config = nvim_cmp_config },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
}
