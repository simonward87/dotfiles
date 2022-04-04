-- vim.o.background = "light"
local colorscheme = "tender"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- set transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- make SignCol transparent
vim.cmd("hi SignColumn guibg=terminal")

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
