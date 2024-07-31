local function config()
    vim.cmd.colorscheme("gruvbox")

    --vim.cmd([[hi Comment guifg='red' ]])
    vim.cmd([[hi Comment guifg='#fddddd' ]])

    vim.g.gitblame_highlight_group = "GitBlame"
    vim.cmd([[hi GitBlame guifg='#aaaaaa' guibg=none]])

    vim.cmd([[hi StatusLine guifg='#fdfdfd' guibg='#a0a0a0']])
end

return { "morhetz/gruvbox", priority = 100, config = config }
