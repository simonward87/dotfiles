-- go.mod files incorrectly read as 'rapid' — temporary fix:
vim.cmd("au BufRead,BufNewFile go.mod setf gomod")
vim.cmd("au BufRead,BufNewFile Dockerfile.dev setf dockerfile")
vim.cmd("au BufRead,BufNewFile *.gohtml setf html")
vim.cmd("au BufRead,BufNewFile zprofile setf zsh")
vim.cmd("au FileType gitcommit setl wrap spell tw=72")
vim.cmd("au FileType go setl noet")
vim.cmd("au FileType lua setl noet")
vim.cmd("au FileType make setl noet sts=0 sw=8 ts=8")
vim.cmd("au FileType markdown setl spell")
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
	"markdown",
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

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Brief highlight when yanking
autocmd("TextYankPost", {
	group = augroup("HighlightYank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Don't spellcheck URLs and basic acronyms
autocmd("BufEnter", {
	group = augroup("SpellIgnore", { clear = true }),
	callback = function()
		vim.cmd([=[syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell]=])
		vim.cmd([[syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell]])
	end,
})
