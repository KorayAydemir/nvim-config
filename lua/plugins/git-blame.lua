return {
	"f-person/git-blame.nvim",
	keys = {{
		"<leader>blame",
		function()
			vim.cmd("GitBlameToggle")
		end,
    }},
}
