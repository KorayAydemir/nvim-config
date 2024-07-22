local opts = { menu = { width = vim.api.nvim_win_get_width(0) - 4 } }

--local function config()
--	local mark = require("harpoon.mark")
--	local ui = require("harpoon.ui")
--
--	vim.keymap.set("n", "<leader>a", mark.add_file)
--
--	vim.keymap.set("n", "<leader>hw", function()
--		ui.nav_file(1)
--	end)
--	vim.keymap.set("n", "<leader>he", function()
--		ui.nav_file(2)
--	end)
--
--	vim.keymap.set("n", "<leader>hr", function()
--		ui.nav_file(3)
--	end)
--	vim.keymap.set("n", "<leader>hf", function()
--		ui.nav_file(4)
--	end)
--
--	vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
--
--	local term = require("harpoon.term")
--	local saved_buffer = nil
--	local last_term_idx = nil
--	local function gotoTerminal(tid, save_buf)
--		saved_buffer = save_buf and vim.fn.bufnr("%") or saved_buffer
--		term.gotoTerminal(tid)
--		last_term_idx = tid
--		vim.api.nvim_command("startinsert")
--	end
--
--	local function isInTerminal()
--		local current_buffer_name = vim.fn.bufname("%")
--		return string.match(current_buffer_name, "^term")
--	end
--
--	local function toggleTerminal(open, other)
--		if saved_buffer == nil then
--			gotoTerminal(open, true)
--		else
--			if isInTerminal() then
--				if last_term_idx == other then
--					gotoTerminal(open)
--				else
--					vim.cmd("buffer " .. saved_buffer)
--				end
--			else
--				gotoTerminal(open, true)
--			end
--		end
--	end
--
--	vim.keymap.set({ "n", "t" }, "<leader>0", function()
--		toggleTerminal(1, 2)
--	end)
--	vim.keymap.set({ "n", "t" }, "<leader>9", function()
--		toggleTerminal(2, 1)
--	end)
--end

local function config()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	opts = opts,
	config = config,
	dependencies = { "nvim-lua/plenary.nvim" },
}
