function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	-- commented cuz i set transparency from rosepine config already.
	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils("rose-pine")

-- line numbers white for visibility
vim.cmd([[hi LineNr guibg=none guifg=none]])
vim.cmd([[hi Comment guifg='red' ]])

-- Blame line
vim.g.gitblame_highlight_group = "GitBlame"
vim.cmd[[hi GitBlame guifg='#aaaaaa' guibg=none]]

