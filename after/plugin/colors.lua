function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) 
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils("rose-pine")
-- options:
-- fluoromachine ( also has 3 more options in lazy.lua ) 
-- rose-pine
----------------

vim.cmd([[hi Comment guifg='red' ]])

-- Blame line
vim.g.gitblame_highlight_group = "GitBlame"
vim.cmd[[hi GitBlame guifg='#aaaaaa' guibg=none]]

-- Status line
vim.cmd([[hi StatusLine guifg='#fdfdfd' guibg='#a0a0a0']])

