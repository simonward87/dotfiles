local status_ok, github_theme = pcall(require, "github-theme")
if not status_ok then
	return
end

local appearance = "light"

local palette = {
	-- Background Colors
	bg = "#ffffff",
	bg2 = "#f6f8fa",

	-- foreground colors
	fg = "#24292f",
	fg_dark = "#666666",
	fg_gutter = "#babbbd",
	fg_light = "#586069",
	fg_term = "#24292f",

	-- Background Highlights Colors
	bg_highlight = "#d5e5f6",
	bg_search = "#fff2be",
	bg_visual = "#e1e4e8",
	bg_visual_selection = "#dbe9f9",
	border = "#044289",

	-- Cursor & LineNumber Colors
	cursor = "#044289",
	cursor_line_nr = "#24292e",
	line_nr = "#babbbd",

	-- LSP & Diagnostic Colors
	error = "#cb2431",
	warning = "#bf8803",
	info = "#75beff",
	hint = "#6c6c6c",
	lsp = { ref_txt = "#c6eed2" },

	-- Auto-Complication Colors
	pmenu = { bg = "#f6f8fa", sbar = "#f0f1f3" },

	-- Syntax Colors
	syntax = {
		comment = "#6a737d",
		constant = "#005cc5",
		string = "#032f62",
		variable = "#005cc5",
		keyword = "#d73a49",
		func = "#6f42c1",
		func_param = "#24292e",
		match_paren_bg = "#c6eed2",
		tag = "#22863a",
		html_arg = "#b31d28",
		param = "#e36209",
		json_label = "#005cc5",
	},
}

github_theme.setup({
	dark_float = true,
	dark_sidebar = false,
	hide_end_of_buffer = false,
	keyword_style = "NONE",
	overrides = function(_)
		return {
			ColorColumn = { bg = palette.bg2 },
			TreesitterContext = {
				fg = palette.fg,
				bg = "terminal",
			},
			SpellBad = {
				fg = palette.error, -- increase visibility
				bg = "terminal",
			},
			LineNr = {
				fg = palette.hint,
				bg = "terminal",
			},
			-- CursorLineNr = {
			-- 	fg = palette.syntax.constant,
			-- 	bg = "terminal",
			-- },
		}
	end,
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
	theme_style = appearance,
	transparent = true,
})

vim.o.background = appearance
