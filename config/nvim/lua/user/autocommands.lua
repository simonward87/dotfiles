-- go.mod files incorrectly read as 'rapid' — temporary fix:
vim.cmd("autocmd BufRead,BufNewFile go.mod setfiletype gomod")
vim.cmd("autocmd BufRead,BufNewFile Dockerfile.dev setfiletype dockerfile")
vim.cmd("autocmd BufRead,BufNewFile *.gohtml setfiletype html")
vim.cmd("autocmd BufRead,BufNewFile zprofile setfiletype zsh")
vim.cmd("autocmd FileType gitcommit setlocal wrap spell textwidth=72")
vim.cmd("autocmd FileType go setlocal noexpandtab")
vim.cmd("autocmd FileType lua setlocal noexpandtab")
vim.cmd("autocmd FileType make setlocal noexpandtab softtabstop=0 shiftwidth=8 tabstop=8")
vim.cmd("autocmd FileType markdown setlocal spell") -- textwidth=80 desired but messes with tables
vim.cmd("autocmd FileType prisma setlocal cindent")

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
	vim.cmd("au FileType " .. frontend_filetypes[i] .. " setlocal softtabstop=2 shiftwidth=2 tabstop=2")
end

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
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
