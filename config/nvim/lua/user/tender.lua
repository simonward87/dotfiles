vim.cmd("colorscheme tender")

-- Custom highlights
local hl = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local bg = "#1d1d1d"
local comment = "#666666"
local green = "#c9d05c"
-- local dim_blue = "#476572"

hl("LineNr", {
	fg = comment, -- increase contrast
})

hl("Search", {
	fg = bg,
	bg = green,
})

hl("WhitespaceEOL", {
	bg = comment,
})

local hl_groups = { "Normal", "SignColumn", "TreesitterContext" }

for i = 1, #hl_groups do
	hl(hl_groups[i], { bg = bg })
end
