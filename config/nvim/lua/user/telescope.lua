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
		prompt_prefix = " ",
		-- selection_caret = " ",
		path_display = { "smart" },
		mappings = {
			i = {
				-- i is insert mode
				["<esc>"] = actions.close,
				["<C-u>"] = false,
			},
			n = {}, -- n is normal mode
		},
	},
})
