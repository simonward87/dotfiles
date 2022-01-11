-- vim.o.background = "light"

-- local colorscheme = "everforest"
-- local colorscheme = "gruvbox-flat"
-- local colorscheme = "kanagawa"
-- local colorscheme = "iceberg"
local colorscheme = "tender"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
