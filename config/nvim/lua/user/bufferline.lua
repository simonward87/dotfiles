local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		-- always_show_bufferline = false, -- only visibible with 2 or more buffers
		indicator = {
			-- icon = " ",
			-- style = "icon",
			style = "none",
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
	highlights = {
		fill = {
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		background = {
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
	},
})
