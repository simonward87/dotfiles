local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		-- always_show_bufferline = false, -- only visibible with 2 or more buffers
		indicator = {
			style = "none",
		},
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		offsets = {
			{
				filetype = "NvimTree",
				-- text = "",
				highlight = "Comment",
				separator = true,
				text_align = "left",
			},
		},
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
		tab = {
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		tab_selected = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		tab_separator = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		tab_separator_selected = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		tab_close = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		close_button = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		close_button_visible = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		close_button_selected = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		buffer_visible = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		buffer_selected = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		numbers = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		numbers_visible = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		numbers_selected = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		modified = {
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		modified_visible = {
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		modified_selected = {
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		duplicate_selected = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
			italic = false,
		},
		duplicate_visible = {
			fg = {
				attribute = "fg",
				highlight = "LineNr",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
			italic = false,
		},
		duplicate = {
			fg = {
				attribute = "fg",
				highlight = "LineNr",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
			italic = false,
		},
		separator_selected = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		separator_visible = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		separator = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		indicator_visible = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		indicator_selected = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		pick_selected = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		pick_visible = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		pick = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		offset_separator = {
			fg = {
				attribute = "fg",
				highlight = "Normal",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
		trunc_marker = {
			fg = {
				attribute = "fg",
				highlight = "LineNr",
			},
			bg = {
				attribute = "bg",
				highlight = "Normal",
			},
		},
	},
})
