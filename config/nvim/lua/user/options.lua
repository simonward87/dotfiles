-- Sets sensible defaults. Running immediately allows defaults to be overriden as required
vim.cmd("runtime! plugin/sensible.vim")

vim.opt.backup = false -- stop autocreating backups
vim.opt.clipboard:append("unnamedplus") -- use mac system clipboard by default
vim.opt.completeopt = { "menuone", "longest", "noinsert", "noselect" } -- text completion
vim.opt.cursorline = true -- highlight current line
vim.opt.expandtab = true -- insert spaces for tabs
vim.opt.exrc = true -- allow local vimrc
vim.opt.termguicolors = true
vim.opt.hidden = true -- allow background unsaved buffers
vim.opt.hlsearch = false -- highlight doesn't persist after search
vim.opt.ic = true -- ignore case in search patterns
vim.opt.iskeyword:append("-") -- treat split words as single words
vim.opt.laststatus = 1 -- resets custom statusline colours
vim.opt.nu = true -- line numbers
vim.opt.rnu = true -- relative line numbers
vim.opt.scrolloff = 4 -- vertical scroll boundaries
vim.opt.showmode = false -- hide mode indicator
vim.opt.sidescrolloff = 12 -- horizontal scroll boundaries
vim.opt.signcolumn = "auto" -- use dedicated smart column for signs
vim.opt.smartcase = true -- smart case-insensitive search
vim.opt.sts = 4 -- number of spaces that a tab counts for while editing
vim.opt.sw = 4 -- number of spaces to use for autoindent
vim.opt.swf = false -- stop autocreating swapfiles
vim.opt.ts = 4 -- number of spaces that a tab counts for
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo" -- directory for undo files
vim.opt.undofile = true -- create undo files
vim.opt.updatetime = 50 -- delay until swapfile is written
vim.opt.wrap = false -- no line-wrapping

vim.cmd("au FileType go setl noet sw=0")
vim.cmd("au FileType html setl sts=2 sw=2 ts=2")
vim.cmd("au FileType javascript setl sts=2 sw=2 ts=2")
vim.cmd("au FileType javascriptreact setl sts=2 sw=2 ts=2")
vim.cmd("au FileType svelte setl sts=2 sw=2 ts=2")
vim.cmd("au FileType typescript setl sts=2 sw=2 ts=2")
vim.cmd("au FileType typescriptreact setl sts=2 sw=2 ts=2")
vim.cmd("au FileType yaml setl sts=2 sw=2 ts=2")
