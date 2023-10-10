local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
	return
end

vim.opt.list = true

ibl.setup({
	indent = {
		char = "▏",
		tab_char = "▏",
		-- char = "▎",
		-- tab_char = "▎",
	},
	scope = {
		show_start = false,
		show_end = false,
	},
})
