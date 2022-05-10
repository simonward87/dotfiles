local util = require("lspconfig").util

-- root_dir can be enabled if using denols - by making root_dir explicitly require
-- package.json, tsserver will not be started when working on deno projects.
return {
	init_options = {
		lint = true,
	},
	-- root_dir = util.root_pattern("package.json"),
}
