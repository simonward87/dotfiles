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
			extra_args = { "--single-quote", "--prose-wrap=always" },
			extra_filetypes = { "svelte" },
		}),
		formatting.rustfmt,
		formatting.stylua,
	},
	on_attach = function()
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end,
})
