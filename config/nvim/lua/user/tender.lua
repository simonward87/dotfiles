vim.cmd("colorscheme tender")

-- Custom highlights
local hl = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

hl("LineNr", {
	fg = "#666666", -- increase contrast, alt: #476572
})

hl("Search", {
	fg = "#1d1d1d",
	bg = "#c9d05c",
	-- fg = "#eeeeee",
	-- bg = "#666666",
})

local bg = "#1d1d1d"
local hl_groups = { "Normal", "SignColumn", "TreesitterContext" }

for i = 1, #hl_groups do
	hl(hl_groups[i], { bg = bg })
end
