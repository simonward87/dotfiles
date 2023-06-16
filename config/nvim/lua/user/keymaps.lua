local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- setup leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- | modes              |
-- |--------------------|
-- | "n" | normal       |
-- | "i" | insert       |
-- | "v" | visual       |
-- | "x" | visual block |
-- | "t" | terminal     |
-- | "c" | command      |

-- temporary unbinds to promote proper motions
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Up>", "<Nop>", opts)
keymap("i", "<Tab>", "<Nop>", opts)

-- window navigation
keymap("n", "<Left>", "<C-w>h", opts) -- moves to left window
keymap("n", "<Right>", "<C-w>l", opts) -- moves to right window
keymap("n", "<Down>", "<C-w>j", opts) -- moves to window below
keymap("n", "<Up>", "<C-w>k", opts) -- moves to window above

-- buffer navigation
keymap("n", "<C-n>", ":bn<CR>", opts) -- moves to next buffer
keymap("n", "<C-p>", ":bp<CR>", opts) -- moves to previous buffer
keymap("n", "<leader>d", ":bd<CR>", opts) -- deletes current buffer
keymap("n", "tt", ":tab split<CR>", opts) -- opens current buffer in new tab
keymap("n", "<leader>nw", ":noa w<CR>", opts) -- saves without formatting

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

-- toggle ColorColumn
keymap("n", "<leader>cc", [[:execute "set cc=" . (&colorcolumn == "" ? "74" : "")<CR>]], opts)

-- remap to avoid collision with tmux prefix
keymap("n", "<C-c>", "<C-a>", opts)
keymap("v", "<C-c>", "<C-a>", opts)
keymap("v", "g<C-c>", "g<C-a>", opts)

-- git
keymap("n", "<leader>gs", ":G<CR>", opts)
keymap("n", "<leader>gc", ":G commit -v -q<CR>", opts)
keymap("n", "<leader>gd", ":G diff<CR>", opts)
keymap("n", "<leader>gl", ":G log<CR>", opts)
keymap("n", "<leader>gp", ":G push<CR>", opts)

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

-- under cursor TS capture group
keymap("n", "<C-e>", ":TSHighlightCapturesUnderCursor<CR>", opts)

-- markdown convenience mappings
keymap("n", "<leader>ui", "viw<esc>bi[<esc>ea]()<esc>i", opts) -- markdown format word under cursor as url, and enter INSERT
keymap("v", "<leader>ui", "<esc>`>a]<esc>`<<esc>i[<esc>%a()<esc>i", opts) -- markdown format selection as url, and enter INSERT
keymap("n", "<leader>up", "viw<esc>bi[<esc>ea](<C-r>+)<esc>", opts) -- markdown format word under cursor as url, and populate from unnamed register
keymap("v", "<leader>up", "<esc>`>a]<esc>`<<esc>i[<esc>%a(<C-r>+)<esc>", opts) -- markdown format selection as url, and populate from unnamed register
keymap("n", "<leader>b", "viw<esc>bi**<esc>ea**<esc>", opts) -- markdown format word under cursor as bold
keymap("v", "<leader>b", "<esc>`>a**<esc>`<<esc>i**<esc>`><esc>ll", opts) -- markdown format selection as bold

-- convenience abbreviations
vim.cmd("iabbrev @@ 39803787+simonward87@users.noreply.github.com")

-- spell abbreviations
vim.cmd("iabbrev reutrn return")
vim.cmd("iabbrev teh the")
vim.cmd("iabbrev seperate separate")
