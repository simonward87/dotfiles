vim.opt.backup = false -- stop autocreating backups
vim.opt.clipboard:append("unnamedplus") -- use mac system clipboard by default
vim.opt.completeopt = { "menuone", "longest", "noinsert", "noselect" } -- text completion
vim.opt.cursorline = true -- highlight current line
vim.opt.expandtab = true -- insert spaces for tabs
vim.opt.hlsearch = false -- highlight doesn't persist after search
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.iskeyword:append("-") -- treat split words as single words
vim.opt.laststatus = 1 -- resets custom statusline colours
vim.opt.nu = true -- line numbers
vim.opt.rnu = true -- relative line numbers
vim.opt.scrolloff = 4 -- vertical scroll boundaries
vim.opt.sidescrolloff = 12 -- horizontal scroll boundaries
vim.opt.signcolumn = "auto" -- combine signcolumn into number column
vim.opt.smartcase = true -- smart case-insensitive search
vim.opt.sts = 4 -- number of spaces used in place of a tab when expandtab is enabled
vim.opt.sw = 4 -- number of spaces to use for autoindent
vim.opt.swf = false -- stop autocreating swapfiles
vim.opt.termguicolors = true
vim.opt.ts = 4 -- the width of a hardtab measured in spaces
vim.opt.undofile = true -- create undo files
vim.opt.wrap = false -- no line-wrapping

vim.g["hardtime_default_on"] = 1 -- limit hjkl use by default
-- vim.g["gruvbox_material_palette"] = "mix"
