vim.cmd("au BufNewFile,BufReadPost '*.md' set filetype=markdown")
vim.cmd("au FileType gitcommit setl wrap spell")
vim.cmd("au FileType go setl noet")
vim.cmd("au FileType make setl noet sts=0 sw=8 ts=8")
vim.cmd("au FileType markdown setl spell sts=2 sw=2 ts=2")

local frontend = {
	"css",
	"graphql",
	"html",
	"javascript",
	"javascriptreact",
	"json",
	"less",
	"scss",
	"svelte",
	"typescript",
	"typescriptreact",
	"vue",
	"yaml",
}

for i = 1, #frontend do
	vim.cmd("au FileType " .. frontend[i] .. " setl sts=2 sw=2 ts=2")
end
