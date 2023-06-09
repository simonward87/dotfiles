local c = "drift-light"

local custom_opts_loaded, _ = pcall(require, "user." .. c)

if custom_opts_loaded then
	return
else
	local colorscheme_found, _ = pcall(vim.cmd, "colorscheme " .. c)

	if not colorscheme_found then
		vim.notify('Colorscheme "' .. c .. '" not found!')
		return
	end
end

vim.g["gruvbox_material_palette"] = "mix"
