local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		formatting.gofmt,
		formatting.nginx_beautifier,
		formatting.prettier.with({
			filetypes = { "markdown" },
			extra_args = { "--prose-wrap=always" },
		}),
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"graphql",
			},
			extra_args = { "--single-quote", "--prose-wrap=always" },
			extra_filetypes = { "svelte" },
		}),
		formatting.prettier.with({
			filetypes = { "json", "yaml" },
			extra_args = { "--tab-width=4" },
		}),
		formatting.rustfmt,
		formatting.stylua,
	},
	on_attach = function()
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end,
})
