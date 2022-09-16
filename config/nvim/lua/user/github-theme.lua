local status_ok, github_theme = pcall(require, "github-theme")
if not status_ok then
	return
end

github_theme.setup({
	theme_style = "light",
	transparent = true,
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
	overrides = function(c)
		return {
			TreesitterContext = { fg = "#24292f", bg = "terminal" },
		}
	end,
})
