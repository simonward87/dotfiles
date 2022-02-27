local util = require("lspconfig").util

return {
	settings = {
		root_dir = util.root_pattern("deno.json"),
		init_options = {
			lint = true,
		},
	},
}
