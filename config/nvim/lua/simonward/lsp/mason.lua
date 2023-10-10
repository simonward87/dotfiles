local servers = {
	"astro",
	"bashls",
	"clangd",
	"cssls",
	"cssmodules_ls",
	"denols",
	"dockerls",
	"gopls",
	"graphql",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"prismals",
	"pyright",
	"rust_analyzer",
	"svelte",
	"tailwindcss",
	"templ",
	"tsserver",
	"yamlls",
}

-- TODO
-- Currently only tracking lsp servers — add DAP, linters, and formatters too

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("simonward.lsp.handlers").on_attach,
		capabilities = require("simonward.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "simonward.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
