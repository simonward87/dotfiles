vim.opt.backup = false -- stop autocreating backups
vim.opt.clipboard:append("unnamedplus") -- use mac system clipboard by default
vim.opt.completeopt = { "menuone", "longest", "noinsert", "noselect" } -- text completion
vim.opt.cursorline = true -- highlight current line
vim.opt.expandtab = true -- insert spaces for tabs
vim.opt.guicursor = "" -- use block cursor
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.iskeyword:append("-") -- treat split words as single words
vim.opt.laststatus = 0 -- resets custom statusline colours
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.ruler = false -- hide character and line number ruler
vim.opt.scrolloff = 8 -- vertical scroll boundaries
vim.opt.sidescrolloff = 12 -- horizontal scroll boundaries
vim.opt.signcolumn = "auto" -- combine signcolumn into number column
vim.opt.smartcase = true -- smart case-insensitive search
vim.opt.softtabstop = 4 -- number of spaces used in place of a tab when expandtab is enabled
vim.opt.shiftwidth = 4 -- number of spaces to use for autoindent
vim.opt.swapfile = false -- stop autocreating swapfiles
vim.opt.termguicolors = true
vim.opt.tabstop = 4 -- the width of a hardtab measured in spaces
vim.opt.undofile = true -- create undo files
vim.opt.wrap = false -- no line-wrapping
