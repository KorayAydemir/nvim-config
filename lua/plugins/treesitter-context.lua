local opts = {
    enable = true,
    max_lines = 5,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 1,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = '',
    zindex = 20,
}

return {
    "nvim-treesitter/nvim-treesitter-context",
    opts = opts
}
