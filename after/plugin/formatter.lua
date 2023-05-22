local util = require("formatter.util")

require("formatter").setup({
	logging = false,
	filetype = {
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		rust = {
			function()
				return {
					exe = "rustfmt",
					args = {},
					stdin = true,
				}
			end,
		},
		["*"] = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = {
						"--tab-width=4",
						"--print-width=80",
						"--plugin=prettier-plugin-tailwindcss",
						vim.api.nvim_buf_get_name(0),
					},
					stdin = true,
				}
			end,
		},
		-- other formatters ...
	},
})

vim.cmd([[augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END]])
