vim.keymap.set("n", "<leader>blame", function() vim.cmd("GitBlameToggle") end)
vim.g.gitblame_enabled = 0
