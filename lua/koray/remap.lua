vim.g.mapleader = " "
-- Lex opens in pwd dir, Vex opens in the current file's dir
vim.keymap.set("n", "<leader>pc", function() vim.cmd("Lex!") end)
vim.keymap.set("n", "<leader>pv", function() vim.cmd("Vex!") end)
-- set current dir as the current file.
vim.keymap.set("n", "<leader>cd", ":cd %:h<CR>")

-- move things around
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("x", "<leader>p", [["_dP]]) --paste to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete to void register

-- replace the word you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>rain", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>life", "<cmd>CellularAutomaton game_of_life<CR>")

vim.keymap.set("t", "<C-[>", "<C-\\><C-N>", {})
