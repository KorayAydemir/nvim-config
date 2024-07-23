return {
	"f-person/git-blame.nvim",
	keys = {{
		"<leader>blame",
		function()
			vim.cmd("GitBlameToggle")
		end,
    }},
	config = function()
		vim.g.gitblame_enabled = 0
	end,
}
