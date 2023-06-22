local function map(mode, l, r, opts)
	local defaults = { noremap = true, silent = true }
	opts = opts or defaults
	vim.keymap.set(mode, l, r, opts)
end

-- setup leader
map("", "<Space>", "<Nop>")
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

-- temporary unbinds
map("i", "<Tab>", "<Nop>")

-- window navigation
map("n", "<Left>", "<C-w>h") -- moves to left window
map("n", "<Right>", "<C-w>l") -- moves to right window
map("n", "<Down>", "<C-w>j") -- moves to window below
map("n", "<Up>", "<C-w>k") -- moves to window above

-- buffer navigation
map("n", "<C-n>", ":bn<CR>") -- moves to next buffer
map("n", "<C-p>", ":bp<CR>") -- moves to previous buffer
map("n", "<leader>d", ":bd<CR>") -- deletes current buffer
map("n", "tt", ":tab split<CR>") -- opens current buffer in new tab
map("n", "<leader>nw", ":noa w<CR>") -- saves without formatting

-- shift text blocks vertically
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("i", "<C-j>", "<esc>:move .+1<CR>==a")
map("i", "<C-k>", "<esc>:move .-2<CR>==a")
map("n", "<leader>j", ":move .+1<CR>==")
map("n", "<leader>k", ":move .-2<CR>==")

-- undo breakpoints
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")

-- autocenter when word searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- autocenter when jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- reload colourschemes
map("n", "<leader><CR>", ":source ~/.config/nvim/lua/user/colorscheme.lua<CR>")

-- toggle ColorColumn
map("n", "<leader>cc", [[:execute "set cc=" . (&colorcolumn == "" ? "74" : "")<CR>]])

-- remap to avoid collision with tmux prefix
map("n", "<C-c>", "<C-a>")
map("v", "<C-c>", "<C-a>")
map("v", "g<C-c>", "g<C-a>")

-- git
map("n", "<leader>gs", ":G<CR>")
map("n", "<leader>gc", ":G commit -v -q<CR>")
map("n", "<leader>gd", ":G diff<CR>")
map("n", "<leader>gl", ":G log<CR>")
map("n", "<leader>gp", ":G push<CR>")

-- telescope
map(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>"
)
map("n", "<c-t>", "<cmd>Telescope live_grep<CR>")

-- nvim-tree
map("n", "-", ":NvimTreeToggle<CR>")

-- commands
map("n", "<leader>ll", ":!gls -Fho --group-directories-first<CR>")
map("n", "<leader>la", ":!gls -AFho --group-directories-first<CR>")

-- under cursor TS capture group
map("n", "<C-e>", ":TSHighlightCapturesUnderCursor<CR>")

-- markdown convenience maps
map("n", "<leader>cl", "viw<esc>bi[<esc>ea]()<esc>i") -- markdown format word under cursor as url, and enter INSERT
map("v", "<leader>cl", "<esc>`>a]<esc>`<<esc>i[<esc>%a()<esc>i") -- markdown format selection as url, and enter INSERT
map("n", "<leader>cL", "viw<esc>bi[<esc>ea](<C-r>+)<esc>") -- markdown format word under cursor as url, and populate from unnamed register
map("v", "<leader>cL", "<esc>`>a]<esc>`<<esc>i[<esc>%a(<C-r>+)<esc>") -- markdown format selection as url, and populate from unnamed register
map("n", "<leader>cb", "viw<esc>bi**<esc>ea**<esc>") -- markdown format word under cursor as bold
map("v", "<leader>cb", "<esc>`>a**<esc>`<<esc>i**<esc>`><esc>ll") -- markdown format selection as bold

-- go convenience maps
map("n", "<leader>ct", 'vi}:norm A `json:""`<CR>vi}:lua vim.lsp.buf.format()<CR>`<$hi') -- add empty json struct tags to all fields inside struct under cursor, and enter INSERT

-- convenience abbreviations
vim.cmd("iabbrev @@ 39803787+simonward87@users.noreply.github.com")

-- spell abbreviations
vim.cmd("iabbrev reutrn return")
vim.cmd("iabbrev teh the")
vim.cmd("iabbrev seperate separate")
