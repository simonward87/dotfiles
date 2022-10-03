vim.opt.backup = false
vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt = { "menuone", "longest", "noinsert", "noselect" }
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = "eob: "
vim.opt.ignorecase = true
vim.opt.iskeyword:append("-")
vim.opt.laststatus = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 12
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.undofile = true
vim.opt.wrap = false

-- vim.opt.cmdheight = 0 -- bugs when commiting with git fugitive plugin
-- vim.opt.guicursor = ""
-- vim.opt.signcolumn = "number" -- git signs plugin obstructs line numbers
-- vim.opt.spell = true -- works but only rudimentary spell checking
