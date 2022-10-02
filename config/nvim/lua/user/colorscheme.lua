local colorscheme = "tender"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- custom highlights
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE") -- transparent bg

-- global options
vim.g["gruvbox_material_palette"] = "mix"

if colorscheme == "tender" then
	vim.cmd("hi Normal guibg=#1E1E1E ctermbg=NONE") -- transparent bg
	vim.cmd("hi SignColumn guibg=bg") -- terminal color sign col
	vim.cmd("hi TreesitterContext guibg=bg") -- transparent tscontext bg

	vim.wo.fillchars = "eob: " -- hide end of buffer characters
end
