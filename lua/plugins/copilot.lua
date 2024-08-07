local opts = {
	panel = {
		enabled = true,
		auto_refresh = false,
		keymap = {
			jump_prev = "[[",
			jump_next = "]]",
			accept = "<CR>",
			refresh = "gr",
			open = "<M-CR>",
		},
		layout = {
			position = "bottom", -- | top | left | right
			ratio = 0.4,
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<C-a>",
			accept_word = false,
			accept_line = false,
			next = "<C-1>",
			prev = "<C-2>",
			dismiss = "<C-r>",
		},
	},
	filetypes = {
		yaml = false,
		markdown = true,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = true,
	},
	copilot_node_command = "node", -- Node.js version must be > 16.x
	server_opts_overrides = {},
}

return { "zbirenbaum/copilot.lua", opts = opts, event = "InsertEnter" }
