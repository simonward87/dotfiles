vim.cmd("colorscheme tender")

-- Custom highlights
local hl = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local palette = {
	-- background colors
	bg_dark     = "#1d1d1d",
	bg          = "#282828",
	tabline     = "#323232",
	bg_light    = "#444444",
	bg_contrast = "#9a9a9a",
	-- foreground colors
	fg          = "#eeeeee",
	comment     = "#666666",
	red         = "#f43753",
	green       = "#c9d05c",
	yellow      = "#ffc24b",
	blue_light  = "#b3deef",
	brown       = "#d3b987",
	blue        = "#73cef4",
	blue_dim    = "#476572",
	transparent = "none",
}

hl("ColorColumn", { bg = palette.bg })
hl("LineNr", { fg = palette.comment }) -- increase contrast
hl("Pmenu", { bg = palette.bg })
hl("PmenuSbar", { fg = palette.bg, bg = palette.bg })
hl("PmenuSel", { fg = palette.bg, bg = palette.blue_light })
hl("PmenuThumb", { fg = palette.comment, bg = palette.comment })
hl("Search", { fg = palette.bg_dark, bg = palette.green })
hl("WhitespaceEOL", { bg = palette.comment })
hl("FloatBorder", { bg = palette.bg })

local hl_groups = { "Normal", "SignColumn", "TreesitterContext" }

for i = 1, #hl_groups do
	hl(hl_groups[i], { bg = palette.bg_dark })
end
