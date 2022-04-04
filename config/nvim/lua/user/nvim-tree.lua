vim.g.nvim_tree_icons = {
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
}

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
	-- update_to_buf_dir = {
	-- 	enable = false,
	-- },
	-- disable_netrw = true,
	-- hijack_netrw = true,
	-- open_on_setup = true,
	-- ignore_ft_on_setup = {
	-- 	"startify",
	-- 	"dashboard",
	-- 	"alpha",
	-- },
	-- -- auto_close = true,
	-- -- open_on_tab = false,
	-- -- hijack_cursor = false,
	-- update_cwd = true,
	-- -- update_to_buf_dir = {
	-- --   enable = true,
	-- --   auto_open = true,
	-- -- },
	-- -- --   error
	-- -- --   info
	-- -- --   question
	-- -- --   warning
	-- -- --   lightbulb
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
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
	},
	quit_on_open = 1,
	git_hl = 1,
	show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
	},
})
