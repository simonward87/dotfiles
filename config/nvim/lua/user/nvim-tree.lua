local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

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
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
		number = true,
		relativenumber = true,
		hide_root_folder = true,
	},
	filters = {
		custom = {
			"^.git$",
		},
	},
})

-- auto-open when target is a directory
local function open_nvim_tree(data)
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	vim.cmd.cd(data.file)

	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
