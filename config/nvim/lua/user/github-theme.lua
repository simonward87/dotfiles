local status_ok, github_theme = pcall(require, "github-theme")
if not status_ok then
	return
end

github_theme.setup({
	dark_float = true,
	dark_sidebar = false,
	keyword_style = "NONE",
	overrides = function(_)
		return {
			TreesitterContext = { fg = "#24292f", bg = "terminal" },
		}
	end,
	sidebars = { "qf", "vista_kind", "telescope", "terminal", "packer" },
	theme_style = "light",
	transparent = true,
})

vim.o.background = "light"
