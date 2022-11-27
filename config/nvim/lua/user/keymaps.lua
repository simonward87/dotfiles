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

-- temporary unbind <Tab> in INSERT to promote <C-t> and <C-d>
keymap("i", "<Tab>", "<Nop>", opts)

-- window navigation
keymap("n", "<Left>", "<C-w>h", opts) -- move left
keymap("n", "<Right>", "<C-w>l", opts) -- move right
keymap("n", "<Down>", "<C-w>j", opts) -- move down
keymap("n", "<Up>", "<C-w>k", opts) -- move up

-- buffer navigation
keymap("n", "<C-n>", ":bn<CR>", opts) -- next buffer
keymap("n", "<C-p>", ":bp<CR>", opts) -- prev buffer
keymap("n", "<leader>d", ":bd<CR>", opts)
keymap("n", "tt", ":tab split<CR>", opts)

-- shift text blocks vertically
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("i", "<C-j>", "<esc>:move .+1<CR>==a", opts)
keymap("i", "<C-k>", "<esc>:move .-2<CR>==a", opts)
keymap("n", "<leader>j", ":move .+1<CR>==", opts)
keymap("n", "<leader>k", ":move .-2<CR>==", opts)

-- undo breakpoints
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- autocenter when word searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- autocenter when jumping
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- reload colourschemes
keymap("n", "<leader><CR>", ":source ~/.config/nvim/lua/user/colorscheme.lua<CR>", opts)

-- git
keymap("n", "<leader>gs", ":G<CR>", opts)
keymap("n", "<leader>gc", ":G commit -v -q<CR>", opts)
keymap("n", "<leader>gd", ":G diff<CR>", opts)
keymap("n", "<leader>gl", ":G log<CR>", opts)
keymap("n", "<leader>gp", ":G push<CR>", opts)

-- formatter
keymap("n", "<leader>p", ":Format<CR>", opts)

-- telescope
keymap(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
	opts
)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<CR>", opts)

-- nvim-tree
keymap("n", "-", ":NvimTreeToggle<CR>", opts)

-- commands
keymap("n", "<leader>ll", ":!gls -Fho --group-directories-first<CR>", opts)
keymap("n", "<leader>la", ":!gls -AFho --group-directories-first<CR>", opts)

-- tinygo
keymap("n", "<leader>ta", ":TinygoTarget arduino<CR>", opts)
keymap("n", "<leader>tp", ":TinygoTarget pico<CR>", opts)
keymap("n", "<leader>ts", ":TinygoTarget -<CR>", opts)
