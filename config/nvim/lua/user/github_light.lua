local status_ok, github_theme = pcall(require, "github-theme")
if not status_ok then
	return
end

local appearance = "light"

github_theme.setup({
	dark_float = true,
	dark_sidebar = false,
	hide_end_of_buffer = false,
	keyword_style = "NONE",
	overrides = function(_)
		return {
			TreesitterContext = { fg = "#24292f", bg = "terminal" },
			SpellBad = {
				fg = "#cb2431", -- increase visibility
				bg = "terminal",
			},
			LineNr = {
				fg = "#6a737d",
				bg = "terminal",
			},
		}
	end,
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
	theme_style = appearance,
	transparent = true,
})

vim.o.background = appearance
