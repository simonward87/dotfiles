local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- setup leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ** available modes **
--   normal = "n"
--   insert = "i"
--   visual = "v"
--   visual block = "x"
--   terminal = "t"
--   command = "c"

-- window navigation
keymap("n", "<leader>h", "<C-w>h", opts)     -- move left
keymap("n", "<leader>j", "<C-w>j", opts)     -- move down
keymap("n", "<leader>k", "<C-w>k", opts)     -- move up
keymap("n", "<leader>l", "<C-w>l", opts)     -- move right
keymap("n", "<leader>d", ":Bdelete<CR>", opts)     -- delete buffer
-- keymap("n", "<leader>x", ":w|bd<CR>", opts)  -- write and close buffer

-- buffer navigation
keymap("n", "L", ":bn<CR>", opts)  -- next buffer
keymap("n", "H", ":bp<CR>", opts)  -- prev buffer

-- shift text blocks vertically
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- persist indentation mode
keymap("v", "<", "<gv", opts)  -- prev buffer
keymap("v", ">", ">gv", opts)  -- prev buffer

-- git
keymap("n", "<leader>gs", ":G<CR>", opts)
keymap("n", "<leader>gc", ":G commit<CR>", opts)
keymap("n", "<leader>gp", ":G push<CR>", opts)

-- telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
