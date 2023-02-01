vim.g["loaded_perl_provider"] = 0
vim.g["python3_host_prog"] = "/opt/homebrew/bin/python3"
vim.g["loaded_netrw"] = 1 -- disable netrw
vim.g["loaded_netrwPlugin"] = 1 -- disable netrw

require("user.options")
require("user.autocommands")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.impatient")
require("user.indent")
require("user.scrollbar")
require("user.colorizer")
require("user.bufferline")
require("user.treesitter-ctx")
require("user.fidget")
require("user.zenmode")
