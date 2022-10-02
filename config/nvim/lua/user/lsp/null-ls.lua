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
				"css",
				"graphql",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"less",
				"scss",
				"typescript",
				"typescriptreact",
				"vue",
				"yaml",
			},
			extra_args = { "--jsx-single-quote" },
			extra_filetypes = { "svelte" },
		}),
		formatting.rustfmt,
		formatting.stylua,
	},
	on_attach = function()
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
	end,
})
