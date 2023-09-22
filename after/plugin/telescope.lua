local builtin = require("telescope.builtin")
local action_layout = require("telescope.actions.layout")
local dropdown = require("telescope.themes").get_dropdown({ hidden = true, follow = true })

--require("telescope").setup {
--  defaults = {
--    wrap_results = true,
--    sorting_strategy = "ascending"
--  },
--  pickers = {
--    oldfiles = {
--      initial_mode = "normal"
--    }
--  }
--}

require("telescope").setup({
	defaults = {
        wrap_results = true,
		file_ignore_patterns = { ".git" },
		layout_strategy = "vertical",
		layout_config = {
			vertical = {
                width = 100,
                height = 100,
                preview_height = 0.5,
                preview_cutoff = 0,
            },
		},
		mappings = {
			i = {
				["?"] = action_layout.toggle_preview,
			},
		},
	},
})

-- Search string in :h
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

-- List previously open files
vim.keymap.set("n", "<leader>of", builtin.oldfiles, {})

-- Open telescope from where you left off
vim.keymap.set("n", "<C-p>", builtin.resume, {})

--================== FILE SEARCHING ==================
-- List files in cwd, respects .gitignore
vim.keymap.set("n", "<leader>pf", function()
	builtin.find_files(dropdown)
end)
-- Small window 
vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({ hidden = true, follow = true })
end, {})
-- List staged files, respects .gitignore
vim.keymap.set("n", "<C-n>", builtin.git_files, {})
-- Small window
vim.keymap.set("n", "<C-j>", function()
	builtin.git_files(dropdown)
end)
--================== FILE SEARCHING ==================

--================== GREP SEARCHING ==================
-- Search input in current working directory, respects .gitignore
vim.keymap.set("n", "<leader>gr", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
-- Live search in current working directory, respects .gitignore
vim.keymap.set("n", "<leader>gl", builtin.live_grep, {})
-- mini window
vim.keymap.set("n", "<leader>mgl", function()
	builtin.live_grep(dropdown)
end)
-- Search word under cursor
vim.keymap.set("n","<leader>pw", function()
  builtin.grep_string { search = vim.fn.expand("<cword>") }
end)
--================== GREP SEARCHING ==================

--================== GIT SEARCHING ==================
-- Lists current changes per file with diff preview and add action. (
vim.keymap.set("n", "<leader>gst", builtin.git_status, {})

--
-- List all branches with log preview,
-- checkout action <cr>,
-- track action <C-t>,
-- rebase action<C-r>,
-- create action <C-a>,
-- switch action <C-s>,
-- delete action <C-d>,
-- merge action <C-y>
vim.keymap.set("n", "<leader>gbr", builtin.git_branches, {})

--
-- Lists git commits with diff preview,
-- checkout action <cr>,
-- reset mixed <C-r>m,
-- reset soft <C-r>s,
-- reset hard <C-r>h
vim.keymap.set("n", "<leader>gcm", builtin.git_commits, {})
-- List buffer's git commits with diff preview and check them out on <cr>
vim.keymap.set("n", "<leader>gbc", builtin.git_bcommits, {})
--

vim.keymap.set("n", "<leader>planets", builtin.planets, {})
vim.keymap.set("n", "<leader>tp", builtin.builtin, {})
vim.keymap.set("n", "<leader>ic", builtin.lsp_incoming_calls, {})
-- marks
vim.keymap.set("n", "<leader>tm", builtin.marks, {})
