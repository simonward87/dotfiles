vim.cmd("colorscheme tender")

-- Custom highlights
local hl = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local bg_dark = "#1d1d1d"
local bg = "#282828"
local comment = "#666666"
local green = "#c9d05c"
local blue_light = "#b3deef"
-- local blue = "#73cef4"
-- local fg = "#eeeeee"
-- local brown = "#d3b987"
-- local dim_blue = "#476572"
-- local tabline = "#323232"
-- local bg_light = "#444444"
-- local bg_contrast = "#9a9a9a"

hl("LineNr", { fg = comment }) -- increase contrast
hl("Search", { fg = bg_dark, bg = green })
hl("WhitespaceEOL", { bg = comment })
hl("Pmenu", { bg = bg })
hl("PmenuSel", { fg = bg, bg = blue_light })
hl("PmenuSbar", { fg = bg, bg = bg })
hl("PmenuThumb", { fg = comment, bg = comment })

local hl_groups = { "Normal", "SignColumn", "TreesitterContext" }

for i = 1, #hl_groups do
	hl(hl_groups[i], { bg = bg_dark })
end
