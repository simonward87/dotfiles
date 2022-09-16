local status_ok, github_theme = pcall(require, "github-theme")
if not status_ok then
	return
end

github_theme.setup({
	comment_style = "italic",
	dark_float = true,
	dark_sidebar = false,
	hide_end_of_buffer = true,
	keyword_style = "NONE",
	overrides = function(c)
		return {
			TreesitterContext = { fg = "#24292f", bg = "terminal" },
		}
	end,
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
	theme_style = "light",
	transparent = true,
})
