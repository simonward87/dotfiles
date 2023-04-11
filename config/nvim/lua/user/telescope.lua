local t_ok, telescope = pcall(require, "telescope")
if not t_ok then
	return
end

local a_ok, actions = pcall(require, "telescope.actions")
if not a_ok then
	return
end

telescope.setup({
	defaults = {
		border = false,
		prompt_prefix = " ",
		-- selection_caret = " ",
		path_display = { "smart" },
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-u>"] = false,
			}, -- i is insert mode
			n = {}, -- n is normal mode
		},
	},
})
