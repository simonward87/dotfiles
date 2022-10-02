vim.opt.backup = false -- stop auto-creating backups
vim.opt.clipboard:append("unnamedplus") -- use mac system clipboard by default
vim.opt.completeopt = { "menuone", "longest", "noinsert", "noselect" } -- text completion
vim.opt.cursorline = true -- highlight current line
vim.opt.expandtab = true -- insert spaces for tabs
vim.opt.fillchars = "eob: " -- hide end of buffer characters
vim.opt.guicursor = "" -- use block cursor
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.iskeyword:append("-") -- treat split words as single words
vim.opt.laststatus = 0 -- resets custom status-line colours
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.ruler = false -- hide character and line number ruler
vim.opt.scrolloff = 8 -- vertical scroll boundaries
vim.opt.sidescrolloff = 12 -- horizontal scroll boundaries
vim.opt.smartcase = true -- smart case-insensitive search
vim.opt.softtabstop = 4 -- number of spaces used in place of a tab when 'expandtab' is enabled
vim.opt.shiftwidth = 4 -- number of spaces to use for auto-indent
vim.opt.swapfile = false -- stop auto-creating swap-files
vim.opt.termguicolors = true
vim.opt.tabstop = 4 -- the width of a hard-tab measured in spaces
vim.opt.undofile = true -- create undo files
vim.opt.wrap = false -- no line-wrapping

-- vim.opt.cmdheight = 0 -- hides command line when not active
-- vim.opt.signcolumn = "number" -- combine signcolumn into number column
-- vim.opt.spell = true -- spellcheck comments
