vim.opt.backup = false                                                  -- stop autocreating backups
vim.opt.clipboard:append('unnamedplus')                                 -- use mac system clipboard by default
vim.opt.colorcolumn = '80'                                              -- 80 character guide rule
vim.opt.completeopt = { 'menuone', 'longest', 'noinsert', 'noselect' }  -- text completion
vim.opt.cursorline = true                                               -- highlight current line
vim.opt.expandtab = true                                                -- insert spaces for tabs
vim.opt.exrc = true 			                                              -- allow local vimrc
vim.opt.termguicolors = true
vim.opt.hidden = true                                                   -- allow background unsaved buffers
vim.opt.hlsearch = false                                                -- highlight doesn't persist after search
vim.opt.ic = true                                                       -- ignore case in search patterns
vim.opt.iskeyword:append('-')                                           -- treat split words as single words
vim.opt.nu = true                                                       -- line numbers
vim.opt.rnu = true                                                      -- relative line numbers
vim.opt.scrolloff = 8                                                   -- vertical scroll boundaries
vim.opt.showmode = false                                                -- hide mode indicator
vim.opt.sidescrolloff = 12                                              -- horizontal scroll boundaries
vim.opt.signcolumn = 'number'                                           -- use line number column for signs
vim.opt.smartcase = true                                                -- smart case-insensitive search
vim.opt.sts = 2                                                         -- number of spaces that a tab counts for
vim.opt.sw = 2                                                          -- number of spaces to use for autoindent
vim.opt.swf = false                                                     -- stop autocreating swapfiles
vim.opt.ts = 2                                                          -- number of spaces that a tab counts for
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'                   -- directory for undo files
vim.opt.undofile = true                                                 -- create undo files
vim.opt.updatetime = 50                                                 -- delay until swapfile is written
vim.opt.wrap = false                                                    -- no line-wrapping
