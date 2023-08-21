local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>hw", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>he", function() ui.nav_file(2) end)

vim.keymap.set("n", "<leader>hr", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>hf", function() ui.nav_file(4) end)

local term = require("harpoon.term")
local saved_buffer = nil
local last_term_idx = nil
local function gotoTerminal(tid, save_buf)
    saved_buffer = save_buf and vim.fn.bufnr('%') or saved_buffer
    term.gotoTerminal(tid);
    last_term_idx = tid
    vim.api.nvim_command('startinsert')
end

local function isInTerminal()
    local current_buffer_name = vim.fn.bufname('%')
    return string.match(current_buffer_name, '^term')
end

local function toggleTerminal(open, other)
    if saved_buffer == nil then
        gotoTerminal(open, true)
    else
        if isInTerminal() then
            if last_term_idx == other then
                gotoTerminal(open)
            else
                vim.cmd('buffer ' .. saved_buffer)
            end
        else
            gotoTerminal(open, true)
        end
    end
end

vim.keymap.set({"n","t"}, "<C-0>", function() toggleTerminal(1,2) end)
vim.keymap.set({"n","t"}, "<C-9>", function() toggleTerminal(2,1) end)
