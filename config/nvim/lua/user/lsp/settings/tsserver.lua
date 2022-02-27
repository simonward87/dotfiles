local util = require("lspconfig").util

return {
	settings = {
		root_dir = util.root_pattern("package.json"),
		init_options = {
			lint = true,
		},
	},
}
