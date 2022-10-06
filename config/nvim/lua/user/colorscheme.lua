local c = "tender"

local custom_opts_loaded, _ = pcall(require, "user." .. c)

if custom_opts_loaded then
	return
else
	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. c)

	if not status_ok then
		vim.notify('Colorscheme "' .. c .. '" not found!')
		return
	end
end

vim.g["gruvbox_material_palette"] = "mix"
