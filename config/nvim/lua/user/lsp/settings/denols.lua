local util = require("lspconfig").util

return {
	root_dir = util.root_pattern("deno.json", "deno.jsonc", "mod.ts"),
	init_options = {
		lint = true,
	},
}
