vim.o.background = "light"
vim.g["gruvbox_material_palette"] = "mix"

local colorscheme = "github_light"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

vim.cmd("hi Normal guibg=NONE ctermbg=NONE") -- transparent bg
vim.cmd("hi SignColumn guibg=terminal") -- terminal color sign col

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
