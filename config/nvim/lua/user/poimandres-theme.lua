local status_ok, poimandres = pcall(require, "poimandres")
if not status_ok then
	return
end

poimandres.setup({
	bold_vert_split = false, -- use bold vertical separators
	dim_nc_background = false, -- dim 'non-current' window backgrounds
	disable_background = true, -- disable background
	disable_float_background = false, -- disable background for floats
	disable_italics = false, -- disable italics
})
