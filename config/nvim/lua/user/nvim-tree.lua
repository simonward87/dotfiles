local M = {}

local api_status_ok, api = pcall(require, "nvim-tree.api")
if not api_status_ok then
	return
end

local tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not tree_status_ok then
	return
end

function M.on_attach(bufnr)
	vim.keymap.set(
		"n",
		"l",
		api.node.open.edit,
		{ desc = "Edit", buffer = bufnr, noremap = true, silent = true, nowait = true }
	)
	vim.keymap.set(
		"n",
		"h",
		api.node.navigate.parent_close,
		{ desc = "Close node", buffer = bufnr, noremap = true, silent = true, nowait = true }
	)
	vim.keymap.set(
		"n",
		"h",
		api.tree.toggle_help,
		{ desc = "Help", buffer = bufnr, noremap = true, silent = true, nowait = true }
	)
	vim.keymap.set(
		"n",
		"?",
		api.tree.toggle_help,
		{ desc = "Help", buffer = bufnr, noremap = true, silent = true, nowait = true }
	)
	vim.keymap.set(
		"n",
		"p",
		M.print_node_path,
		{ desc = "Print", buffer = bufnr, noremap = true, silent = true, nowait = true }
	)
end

function M.print_node_path()
	local node = api.tree.get_node_under_cursor()
	print(node.absolute_path)
end

nvim_tree.setup({
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	disable_netrw = true,
	filters = {
		custom = {
			"^.git$",
		},
	},
	on_attach = M.on_attach,
	renderer = {
		add_trailing = true,
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
	view = {
		width = 40,
		number = true,
		relativenumber = true,
		hide_root_folder = true,
	},
})

-- auto-open when target is a directory
local function open_nvim_tree(data)
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	vim.cmd.cd(data.file)
	api.tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
