local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
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
		tex = {
			function()
				return {
					exe = "latexindent",
					args = {
						"-g",
						"/dev/null",
					},
					stdin = true,
				}
			end,
		},
        dart = {
            function()
                return {
                    exe = "dart format",
                    stdin = true,
                }
            end,
        },
		["*"] = {
			function()
				return {
					exe = "prettierd",
					args = {
						-- configure prettier in project config file
						--"--plugin=prettier-plugin-tailwindcss",
						"--tab-width=4",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		},
	},
})

vim.keymap.set("n", "<leader>fr", function()
	vim.cmd("FormatWrite")
end, { silent = true })

-- auto format on save
-- vim.cmd([[augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost * FormatWrite
-- augroup END]])
