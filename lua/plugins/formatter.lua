local function config()
    local util = require("formatter.util")

    local function prettier()
        return {
            exe = "prettierd",
            args = {
                --"--plugin=prettier-plugin-tailwindcss",
                "--tab-width=4",
                util.escape_path(util.get_current_buffer_file_path()),
            },
            stdin = true,
        }
    end

    local opts = {
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
            lua = {
                require("formatter.filetypes.lua").stylua,

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
            java = {
                function()
                    return {
                        exe = "google-java-format",
                        args = {
                            "--aosp",
                            util.escape_path(util.get_current_buffer_file_path()),
                        },
                        stdin = false,
                    }
                end,
            },
            c = {
                require("formatter.filetypes.c").clangformat,
            },
            ["js"] = {
                prettier,
            },
            html = { prettier },
            css = { prettier },
        },
    }

    require("formatter").setup(opts)
end

local function format_and_save()
	vim.cmd("FormatWrite")
end

return {
	"mhartington/formatter.nvim",
    config = config,
	keys = {{
		"<leader>fr",
		format_and_save,
		{ silent = true },
    }},
}
