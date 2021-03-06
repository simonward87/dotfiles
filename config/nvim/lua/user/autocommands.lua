-- go.mod files incorrectly read as 'rapid' — temporary fix:
vim.cmd("au BufRead,BufNewFile go.mod setf gomod")
vim.cmd("au BufRead,BufNewFile Dockerfile.dev setf dockerfile")
vim.cmd("au BufRead,BufNewFile *.gohtml setf html")
vim.cmd("au BufRead,BufNewFile zprofile setf zsh")
vim.cmd("au FileType gitcommit setl wrap spell")
vim.cmd("au FileType go setl noet")
vim.cmd("au FileType lua setl noet")
vim.cmd("au FileType make setl noet sts=0 sw=8 ts=8")
vim.cmd("au FileType markdown setl spell sts=2 sw=2 ts=2")
vim.cmd("au FileType prisma setl cindent")

local frontend_filetypes = {
	"css",
	"graphql",
	"html",
	"javascript",
	"javascriptreact",
	"javascript.jsx",
	"json",
	"less",
	"prisma",
	"scss",
	"svelte",
	"typescript",
	"typescriptreact",
	"typescript.tsx",
	"vue",
	"yaml",
}

for i = 1, #frontend_filetypes do
	vim.cmd("au FileType " .. frontend_filetypes[i] .. " setl sts=2 sw=2 ts=2")
end
