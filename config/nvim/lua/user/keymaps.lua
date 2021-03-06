local opts = { noremap = true, silent = true }
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
-- keymap("n", "<leader>h", "<C-w>h", opts) -- move left
-- keymap("n", "<leader>l", "<C-w>l", opts) -- move right
-- keymap("n", "<leader>j", "<C-w>j", opts) -- move down
-- keymap("n", "<leader>k", "<C-w>k", opts) -- move up

-- buffer navigation
keymap("n", "<Right>", ":bn<CR>", opts) -- next buffer
keymap("n", "<Left>", ":bp<CR>", opts) -- prev buffer
keymap("n", "<C-n>", ":bn<CR>", opts) -- next buffer
keymap("n", "<C-p>", ":bp<CR>", opts) -- prev buffer
keymap("n", "<leader>d", ":bd<CR>", opts)

-- shift text blocks vertically
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("i", "<C-j>", "<esc>:move .+1<CR>==a", opts)
keymap("i", "<C-k>", "<esc>:move .-2<CR>==a", opts)
keymap("n", "<leader>j", ":move .+1<CR>==", opts) -- clashes with window navigation custom maps
keymap("n", "<leader>k", ":move .-2<CR>==", opts) -- clashes with window navigation custom maps

-- undo breakpoints
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- autocenter when word searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- reload colourschemes
keymap("n", "<leader><CR>", ":source ~/.config/nvim/lua/user/colorscheme.lua<CR>", opts)

-- git
keymap("n", "<leader>gs", ":Git<CR>", opts)
keymap("n", "<leader>gc", ":Git commit --verbose<CR>", opts)
keymap("n", "<leader>gl", ":Git log<CR>", opts)
keymap("n", "<leader>gp", ":Git push<CR>", opts)

-- formatter
keymap("n", "<leader>p", ":Format<CR>", opts)

-- telescope
keymap(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- hardmode
keymap("n", "<leader>h", ":HardTimeToggle<CR>", opts)

-- nvim-tree
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "-", ":NvimTreeToggle<cr>", opts)
