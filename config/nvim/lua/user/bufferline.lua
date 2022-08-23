local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		indicator = {
			icon = " ",
			style = "icon",
		},
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 0,
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_tab_indicators = false,
		show_close_icon = false,
		separator_style = { "", "" },
	},
})
