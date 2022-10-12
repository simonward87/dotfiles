local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"css",
		"dart",
		"dockerfile",
		"go",
		"gomod",
		"gowork",
		"graphql",
		"hjson",
		"html",
		"http",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"jsonc",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"prisma",
		"pug",
		"python",
		"query",
		"regex",
		"rust",
		"scss",
		"solidity",
		"sql",
		"svelte",
		"swift",
		"todotxt",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vue",
		"yaml",
	},
	sync_install = false,
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = {
			"prisma",
			"yaml",
		},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
