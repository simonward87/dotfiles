local colorscheme = "github_light"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

local hl = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local bg = "none"
local hl_groups = {
	"Normal",
	"SignColumn",
	"TreesitterContext",
}

if colorscheme == "tender" then
	bg = "#1E1E1E"
elseif colorscheme == "gruvbox-material" then
	vim.g["gruvbox_material_palette"] = "mix"
elseif colorscheme == "catppuccin" then
	require("user.catppuccin-theme")
elseif colorscheme == "poimandres" then
	require("user.poimandres-theme")
elseif colorscheme == "github_light" then
	bg = "#FFFFFF"
	require("user.github-light")
elseif colorscheme == "github_dark" then
	bg = "#24292E"
	require("user.github-dark")
end

for i = 1, #hl_groups do
	hl(hl_groups[i], { bg = bg })
end
