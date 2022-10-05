local colorscheme = "tender"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

local hl = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local hl_groups = {
	"EndOfBuffer",
	"Normal",
	"SignColumn",
	"TreesitterContext",
}
local bg = "none"

-- Custom colours
if colorscheme == "tender" then
	bg = "#1d1d1d"

	hl("LineNr", {
		fg = "#666666", -- increase contrast
		-- fg = "#476572", -- tinted alternative
	})
elseif colorscheme == "gruvbox-material" then
	bg = "#1d2021"

	vim.g["gruvbox_material_palette"] = "mix"
elseif colorscheme == "catppuccin" then
	require("user.catppuccin-theme")

	bg = "#1E1E2E"
elseif colorscheme == "poimandres" then
	bg = "#1B1E28"
	require("user.poimandres-theme")
elseif colorscheme == "github_light" then
	require("user.github-light")

	bg = "#FFFFFF"

	hl("SpellBad", {
		fg = "#cb2431", -- increase visibility
	})
	hl("LineNr", {
		fg = "#6a737d", -- reduce contrast
	})
elseif colorscheme == "github_dark" then
	require("user.github-dark")

	bg = "#24292E"
end

for i = 1, #hl_groups do
	hl(hl_groups[i], { bg = bg })
end
