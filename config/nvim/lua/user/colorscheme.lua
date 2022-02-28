vim.o.background = "light"
local colorscheme = "github"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- set transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
