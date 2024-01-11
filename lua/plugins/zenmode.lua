vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle(
        {
            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 140,
                height = 1,
                options = {
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,  -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                },
                twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = false }, -- disables git signs
                -- this will change the font size on alacritty when in zen mode
                -- requires  Alacritty Version 0.10.0 or higher
                -- uses `alacritty msg` subcommand to change font size
            },
            -- callback where you can add custom code when the Zen window opens
            on_open = function(win)
            end,
            -- callback where you can add custom code when the Zen window closes
            on_close = function()
            end,
        }
    )
end)



vim.keymap.set("n", "<leader>zZ", function()
    require("zen-mode").toggle(
        {
            window = {
                backdrop = 0.95,
                width = 140,
                height = 1,
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,  -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                },
                twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = false }, -- disables git signs
            },
            on_open = function(win)
            end,
            on_close = function()
            end,
        }
    )
end)
