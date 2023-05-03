local ls = require "luasnip"
local types = require("luasnip.util.types")

vim.keymap.set({ "i", "s" }, "<Tab>", function() ls.jump(1) end, { desc = "LuaSnip forward jump" })
vim.keymap.set({ "i", "s" }, "<S-Tab>", function() ls.jump(-1) end, { desc = "LuaSnip backward jump" })

ls.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection
    history = false,

    -- This one is cool cause if you have dynamic snippets, it updates as you type!
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    -- Crazy highlights!!
    -- #vid3
    -- ext_opts = nil,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " « ", "NonTest" } },
            },
        },
    },
}
