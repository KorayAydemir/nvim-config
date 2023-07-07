vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- 0 means :! commands you use like :!mkdir in netrw apply in the curr dir
-- netrw is in. 1 means they apply in the pwd.
vim.g.netrw_keepdir = 0
vim.opt.autochdir = false
vim.g.netrw_winsize = 30
vim.g.netrw_browse_split = 4

vim.opt.termguicolors = true
vim.cmd("set numberwidth=1")

vim.opt.updatetime = 1000

vim.opt.colorcolumn = "80"

-- "I" to display the banner.
vim.g.netrw_banner= 0

-- do not continue comment lines automatically
vim.cmd [[autocmd FileType * set formatoptions-=cro]]

