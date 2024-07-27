local config = function()
	local action_layout = require("telescope.actions.layout")
    local opts = nil
    opts = 'a'
	local opts = {
        defaults = {
            cache_picker = {
                num_pickers = 4
            }
        },
	--	defaults = {
	--		file_ignore_patterns = { ".git" },
	--		layout_strategy = "vertical",
	--		layout_config = {
	--			vertical = {
	--				width = 1,
	--				height = 1,
	--				preview_height = 0.5,
	--				preview_cutoff = 0,
	--			},
	--		},
	--	},
        pickers = {}
	}

	local builtin = require("telescope.builtin")
	local dropdown = require("telescope.themes").get_dropdown({ hidden = true, follow = true })

	-- List previously open files
	--vim.keymap.set("n", "<leader>of", builtin.oldfiles, {})

	----================== FILE SEARCHING ==================
	---- List files in cwd, respects .gitignore
	--vim.keymap.set("n", "<leader>pf", function() builtin.find_files(dropdown) end)
	---- Small window
	--vim.keymap.set("n", "<leader>ff", function() builtin.find_files({ hidden = true, follow = true }) end, {})
	---- Small window
	--vim.keymap.set("n", "<C-j>", function() builtin.git_files(dropdown) end)
	----================== FILE SEARCHING ==================

	----================== GREP SEARCHING ==================
	---- Search input in current working directory, respects .gitignore
	--vim.keymap.set("n", "<leader>gr", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)
	---- Live search in current working directory, respects .gitignore
	--vim.keymap.set("n", "<leader>gl", builtin.live_grep, {})

	---- Search word under cursor
	--vim.keymap.set("n", "<leader>pw", function() builtin.grep_string({ search = vim.fn.expand("<cword>") }) end)
	----================== GREP SEARCHING ==================

	----================== GIT SEARCHING ==================
	---- Lists current changes per file with diff preview and add action. (
	--vim.keymap.set("n", "<leader>gst", builtin.git_status, {})

	----
	---- List all branches with log preview,
	---- checkout action <cr>,
	---- track action <C-t>,
	---- rebase action<C-r>,
	---- create action <C-a>,
	---- switch action <C-s>,
	---- delete action <C-d>,
	---- merge action <C-y>
	--vim.keymap.set("n", "<leader>gbr", builtin.git_branches, {})

	----
	---- Lists git commits with diff preview,
	---- checkout action <cr>,
	---- reset mixed <C-r>m,
	---- reset soft <C-r>s,
	---- reset hard <C-r>h
	--vim.keymap.set("n", "<leader>gcm", builtin.git_commits, {})
	---- List buffer's git commits with diff preview and check them out on <cr>
	----

	--vim.keymap.set("n", "<leader>planets", builtin.planets, {})
	--vim.keymap.set("n", "<leader>tp", builtin.builtin, {})
	--vim.keymap.set("n", "<leader>ic", builtin.lsp_incoming_calls, {})
	---- marks
	--vim.keymap.set("n", "<leader>tm", builtin.marks, {})

	--vim.keymap.set("n", "<leader>vrr", builtin.lsp_references, {})

	require("telescope").setup(opts)
end

return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		config = config,
		version = "0.1.2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		keys = {
			-- Search output of `git ls-files` command. Shows only staged files, respects .gitignore
			{ "<leader>pf", function() require("telescope.builtin").git_files() end },
            -- Search all files in current working directory
			{ "<leader>pa", function() require("telescope.builtin").find_files() end },
            -- Search for the word under cursor
			{ "<leader>pw", function() require("telescope.builtin").grep_string() end },
            -- Search for the word under cursor, live
			{ "<leader>prg", function() require("telescope.builtin").live_grep() end },

            -- Search search history (/) and run on enter
			{ "<leader>hs", function() require("telescope.builtin").search_history() end },
            -- Search commands history and run on enter
			{ "<leader>hc", function() require("telescope.builtin").command_history() end },

            -- Search plugin/user commands
			{ "<leader>cm", function() require("telescope.builtin").commands() end },
            -- Search marks
			{ "<leader>pm", function() require("telescope.builtin").marks() end },

            -- Search jumplist
			{ "<leader>jl", function() require("telescope.builtin").jumplist() end },

            -- Search vim options and set on enter
			{ "<leader>po", function() require("telescope.builtin").vim_options() end },

            -- Search vim registers and paste on enter
			{ "<leader>po", function() require("telescope.builtin").registers() end },

            -- Live fuzzy search inside the current buffer
			{ "<leader>ps", function() require("telescope.builtin").current_buffer_fuzzy_find() end },

            -- List results of the previous picker
			{ "<leader>pi", function() require("telescope.builtin").resume() end },
            -- List results of the previous picker
			{ "<leader>pe", function() require("telescope.builtin").pickers() end },

            -- List incoming calls to word under cursor
			{ "<leader>ic", function() require("telescope.builtin").lsp_incoming_calls() end },

            -- List git status with diff preview
			{ "<leader>gs", function() require("telescope.builtin").git_status() end },

		},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
}
