local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"arduino",
		"astro",
		"awk",
		"bash",
		"c",
		"cmake",
		"comment",
		"css",
		"dart",
		"diff",
		"dockerfile",
		"embedded_template",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"gitignore",
		"go",
		"gomod",
		"gosum",
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
		"luadoc",
		"make",
		"markdown",
		"markdown_inline",
		"pem",
		"prisma",
		"proto",
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
		"zig",
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
