local util = require("lspconfig").util

return {
	init_options = {
		lint = true,
	},
	root_dir = util.root_pattern("package.json"),
}
